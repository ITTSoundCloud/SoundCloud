package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.CopyOption;
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
import com.model.User;


@Controller
@SessionAttributes("filename")
@MultipartConfig
public class UploadImageController {

	private String getThisImage;

	private static final String FILE_LOCATION = "E:"+File.separator+"scUploads"+ File.separator + "pics" + File.separator;

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String prepareForUpload(HttpSession session) {
		return "uploadNewProfile";
	}


	@RequestMapping(value="/image/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model) throws IOException {
		File file = new File(FILE_LOCATION + getThisImage);
		Files.copy(file.toPath(), resp.getOutputStream());
	}

	@RequestMapping(value="/upload", method=RequestMethod.POST)
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
		session.setAttribute("profilePhoto", FILE_LOCATION + multiPartFile.getOriginalFilename());
		model.addAttribute("filename", multiPartFile.getOriginalFilename());
		return "uploadNewProfile";

	}

}