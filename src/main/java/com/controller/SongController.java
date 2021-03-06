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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.db.LikeDAO;
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
		
	@ResponseBody
	@RequestMapping(value="/timesPlayed", method = RequestMethod.POST)
	public void timesPlayed(Model model,HttpSession session,
			@RequestParam(value = "songId") int song_id) {
		User currentUser = (User) session.getAttribute("user");
		try {
			SongDAO.getInstance().increaseTimesPlayed(song_id);
			System.out.println("You successfuly increased listened times of song " + song_id);
		} catch (SQLException e) {
			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteSong", method = RequestMethod.POST)
	public void deleteSong(Model model,HttpSession session,
			@RequestParam(value = "song_id") int song_id) {
		
		try {

			System.out.println(PlaylistDAO.getInstance().getAllSongsFromPlaylist(1));
			System.out.println(SongDAO.getInstance().getAllSongs());		
			SongDAO.deleteSong(song_id);

		} catch (SQLException e) {
			System.out.println("Cant be deleted" + e.getMessage() + "" + e.getSQLState());
		}
		
	}
		
}
