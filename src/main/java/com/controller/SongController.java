package com.controller;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withServerError;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.model.Playlist;
import com.model.Song;
import com.model.User;

@Controller
@MultipartConfig
public class SongController {

	
	
	@RequestMapping(value = "/genres_{name}", method= RequestMethod.GET)
	public String getGenreSongs(Model model, HttpSession session, 
			@PathVariable(value="name") String genre){
		System.out.println(genre + "genre_{name}");
		User user = (User)session.getAttribute("currentUser");
		model.addAttribute("genre", genre);
		List<Song> songs;
		try {
			songs = SongDAO.getInstance().getGenreSongs(genre);
			model.addAttribute("songsGenre", songs);
		} catch (SQLException e) {
			System.out.println("cant getGenreSongs.//genre_{name}");
			e.printStackTrace();
			return "error";
		}
		
		
		return "genreSongs";
	}
	
	
	
}
