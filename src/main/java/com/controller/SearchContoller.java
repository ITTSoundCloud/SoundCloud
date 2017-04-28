package com.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comparators.UploadTimeComparator;
import com.db.DBManager;
import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.db.UserDAO;
import com.model.Playlist;
import com.model.Song;
import com.model.User;

@Controller
public class SearchContoller {
	
	private static final String WELCOME_VIEW = "error";
	

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value="search_text") String search_text,
			HttpServletRequest request,
			Model model, HttpSession session){
		
		User currentUser = (User) session.getAttribute("user");
		ArrayList<Playlist> playlists = new ArrayList<>();
		
		try {
			List<User> users = UserDAO.getInstance().searchForUser(search_text);

			if (currentUser != null) {
				Map<User,Boolean> mapUsers = new HashMap<>();
				for(User u : users){
					mapUsers.put(u,UserConroller.isFollowing(currentUser.getUserId(), u.getUserId()));
					model.addAttribute("searchedUsers", mapUsers);
					System.out.println(mapUsers);
				}		
			}
			else{
				Map<User,Boolean> mapUsers = new HashMap<>();
				for(User u : users){
					mapUsers.put(u, false);
					model.addAttribute("searchedUsers", mapUsers);
					System.out.println(mapUsers);

			}
		}		
			
		} catch (SQLException e) {
			System.out.println("Error getting users from DB for listing in search./search");
			e.printStackTrace();
			return "error";
		}
		try {
			List<Song> songs = SongDAO.getInstance().searchForSong(search_text);
			
			if (currentUser != null) {
				Map<Song,Boolean> mapSongs = new HashMap<>();
				for(Song s : songs){
					mapSongs.put(s, PlaylistController.isLiked(s.getSongId(), currentUser.getUsername()));
				}
				model.addAttribute("searchedSongs", mapSongs);
			}
			else{
				Map<Song,Boolean> mapSongs = new HashMap<>();
				for(Song s : songs){
					mapSongs.put(s, false);
				}
				model.addAttribute("searchedSongs", mapSongs);
				
			}
			
		} catch (SQLException e1) {
			System.out.println("Error getting songs from DB for listing in search");
			e1.printStackTrace();
			return "error";
		}

		try {
			playlists.addAll(PlaylistDAO.getInstance().searchForPLaylist(search_text));
			System.out.println("Playlists?");
			System.out.println(PlaylistDAO.getInstance().searchForPLaylist(search_text));
			model.addAttribute("searchedPlaylists",playlists);
		} catch (SQLException e) {
			System.out.println("cant searchForPlaylist./search");
			e.printStackTrace();
			return "error";
		}


		return "searchResults";
		
	}
	
	@RequestMapping(value="/loginFB", method=RequestMethod.POST)
	public String fbRegister(Model viewModel,HttpSession session,@RequestParam String last_name,
			@RequestParam String first_name,@RequestParam String email) {
		
		System.out.println(first_name);
		System.out.println(email);
		
		return "index";
		/*String newUser = null;
		try {
			newUser = UserDAO.getUserByEmail(email);
		} catch (SQLException e) {
			System.out.println("Could not fetch user by email");
		}
		if(newUser!=null) {  
			session.setAttribute("username", newUser);
			return "index";
		}
		else {
			int randomId=new Random().nextInt(10000);
			String user = first_name.concat(last_name) + randomId;
			String pass = first_name.concat(last_name) + randomId;
			SendEmail.sendEmail(email, first_name+" "+last_name, pass,user);
			User u = new User(user, pass, email);
			try {
				UserDAO.addUser(u);
			} catch (SQLException e) {
				System.out.println("Problem adding user to DB");
			}
			System.out.println("sent register email to " + email);
			session.setAttribute("email", email);
			session.setAttribute("username", user);
			session.setAttribute("facebookUser" , u);
			return "index";
		 }*/
	}
		
	
	@RequestMapping("/welcome")
	public String welcome(Model model){
			
		return WELCOME_VIEW;
		
	}
	
}
