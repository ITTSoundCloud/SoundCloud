package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.db.SongDAO;
import com.db.UserDAO;
import com.model.Listable;
import com.model.Song;
import com.model.User;

@Controller
public class SearchContoller {
	
	private static final String WELCOME_VIEW = "search1";
	

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam(value="search_text") String search_text,
			HttpServletRequest request,
			Model model){
		
		ArrayList<Listable> results = new ArrayList<>();
		ArrayList<Song> songs = new ArrayList<>();
		songs.addAll(SongDAO.getInstance().searchForSong(search_text));
		ArrayList<User> users = new ArrayList<>();
		users.addAll(UserDAO.getInstance().searchForUser(search_text));
		System.out.println(songs);
		System.out.println(users);
		results.addAll(UserDAO.getInstance().searchForUser(search_text));
		results.addAll(SongDAO.getInstance().searchForSong(search_text));
		model.addAttribute("searchedItems", results);
		model.addAttribute("searchedSongs", songs);
		model.addAttribute("searchedUsers", users);
		
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
//	
}
