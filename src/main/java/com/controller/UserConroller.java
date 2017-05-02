package com.controller;

import static org.assertj.core.api.Assertions.setRemoveAssertJRelatedElementsFromStackTrace;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.comparators.LikesComparator;
import com.comparators.UploadTimeComparator;
import com.db.CommentDAO;
import com.db.LikeDAO;
import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.db.UserDAO;
import com.email.CodeGenerator;
import com.email.EmailSender;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.MapDeserializer;
import com.model.Comment;
import com.model.Countries;
import com.model.Playlist;
import com.model.Song;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.PasswordValidator;
import com.validators.UsernameValidator;

import net.minidev.json.JSONArray;
import net.minidev.json.parser.JSONParser;


@Controller
@MultipartConfig
public class UserConroller {
	
	private static final String RESOURSES_PATH = "http://localhost:8080/scUploads/pics/";
	private static final String DEFAULT_FB_PASS = "Default1*";
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
			UserDAO userDAO = UserDAO.getInstance();
			User userToAdd = (User) session.getAttribute("currentUser");
			try {
				userDAO.saveUser(userToAdd);
			
			userDAO.addUserToCash(userToAdd);
			return "search1";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "verify";
         
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpSession session,Model model) {
		
		if (session.getAttribute("user") == null) {
			try {
				List<Song> all = SongDAO.getInstance().getAllSongs();
				Collections.sort(all,new UploadTimeComparator());
				List<Song> mostPlayed = new ArrayList<>();
				int counter = 0;
				for(Song s : all){
					if(counter<5){
						mostPlayed.add(s);
					}
					else{
						break;
					}
					counter++;
				}
				
				model.addAttribute("mostPlayed", mostPlayed);
			} catch (SQLException e) {
				System.out.println("error getting songs from SongDAO for index.jsp");
			}
			return "index";
		}
		
	 	List<String> genres;
		try {
			genres = SongDAO.getInstance().getGenres();
			model.addAttribute("genres", genres);
		} catch (SQLException e) {
			System.out.println("cant get genres. /home");
			e.printStackTrace();
			return "error";
		}
		
		List<Song> songs;
		try {
			songs = SongDAO.getInstance().getAllSongs();
			Collections.sort(songs, new UploadTimeComparator());
			model.addAttribute("songsByDate", songs);
		} catch (SQLException e) {
			System.out.println("cant get all songs from dao. /home");
			e.printStackTrace();
			return "error";
		}
		
		
		return "explore";    
	}
	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String welcome(
			@RequestParam(value = "username-login") String username,
		HttpServletRequest request, Model model, HttpSession session) {
		
		if (session.getAttribute("user") == null) {					
		User user;
		try {
			user = UserDAO.getInstance().getUser(username);
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUsername());
		} catch (SQLException e) {
			System.out.println("cant get user form dao. /login");
			e.printStackTrace();
			return "error";
		}
			
		}
		if (session.getAttribute("user") == null) {
			return "index";
		}
//		 	Set<User> allUsers = UserDAO.getInstance().getAllUsers();
//		 	List<Song> allSongs = SongDAO.getInstance().getAllSongs();
//		 	
//		 	for(User u : allUsers){
//		 		System.out.println(u);
//		 	}
//		 	model.addAttribute("allUsers", allUsers);
//		 	model.addAttribute("allSongs", allSongs);
//		 	
		 	List<String> genres;
			try {
				genres = SongDAO.getInstance().getGenres();
				model.addAttribute("genres", genres);
			} catch (SQLException e) {
				System.out.println("cant get genres from dao./login");
				e.printStackTrace();
				return "error";

			}
			
			List<Song> songs;
			try {
				songs = SongDAO.getInstance().getAllSongs();
				session.setAttribute("songs", songs);
				Collections.sort(songs, new UploadTimeComparator());
				for(Song s : songs){
					System.out.println("date of uploading " + s.getUploadingTime());
				}
				
				System.out.println("by likes");
				for(Song s : songs){
					System.out.println("likes " + s.getLikes());
				}
			} catch (SQLException e) {
				System.out.println("cant get all songs from dao. /login");
				e.printStackTrace();
				return "error";
			}
			session.setAttribute("isFBUser", false);

            return "explore";                                                   


	}
	
	@RequestMapping(value="/loginFB", method=RequestMethod.POST)
	public String fbRegister(Model viewModel,HttpSession session,@RequestParam String last_name,
			@RequestParam String first_name,@RequestParam String email) {
		
		String username = first_name + " " + last_name;
		
		User fbUser = null;
		try {
			fbUser = (User)UserDAO.getInstance().getUser(username);
		} catch (SQLException e) {
			System.out.println("Cant get user by name. /loginFB");
			e.printStackTrace();
			
		}
		if(fbUser != null) {  
			session.setAttribute("user", fbUser);
			session.setAttribute("username", fbUser.getUsername());
			session.setAttribute("isFBUser", true);
			return "login";
		}
		else {			
			User newFbUser = new User(username, email, DEFAULT_FB_PASS);
			try {
				UserDAO.getInstance().saveUser(newFbUser);
				session.setAttribute("user", newFbUser);
				session.setAttribute("username", newFbUser.getUsername());
				session.setAttribute("isFBUser", true);
			} catch (SQLException e) {
				System.out.println("Problem adding user to DB");
				e.printStackTrace();
			}				 
		}
		
		return "login";
	}
	
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logOut(HttpServletRequest request, Model model) {
	        HttpSession session = request.getSession();
	        session.invalidate();
	        return "index";
	    }
	
	 @RequestMapping(value = "/index", method = RequestMethod.GET)
	    public String index() {        
	        return "newUpdateProfile";
	    }
	 	 
	@RequestMapping(value = "/sortDate", method= RequestMethod.GET)
	public String sortByDate(Model model, HttpSession session){
		model.addAttribute("type", "date");
		
		List<Song> songsByDate;
		try {
			songsByDate = SongDAO.getInstance().getAllSongs();
		Collections.sort(songsByDate, new UploadTimeComparator());
		session.setAttribute("songs", songsByDate);
		System.out.println("EHOOOOOOOOOOOOOOOOOOOOOOO");
		for(Song s : songsByDate){
			System.out.println(s.getSongId());
		}
		} catch (SQLException e) {
			System.out.println("cant get all songs./sordDate");
			e.printStackTrace();
			return "error";
		}
		return "explore";	
	
	}
	
	@RequestMapping(value="/updateCurrentProfile_{username}", method=RequestMethod.POST)
	public String updateCurrentProfile(
			@PathVariable(value="username") String username,
			HttpSession session,Model model) {
		
		System.out.println("--------------------------------------------------");
		
		
		List<String> countries = Arrays.asList(countriesToString().split(" "));
		
		System.out.println(countries + "******************************************************");
		model.addAttribute("countries", countries);
		model.addAttribute("username", username);

		return "newUpdateProfile";
	}
	
	public static String countriesToString() {
	    return Stream.of(Countries.values()).
	                map(Countries::name).
	                collect(Collectors.joining(" "));
	}

	
	@RequestMapping(value="/updateProfile", method=RequestMethod.POST)
	public String updateProfile(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "country") String country,
			@RequestParam(value = "about") String about,
			HttpSession session,Model model) {
		System.out.println("--------------------------------------------------");
		//String[] countries = countriesToString().split(" ");
		//System.out.println(countries + "******************************************************");
		//model.addAttribute("countries", countries);
		User currentUser = (User) session.getAttribute("user");
		
		try {
			UserDAO dao = UserDAO.getInstance();
			dao.editName(currentUser.getUsername(), name);
			dao.editCountry(currentUser.getUsername(), country);
			dao.editDescription(currentUser.getUsername(), about);
			
		} catch (SQLException e) {
			System.out.println("cant update profile in dao. /updateProfile");
			e.printStackTrace();
			return "error";
		}

		return "newUpdateProfile";
	}
	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	public String changePassword(
			@RequestParam(value = "currentPassword") String currentPassword,
			@RequestParam(value = "newPassword") String newPassword,
			HttpSession session,Model model) {
		System.out.println("Change password***************");
		User currentUser = (User) session.getAttribute("user");
		if (currentPassword.equals(currentUser.getPassword()) && passValidator.validate(newPassword)) {
			try {
				UserDAO.getInstance().editPassword(currentUser.getUserId(), newPassword);
			} catch (SQLException e) {
				System.out.println("cant change password. /changePassword");
				e.printStackTrace();
				return "error";
			}
		}

		return "newUpdateProfile";
	}

	
	@RequestMapping(value = "/sortLikes", method= RequestMethod.GET)
	public String sortLikes(Model model, HttpSession session){
		model.addAttribute("type", "likes");
		List<Song> songsByLikes;
		try {
			songsByLikes = SongDAO.getInstance().getAllSongs();
		Collections.sort(songsByLikes, new LikesComparator());
		session.setAttribute("songs", songsByLikes);
		System.out.println("v likes");
		for(Song s : songsByLikes){
			System.out.println(s.getLikes());
		}
		} catch (SQLException e) {
			System.out.println("cant get all songs./sortLikes");
			e.printStackTrace();
			return "error";
		}	

		return "explore";
		

	}
	
	
	@RequestMapping(value = "/sortGenres", method= RequestMethod.GET)
	public String sortGenre(Model model, HttpSession session){	
		return "explore";	
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
					System.out.println(e.getMessage() + " problem with song like. / like");
					
				}
		}
		
		
		
		@ResponseBody
		@RequestMapping(value="/removeLike", method = RequestMethod.POST)
		public void removeLikeSong(Model model,HttpSession session){
			User currentUser = (User) session.getAttribute("user");
			System.out.println("kvo stava tuka ima li laikove??");
			Song visitedSongProfile = (Song) session.getAttribute("songToAddInPlaylist");
			model.addAttribute("song", visitedSongProfile);
			
				try {
					System.out.println("Nema laikove");
					LikeDAO.getInstance().removeLikeSong(currentUser.getUserId(), visitedSongProfile.getSongId());
				} catch (SQLException e) {
					System.out.println(e.getMessage() + " problem with song like.");
				}
		}
		
		
		@ResponseBody
		@RequestMapping(value="/likeSearch", method = RequestMethod.POST)
		public void likeSongSearch(Model model,HttpSession session,
				@RequestParam(value = "title") String title){

			User currentUser = (User) session.getAttribute("user");
			Song song;
			try {
				song = SongDAO.getInstance().getSong(title);
				LikeDAO.getInstance().likeSong(currentUser.getUserId(), song.getSongId());
				System.out.println("The song " + song + " was liked successfully from search page.");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				
		}
		
		
		@ResponseBody
		@RequestMapping(value="/unlikeSearch", method = RequestMethod.POST)
		public void unlikeSongSearch(Model model,HttpSession session,
				@RequestParam(value = "title") String title){
			
			User currentUser = (User) session.getAttribute("user");
			Song song;
			try {
				song = SongDAO.getInstance().getSong(title);
				LikeDAO.getInstance().removeLikeSong(currentUser.getUserId(), song.getSongId());
				System.out.println("The song " + song + " was unliked successfully from search page.");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				
		}
		
			
				
		@ResponseBody
		@RequestMapping(value="/comment", method = RequestMethod.POST)
		public void comment(Model model,HttpSession session,
				@RequestParam (value="comment") String comment){
			User currentUser = (User) session.getAttribute("user");
			Song visitedSong = (Song) session.getAttribute("songToAddInPlaylist");
			try {
				CommentDAO.getInstance().addComment(comment, currentUser.getUserId(), visitedSong.getSongId());
				System.out.println("tuk sme");
			} catch (SQLException e) {
				System.out.println("mina");
				e.printStackTrace();
			}	
		}
		
		
		
		
		@ResponseBody
		@RequestMapping(value="/likeComment", method = RequestMethod.POST)
		public void likeComment(Model model,HttpSession session,
				@RequestParam(value = "commentId") int comment_id){
		
			User currentUser = (User) session.getAttribute("user");
			try {
				System.out.println("Laiknahme commenta");
				CommentDAO.getInstance().likeComment(currentUser.getUserId(), comment_id);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
				
		}
		
		
		@ResponseBody
		@RequestMapping(value="/removeLikeComment", method = RequestMethod.POST)
		public void removeLikeComment(Model model,HttpSession session,
				@RequestParam(value = "commentId") int comment_id){
		
			User currentUser = (User) session.getAttribute("user");
			try {
				System.out.println("UnLaiknahme commenta");
				CommentDAO.getInstance().removeLikeComment(currentUser.getUserId(), comment_id);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
				
		}
		
		
		@ResponseBody
		@RequestMapping(value="/follow", method = RequestMethod.POST)
		public void followUser(Model model,HttpSession session){//another follow method may be necessary

			User currentUser = (User) session.getAttribute("user");
			User visitedUser;
			try {
				visitedUser = UserDAO.getInstance().getUser(session.getAttribute("usernameToFollow").toString());
				if(UserDAO.getInstance().followUser(currentUser.getUserId(),visitedUser.getUserId())){
					System.out.println("user " + currentUser + "was followed on his profile page.");
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		}
		
		
		
		@ResponseBody
		@RequestMapping(value="/followSearch", method = RequestMethod.POST)
		public void followUserSearch(Model model,HttpSession session,
				@RequestParam(value = "username") String username){//another follow method may be necessary

			User currentUser = (User) session.getAttribute("user");
			User userToFollow;
			try {
				userToFollow = UserDAO.getInstance().getUser(username);
				UserDAO.getInstance().followUser(currentUser.getUserId(), userToFollow.getUserId());
				System.out.println("The user " + currentUser + " was followed successfully from search page.");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
				
		}
		
		
				
		@ResponseBody
		@RequestMapping(value="/unFollow", method = RequestMethod.POST)
		public void unFollowUser(Model model,HttpSession session){//another unfollow method may be necessary
			User currentUser = (User) session.getAttribute("user");
			
				User visitedUser;
				try {
					visitedUser = UserDAO.getInstance().getUser(session.getAttribute("usernameToFollow").toString());
					try {
						if(UserDAO.getInstance().unfollow(currentUser.getUserId(), visitedUser.getUserId())){
							System.out.println("The user " + currentUser + " was unfollowd successfully on his profile page.");
						}
		
					} catch (SQLException e) {
						System.out.println("Error unfollowing user on his page!");
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
					
		}
		
		
		@ResponseBody
		@RequestMapping(value="/unFollowSearch", method = RequestMethod.POST)
		public void unFollowSearch(Model model,HttpSession session,
				@RequestParam(value = "username") String username){//another unfollow method may be necessary
			User currentUser = (User) session.getAttribute("user");
		
				User userToUnfollow;
				try {
					userToUnfollow = UserDAO.getInstance().getUser(username);
					try {
						UserDAO.getInstance().unfollow(currentUser.getUserId(), userToUnfollow.getUserId());
						System.out.println("The user " + currentUser + " was unfollowd successfully from search page.");
					} catch (SQLException e) {
						System.out.println("Error unfollowing user on search page!");
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				
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
	@RequestMapping(value="/validateChangePassword", method = RequestMethod.POST)
	public boolean validateChangePassword(
			@RequestParam(value = "currentPass") String currentPass,
			@RequestParam(value = "newPass") String newPass,
			HttpServletRequest request, HttpSession session){
		System.out.println("validateChangePassword");
		User currentUser = (User) session.getAttribute("user");
		return currentPass.equals(currentUser.getPassword()) && passValidator.validate(newPass);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkCurrentPass", method = RequestMethod.POST)
	public boolean isValidPass(
			@RequestParam(value = "currentPass") String currentPass,
			HttpServletRequest request, HttpSession session){
		System.out.println("checkCurrentPass");
		User currentUser = (User) session.getAttribute("user");
		return currentPass.equals(currentUser.getPassword());
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
			System.out.println("cant getFollowing from dao./isFollowing");
			e.printStackTrace();
			
		}
		return false;
	}
	
	
}
