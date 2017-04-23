package com.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.db.SongDAO;
import com.model.Song;
import com.model.User;

@Controller
@MultipartConfig
public class SongController {

	
	@RequestMapping(value = "/genre_{name}", method= RequestMethod.GET)
	public String getGenreSongs(Model model, HttpSession session, 
			@PathVariable(value="name") String genre){
		System.out.println(genre + "genre_{name}");
		User user = (User)session.getAttribute("currentUser");
		List<Song> songs = SongDAO.getInstance().getGenreSongs(genre);
		model.addAttribute("songsGenre", songs);
		
		return "some jsp with songs that is not existing yet ;x";
	}
	
	
	
}
