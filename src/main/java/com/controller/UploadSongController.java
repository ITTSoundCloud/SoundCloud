package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.db.SongDAO;
import com.db.UserDAO;
import com.model.User;

@Controller
@SessionAttributes("filename")
@MultipartConfig
public class UploadSongController {
	
	private String getThisSong;	

	private static final String FILE_LOCATION = "E:"+File.separator+"scUploads"+File.separator + "songs" + File.separator;

	@RequestMapping(value="/songUpload", method=RequestMethod.GET)
	public String prepareForUpload(HttpSession session,Model model) {
		List<String> genres;
		try {
			genres = SongDAO.getInstance().getGenres();
			model.addAttribute("genres", genres);
		} catch (SQLException e) {
			System.out.println("cant get genres. /songUpload");
			e.printStackTrace();
			return "error";
		}

		return "uploadSong";
	}

	@RequestMapping(value="/audio/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model,HttpSession session) throws IOException {
		System.out.println("vliza2");
		
		File file = new File(FILE_LOCATION + getThisSong);
		List<String> genres;
		try {
			genres = SongDAO.getInstance().getGenres();
			model.addAttribute("genres", genres);
		} catch (SQLException e) {
			System.out.println("cant get genres./audio/{fileName}");
			e.printStackTrace();
		}
		
		User user = (User)session.getAttribute("currentUser");
		Files.copy(file.toPath(), resp.getOutputStream());
	}

	@RequestMapping(value="/songUpload", method=RequestMethod.POST)
	public String receiveUpload(@RequestParam("songFile") MultipartFile multiPartFile,
								@RequestParam("songTitle") String title,
								@RequestParam("artist") String artist,
						
								@RequestParam("genre") String genre,
								@RequestParam("description") String description,
								HttpSession session,Model model) throws IOException{
		User user = (User)session.getAttribute("user");
		String username = (String) session.getAttribute("username");
		File fileOnDisk = new File(FILE_LOCATION + title + ".mp3");
		Files.copy(multiPartFile.getInputStream(), fileOnDisk.toPath(), StandardCopyOption.REPLACE_EXISTING);
		getThisSong = multiPartFile.getOriginalFilename();
		

		try {
			
			SongDAO.getInstance().uploadSong(user.getUserId(), title, artist, FILE_LOCATION + title + ".mp3", "path_of_photo", description, genre);
		} catch (SQLException e) {
			System.out.println("Problem uploading song in DB");
			e.printStackTrace();
			return "error";
		}

		session.setAttribute("profilePhoto", FILE_LOCATION + multiPartFile.getOriginalFilename());
		model.addAttribute("filename", multiPartFile.getOriginalFilename());
		return "uploadSong";

	}

}
