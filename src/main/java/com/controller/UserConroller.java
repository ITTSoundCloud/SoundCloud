package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Validator;

import org.springframework.boot.autoconfigure.web.ServerProperties.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.db.CommentDAO;
import com.db.LikeDAO;
import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.db.UserDAO;
import com.email.CodeGenerator;
import com.email.EmailSender;
import com.fasterxml.jackson.databind.deser.std.MapDeserializer;
import com.model.Comment;
import com.model.Song;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.PasswordValidator;
import com.validators.UsernameValidator;


@Controller
@MultipartConfig
public class UserConroller {
	
	private PasswordValidator passValidator = new PasswordValidator();
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String welcome(
		@RequestParam(value = "username") String username,
		@RequestParam(value = "password") String password,
		@RequestParam(value = "email") String email,
		HttpServletRequest request, Model model, HttpSession session) {
			
		User user = null;
        	user = new User(username, email, password);
        	String code = CodeGenerator.createCode();
        	session.setAttribute("verification", code);
        	session.setAttribute("currentUser", user);
            EmailSender.sendSimpleEmail(email, "Verification code for SoundCloud", "Your verification code for Soundcloud is " + code);
            
            	return "verify";
                                                          
        
         
	}
	
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	public String verify(
		@RequestParam(value = "code") String code,
		HttpServletRequest request, HttpSession session) {
		System.out.println(code);
		System.out.println((String) session.getAttribute("verification"));
		if (code.equals(session.getAttribute("verification").toString())) {
			UserDAO.getInstance().saveUser((User) session.getAttribute("currentUser"));
			return "search1";
		}
		return "verify";
         
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpSession session) {
		
		return "explore";
         
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String welcome(
			@RequestParam(value = "username-login") String username,
		HttpServletRequest request, Model model, HttpSession session) {
		
		if (session.getAttribute("user") == null) {					
		User user = UserDAO.getInstance().getUser(username);
		try {
			//TODO
			List<Comment> comments = CommentDAO.getInstance().getComments();
			model.addAttribute("allComments", comments);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUsername());
		 	Set<User> allUsers = UserDAO.getInstance().getAllUsers();
		 	List<Song> allSongs = SongDAO.getInstance().getAllSongs();
		 	
		 	for(User u : allUsers){
		 		System.out.println(u);
		 	}
		 	model.addAttribute("allUsers", allUsers);
		 	model.addAttribute("allSongs", allSongs);
		 	
		 	List<String> genres = SongDAO.getInstance().getGenres();
			model.addAttribute("genres", genres);

		}
            return "explore";                                                   


	}

		@RequestMapping(value = "/profile_{username}", method= RequestMethod.GET)
		public String giveUser(Model model, HttpSession session, 
				@PathVariable(value="username") String username){
			System.out.println(username + "v profile_{username}");
			User visitedUser = UserDAO.getInstance().getUser(username);
			model.addAttribute("user", visitedUser);
			User currentUser = (User) session.getAttribute("user");
			session.setAttribute("usernameToFollow", username);
			model.addAttribute("isFollowing", isFollowing(currentUser.getUserId(), visitedUser.getUserId())); // check in database if follow

			return "upload1";
		}
		
		@ResponseBody
		@RequestMapping(value="/follow", method = RequestMethod.POST)
		public void followUser(Model model,HttpSession session){
			User currentUser = (User) session.getAttribute("user");
			User visitedUser = UserDAO.getInstance().getUser(session.getAttribute("usernameToFollow").toString());
			System.out.println("kvo stava tuka follow");
			
				try {
					if(UserDAO.getInstance().followUser(currentUser.getUserId(),visitedUser.getUserId())){
						System.out.println("ok");
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		
		
		@ResponseBody
		@RequestMapping(value="/like", method = RequestMethod.POST)
		public void likeSong(Model model,HttpSession session){
			User currentUser = (User) session.getAttribute("user");
			System.out.println("kvo stava tuka ima li laikove??");
			Song visitedSongProfile = (Song) session.getAttribute("songToAddInPlaylist");
			model.addAttribute("song", visitedSongProfile);
			
				try {
					System.out.println("Ima laikove");
					LikeDAO.getInstance().likeSong(currentUser.getUserId(), visitedSongProfile.getSongId());
				} catch (SQLException e) {
					System.out.println(e.getMessage() + " problem with song like.");
				}
		}
		
			
				
		@ResponseBody
		@RequestMapping(value="/comment", method = RequestMethod.POST)
		public void comment(Model model,HttpSession session,
				@RequestParam (value="comment") String comment){
			User currentUser = (User) session.getAttribute("user");
			
			try {
				CommentDAO.getInstance().addComment(comment, currentUser.getUserId(), 1);
				System.out.println("tuk sme");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("mina");
				e.printStackTrace();
			}	
		}
				
		@ResponseBody
		@RequestMapping(value="/unFollow", method = RequestMethod.POST)
		public void unFollowUser(Model model,HttpSession session){
			User currentUser = (User) session.getAttribute("user");
			User visitedUser = UserDAO.getInstance().getUser(session.getAttribute("usernameToFollow").toString());
			System.out.println("kvo stava tuka unfollow");
			try {
				if(UserDAO.getInstance().unfollow(currentUser.getUserId(), visitedUser.getUserId())){
					System.out.println("izstrit");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	
	private boolean validateRegister(Model model, String username, String password, String email) {
		
		PasswordValidator passwordValidator = new PasswordValidator();

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()  && email != null && !email.isEmpty()) {
                if (!EmailValidator.validate(email)) {
                    model.addAttribute("ErrorRegMessage", "Wrong email format or it already exist.");
                    return false;
                }

            if (username.length() <= 30 && username.length() >= 3) {
                if (!UsernameValidator.validate(username)) {
                    model.addAttribute("ErrorRegMessage", "Username already exist");
                    return false;
                }
            } else {
                model.addAttribute("ErrorRegMessage", "Username length should be between 3 to 30 characters.");
                return false;
            }
            
            if (!passwordValidator.validate(password)) {
            	model.addAttribute("ErrorRegMessage", "Invalid password. It must contains ....");
                return false;
			}
                                  
        }      
        return true;
    }
	
	@ResponseBody
	@RequestMapping(value="/validateUser", method = RequestMethod.POST)
	public boolean validateUser(@RequestParam(value = "username") String username){
		System.out.println("validateUser");
		System.out.println(username);
		
		System.out.println("validation username for " + username);
		return UsernameValidator.validate(username);
	}
	
	@ResponseBody
	@RequestMapping(value="/validateEmail", method = RequestMethod.POST)
	public boolean validateEmail(@RequestParam(value = "email") String email){
		System.out.println("validation for " + email);
		System.out.println("validateEmail");
		return EmailValidator.validate(email);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/validatePassword", method = RequestMethod.POST)
	public boolean validatePassword(HttpServletRequest req){
		System.out.println("validation for " + req.getParameter("password"));
		System.out.println("validatePassword");
		return this.passValidator.validate(req.getParameter("password"));

	}
	
	
	@ResponseBody
	@RequestMapping(value="/validateEverything", method = RequestMethod.POST)
	public boolean validateEverything(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "email") String email,
			HttpServletRequest request, Model model){
		System.out.println("validateEverything");
		return EmailValidator.validate(email) && UsernameValidator.validate(username) && passValidator.validate(password);
	}
	
	@ResponseBody
	@RequestMapping(value="/validateAllLogin", method = RequestMethod.POST)
	public boolean validateAllLogin(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			HttpServletRequest request, Model model){
		System.out.println("all validation username " + username);
		System.out.println("all validation pass " + password);
		
		return UserDAO.getInstance().isValidLogin(username, password);
	}
	
	
	public static boolean isFollowing(int follower_id,int followed_id){
		try {
			if(UserDAO.getInstance().getFollowing(follower_id).contains(followed_id)){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	

	
	
}
