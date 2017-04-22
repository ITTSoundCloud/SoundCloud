package com.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.db.UserDAO;
import com.model.Playlist;
import com.model.Song;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.UsernameValidator;

public class PlaylistController {

	
	@RequestMapping(value = "/addPlaylist", method = RequestMethod.POST)
	public String addPlaylist(
		@RequestParam(value = "playlist") String playlist,
		@RequestParam(value = "description") String description,
		HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		Song songToAdd = (Song)session.getAttribute("songToAddInPlaylist");
		if (validatePlaylist(playlist, description, request, session)) {
			try {
				int playlist_id = PlaylistDAO.getInstance().createPlaylist(user.getUserId(), playlist, description);			
				PlaylistDAO.getInstance().addSongToPlayList(playlist_id, songToAdd.getSongId());
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return "song";
         
	}
	
	@RequestMapping(value = "/song_{title}", method= RequestMethod.GET)
	public String giveUser(Model model, HttpSession session, 
			@PathVariable(value="songTitle") String songTitle){
		System.out.println(songTitle + "v song_{title}");
		
		Song visitedSongProfile;
		try {
			visitedSongProfile = SongDAO.getInstance().getSong(songTitle);
			model.addAttribute("song", visitedSongProfile);
			session.setAttribute("songToAddInPlaylist", visitedSongProfile);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}	
		
		return "song";
	}

	
	@ResponseBody
	@RequestMapping(value="/validatePlaylist", method = RequestMethod.POST)
	public boolean validatePlaylist(
			@RequestParam(value = "playlist") String playlist,
			@RequestParam(value = "description") String description,
			HttpServletRequest request, HttpSession session){
		User user = (User)session.getAttribute("currentUser");
		System.out.println("validatePlaylist");
		return PlaylistDAO.getInstance().playlistExists(playlist, description, user.getUserId());
	}
	
}