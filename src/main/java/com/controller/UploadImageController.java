package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
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

import com.db.PlaylistDAO;
import com.db.UserDAO;
import com.model.Playlist;
import com.model.User;


@Controller
@SessionAttributes("filename")
@MultipartConfig
public class UploadImageController {

	private String getThisImage;

	private static final String FILE_LOCATION = "E:"+File.separator+"scUploads"+ File.separator + "pics" + File.separator;
	private static final String RESOURSES_PATH = "http://localhost:8080/scUploads/pics/";

	@RequestMapping(value="/profile_{username}", method=RequestMethod.GET)
	public String prepareForUpload(HttpSession session,Model model, @PathVariable(value="username") String username) { //TODO CHANGE
		System.out.println("toq kontroller vikmae");
		String profilePicToShow = RESOURSES_PATH + username + ".jpg";
		session.setAttribute("profilePhoto", profilePicToShow);
		User currentUser = (User) session.getAttribute("user");
		try {
			List<Playlist> userPlaylists = PlaylistDAO.getInstance().getUserPlaylists(currentUser.getUserId());
			model.addAttribute("currentPlaylists", userPlaylists);
		} catch (SQLException e) {
			System.out.println("cant getUserPlaylists./upload");
			e.printStackTrace();
			return "error";
		}
		User visitedUser;
		try {
			visitedUser = UserDAO.getInstance().getUser(username);
			model.addAttribute("user", visitedUser);			
			session.setAttribute("usernameToFollow", username);
			model.addAttribute("isFollowing", UserConroller.isFollowing(currentUser.getUserId(), visitedUser.getUserId())); // check in database if follow
			List<Playlist> visitedPlaylists = PlaylistDAO.getInstance().getUserPlaylists(visitedUser.getUserId());
			List<String> followers = UserDAO.getInstance().getFollowers(visitedUser.getUserId());
			model.addAttribute("followers",followers);
			model.addAttribute("currentPlaylists", visitedPlaylists);
		} catch (SQLException e) {
			System.out.println("cant get user from dao./profile_{username}");
			e.printStackTrace();
			return "error";
		}
		return "uploadNewProfile";
	}


	@RequestMapping(value="/image/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model) throws IOException {
		File file = new File(FILE_LOCATION + getThisImage);
		Files.copy(file.toPath(), resp.getOutputStream());
	}

	@RequestMapping(value="/profile_{username}", method=RequestMethod.POST)
	public String receiveUpload(@RequestParam("imageFile") MultipartFile multiPartFile,HttpSession session,Model model) throws IOException{
		
		
		String username = (String)session.getAttribute("username");
		File fileOnDisk = new File(FILE_LOCATION + username + ".jpg");
		Files.copy(multiPartFile.getInputStream(), fileOnDisk.toPath(), StandardCopyOption.REPLACE_EXISTING);
		getThisImage = multiPartFile.getOriginalFilename();
		try {
			UserDAO.getInstance().addProfilePicture((String)session.getAttribute("username"), FILE_LOCATION + username + ".jpg");
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		session.setAttribute("profilePhoto", "http://localhost:8080/scUploads/pics/" + username + ".jpg");
		model.addAttribute("filename", multiPartFile.getOriginalFilename());
		System.out.println("*****************" + session.getAttribute("profilePhoto"));
		return "uploadNewProfile";

	}

}