package com.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	private static final String RESOURSES_PATH = "http://localhost:8080/scUploads/songs/";
	
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
	
	
	@RequestMapping(value = "/playlist_{playlistId}", method = RequestMethod.GET)
	public String getPlaylist(
		@PathVariable(value = "playlistId") int playlist_id,Model model,
		HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		System.out.println(user);
		try {
			List<Song> songs = PlaylistDAO.getInstance().getAllSongsFromPlaylist(playlist_id);
			model.addAttribute("songsInPlaylist", songs);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return "playlistSongs";
         
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addSongToPlaylist", method = RequestMethod.POST)
	public void addSongToPlaylist(Model model,HttpSession session,
			@RequestParam(value = "playlistId") int playlist_id) {
		System.out.println("song added to playlist " +playlist_id);
		User currentUser = (User) session.getAttribute("user");
		Song songToAdd = (Song)session.getAttribute("songToAddInPlaylist");
		try {
			PlaylistDAO.getInstance().addSongToPlayList(playlist_id, songToAdd.getSongId());
			System.out.println("added");
		} catch (SQLException e) {
			System.out.println("Error in DB adding the song to playlist");
		}
	}
	
	
	@RequestMapping(value = "/song_{title}", method= RequestMethod.GET)
	public String giveUser(Model model, HttpSession session, 
			@PathVariable(value="title") String songTitle){
		System.out.println(songTitle + "v song_{title}");
		User currentUser = (User) session.getAttribute("user");
		String songToPlayUrl = RESOURSES_PATH + songTitle + ".mp3";
		model.addAttribute("songToPlay", songToPlayUrl);
		Song visitedSongProfile;		
		try {
			visitedSongProfile = SongDAO.getInstance().getSong(songTitle);
			model.addAttribute("song", visitedSongProfile);
			session.setAttribute("songToAddInPlaylist", visitedSongProfile);
			model.addAttribute("isLiked",isLiked(visitedSongProfile.getSongId(),currentUser.getUsername())); // check in database if follow
			//TODO
			
			List<Comment> comments = CommentDAO.getInstance().getSongComments(visitedSongProfile.getSongId());
			Map<Comment,Boolean> mapComments = new HashMap<>();
			
			for(Comment c : comments){
				mapComments.put(c,PlaylistController.isLikedComment(currentUser.getUserId(), c.getCommentId()));
			}
			
			model.addAttribute("allComments", mapComments);
		} catch (SQLException e) {
			System.out.println("DB problem - song page.");
		}	
		try {
			List<Playlist> currentUserPlaylists = PlaylistDAO.getInstance().getUserPlaylists(currentUser.getUserId());
			model.addAttribute("currentUserPlaylists", currentUserPlaylists);
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
		//User user = (User)session.getAttribute("currentUser");
		System.out.println("validatePlaylist");
		System.out.println(playlist);
		System.out.println(description);
		//System.out.println(user.getUserId());
		boolean isValidPlaylist = false;
		try {
			isValidPlaylist = PlaylistDAO.getInstance().playlistExists(playlist, description, 2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isValidPlaylist;
	}
	
	
	
	public static boolean isLiked(int song_id,String username){
		try {
			if(LikeDAO.getInstance().getLikesOfSong(song_id).containsKey(username)){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	public static boolean isLikedComment(int user_id,int comment_id){
		try {
			if(LikeDAO.getInstance().getLikesOfComment(comment_id).contains(user_id)){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	public static boolean isCommentLiked(int song_id,String username){
		try {
			if(LikeDAO.getInstance().getLikesOfSong(song_id).containsKey(username)){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/timesPlayed", method = RequestMethod.POST)
	public void timesPlayed(Model model,HttpSession session,
			@RequestParam(value = "songId") int song_id
			) {
		User currentUser = (User) session.getAttribute("user");
		try {
			SongDAO.getInstance().increaseTimesPlayed(song_id);
			System.out.println("You successfuly increased listened times of song " + song_id);
		} catch (SQLException e) {
			
		}
		
	}
	
}
