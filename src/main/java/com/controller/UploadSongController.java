package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;

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

import com.db.UserDAO;

@Controller
@SessionAttributes("filename")
@MultipartConfig
public class UploadSongController {
	
	private String getThisSong;

	private static final String FILE_LOCATION = "E:"+File.separator+"scUploads"+ File.separator + "songs" + File.separator;

	@RequestMapping(value="/songUpload", method=RequestMethod.GET)
	public String prepareForUpload(HttpSession session) {
		System.out.println("vliza1");
		return "uploadSong";
	}


	@RequestMapping(value="/audio/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model) throws IOException {
		System.out.println("vliza2");
		File file = new File(FILE_LOCATION + getThisSong);
		Files.copy(file.toPath(), resp.getOutputStream());
	}

	@RequestMapping(value="/songUpload", method=RequestMethod.POST)
	public String receiveUpload(@RequestParam("songFile") MultipartFile multiPartFile,HttpSession session,Model model) throws IOException{
		
		System.out.println("vliza3");
		File fileOnDisk = new File(FILE_LOCATION + multiPartFile.getOriginalFilename());
		Files.copy(multiPartFile.getInputStream(), fileOnDisk.toPath(), StandardCopyOption.REPLACE_EXISTING);
		getThisSong = multiPartFile.getOriginalFilename();
		try {
			UserDAO.getInstance().addProfilePicture((String)session.getAttribute("username"), FILE_LOCATION + multiPartFile.getOriginalFilename());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("profilePhoto", FILE_LOCATION + multiPartFile.getOriginalFilename());
		model.addAttribute("filename", multiPartFile.getOriginalFilename());
		return "uploadSong";

	}

}
