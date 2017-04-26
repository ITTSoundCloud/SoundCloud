package com.controller;

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
	
	private static final String WELCOME_VIEW = "search1";
	

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value="search_text") String search_text,
			HttpServletRequest request,
			Model model, HttpSession session){
		
		User currentUser = (User) session.getAttribute("user");
		ArrayList<Playlist> playlists = new ArrayList<>();
		
		try {
			List<User> users = UserDAO.getInstance().searchForUser(search_text);
			Map<User,Boolean> mapUsers = new HashMap<>();
			for(User u : users){
//				if(USER IS LOGGED) TODO
				mapUsers.put(u,UserConroller.isFollowing(currentUser.getUserId(), u.getUserId()));
			}
			model.addAttribute("searchedUsers", mapUsers);
			System.out.println(mapUsers);
		} catch (SQLException e) {
			System.out.println("Error getting users from DB for listing in search");
		}
		try {
			List<Song> songs = SongDAO.getInstance().getAllSongs();
			Map<Song,Boolean> mapSongs = new HashMap<>();
			for(Song s : songs){
				mapSongs.put(s, PlaylistController.isLiked(s.getSongId(), currentUser.getUsername()));
			}
			model.addAttribute("searchedSongs", mapSongs);
		} catch (SQLException e1) {
			System.out.println("Error getting songs from DB for listing in search");
		}

		try {
			playlists.addAll(PlaylistDAO.getInstance().searchForPLaylist(search_text));
			System.out.println("Playlists?");
			System.out.println(PlaylistDAO.getInstance().searchForPLaylist(search_text));
			model.addAttribute("searchedPlaylists",playlists);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return "searchResults";
		
	}
	
	
	
	@RequestMapping("/index")
	public String welcome(Model model){
			
		return WELCOME_VIEW;
		
	}
	
	
//	@RequestMapping("/search_text")
//	public String search(Model model){
//			
//		return WELCOME_VIEW;
//		
//	}
	
	public boolean isFollowing(){
		return new Random().nextBoolean();
	}
//	
}
