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
	public void addPlaylist(
		@RequestParam(value = "playlist") String playlist,
		@RequestParam(value = "description") String description,Model model,
		HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("user");
		Song songToAdd = (Song)session.getAttribute("songToAddInPlaylist");
		if (validatePlaylist(playlist, description, request, session)) {
			try {
				int playlist_id = PlaylistDAO.getInstance().createPlaylist(user.getUserId(), playlist, description);			
				PlaylistDAO.getInstance().addSongToPlayList(playlist_id, songToAdd.getSongId());
			} catch (SQLException e) {
				System.out.println("cant add song to playlist./addPlaylist");
				e.printStackTrace();
				//return "error";
			}
		}
		giveUser(model, session, songToAdd.getTitle());
		
         
	}
	
	
	@RequestMapping(value = "/playlist_{playlistId}", method = RequestMethod.GET)
	public String getPlaylist(
		@PathVariable(value = "playlistId") int playlist_id,Model model,
		HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		try {
			//username -> playlist
			Map<String,Playlist> infoPlaylist = PlaylistDAO.getInstance().getPlaylist(playlist_id);
			model.addAttribute("infoPlaylist", infoPlaylist);
		} catch (SQLException e1) {
			System.out.println(e1.getMessage() + "cant get playlist info from playlist./playlist_{playlistId}");
			return "error";
		}
		System.out.println(user);
		try {
			List<Song> songs = PlaylistDAO.getInstance().getAllSongsFromPlaylist(playlist_id);
			model.addAttribute("songsInPlaylist", songs);
		} catch (SQLException e) {

			System.out.println(e.getMessage() + "cant get all songs from playlist./playlist_{playlistId}");
			return "error";
		}
		
		return "songsPlaylist";
         
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
		System.out.println("kashon kashon kashon");
		User currentUser = (User) session.getAttribute("user");
		session.setAttribute("songPhoto", "http://localhost:8080/scUploads/pics/" + songTitle + ".jpg");
		try {
			Song currentSong = SongDAO.getInstance().getSong(songTitle);
			model.addAttribute("song", currentSong);
		} catch (SQLException e2) {			
			e2.printStackTrace();
			return "error";
		}
		System.out.println(currentUser);
		String songToPlayUrl = RESOURSES_PATH + songTitle + ".mp3";
		session.setAttribute("songToPlay", songToPlayUrl);
		System.out.println("-------------------" + songToPlayUrl);
		
		try {
			Map<String, String> userSongs = SongDAO.getInstance().getSongsByUser(currentUser.getUserId());
			if (userSongs.containsKey(songTitle)) {
				model.addAttribute("isContaining", true);
			}
			else{
				model.addAttribute("isContaining", false);
			}
		} catch (SQLException e1) {			
			e1.printStackTrace();
			return "error";
		}
		
		Song visitedSongProfile;		
		try {
			visitedSongProfile = SongDAO.getInstance().getSong(songTitle);
			model.addAttribute("song", visitedSongProfile);
			session.setAttribute("songToAddInPlaylist", visitedSongProfile);
			model.addAttribute("isLiked",isLiked(visitedSongProfile.getSongId(),currentUser.getUsername())); // check in database if follow
			
			List<Comment> comments = CommentDAO.getInstance().getSongComments(visitedSongProfile.getSongId());
			Map<Comment,Boolean> mapComments = new HashMap<>();
			
			for(Comment c : comments){
				mapComments.put(c,PlaylistController.isLikedComment(currentUser.getUserId(), c.getCommentId()));
			}
			
			model.addAttribute("allComments", mapComments);
		} catch (SQLException e) {
			System.out.println("DB problem - song page.");
			e.printStackTrace();
			return "error";
		}	
		try {
			List<Playlist> currentUserPlaylists = PlaylistDAO.getInstance().getUserPlaylists(currentUser.getUserId());
			model.addAttribute("currentUserPlaylists", currentUserPlaylists);
		} catch (SQLException e) {
			System.out.println("cant get user playlists./song_{title}");
			e.printStackTrace();
			return "error";
		}
		
		return "song";
	}

	
	
	@ResponseBody
	@RequestMapping(value="/validatePlaylist", method = RequestMethod.POST)
	public boolean validatePlaylist(
			@RequestParam(value = "playlist") String playlist,
			@RequestParam(value = "description") String description,
			HttpServletRequest request, HttpSession session){

		System.out.println("validatePlaylist");
		System.out.println(playlist);
		System.out.println(description);

		boolean isValidPlaylist = false;
		try {
			isValidPlaylist = PlaylistDAO.getInstance().playlistExists(playlist, description, 2);
		} catch (SQLException e) {

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

			e.printStackTrace();
		}
		return false;
	}
		
}
