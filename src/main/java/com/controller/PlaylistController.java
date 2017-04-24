package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.db.CommentDAO;
import com.db.LikeDAO;
import com.db.PlaylistDAO;
import com.db.SongDAO;
import com.db.UserDAO;
import com.model.Comment;
import com.model.Playlist;
import com.model.Song;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.UsernameValidator;

@Controller
@MultipartConfig
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
				int playlist_id = PlaylistDAO.getInstance().createPlaylist(2, playlist, description);			
				PlaylistDAO.getInstance().addSongToPlayList(playlist_id, songToAdd.getSongId());
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return "song";
         
	}
	
	@RequestMapping(value = "/song_{title}", method= RequestMethod.GET)
	public String giveUser(Model model, HttpSession session, 
			@PathVariable(value="title") String songTitle){
		System.out.println(songTitle + "v song_{title}");
		User currentUser = (User) session.getAttribute("user");
		Song visitedSongProfile;
		try {
			visitedSongProfile = SongDAO.getInstance().getSong(songTitle);
			model.addAttribute("song", visitedSongProfile);
			session.setAttribute("songToAddInPlaylist", visitedSongProfile);//tova ne moje li da ne se kazva taka
			model.addAttribute("isLiked",isLiked(visitedSongProfile.getSongId(),currentUser.getUsername())); // check in database if follow
			List<Comment> comments = CommentDAO.getInstance().getSongComments(visitedSongProfile.getSongId());
			model.addAttribute("allComments", comments);
		} catch (SQLException e) {
			System.out.println("DB problem - song page.");
		}	
		
		return "song";
	}

	
	
	@ResponseBody
	@RequestMapping(value="/validatePlaylist", method = RequestMethod.POST)
	public boolean validatePlaylist(
			@RequestParam(value = "playlist") String playlist,
			@RequestParam(value = "description") String description,
			HttpServletRequest request, HttpSession session){
		//User user = (User)session.getAttribute("currentUser");
		System.out.println("validatePlaylist");
		System.out.println(playlist);
		System.out.println(description);
		//System.out.println(user.getUserId());
		return PlaylistDAO.getInstance().playlistExists(playlist, description, 2);
	}
	
	
	
	public boolean isLiked(int song_id,String username){
		if(LikeDAO.getInstance().getLikesOfSong(song_id).containsKey(username)){
			return true;
		}
		return false;
	}
	
}
