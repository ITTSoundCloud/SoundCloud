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
public class UploadController {
	
	private String vzemiToqImage;

	private static final String FILE_LOCATION = "E:" + File.separator + "scUploads" + File.separator;
	
	@RequestMapping(value="/uploadPhoto", method=RequestMethod.GET)
	public String prepareForUpload() {
		return "uploadPhoto";
	}
	

//	@RequestMapping(value="/music/{fileName}", method=RequestMethod.GET)
//	@ResponseBody
//	public void prepareForUpload(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model) throws IOException {
//		File file = new File(FILE_LOCATION + vzemiToqImage);
//		Files.copy(file.toPath(), resp.getOutputStream());
//	}
//	
//	@RequestMapping(value="/upload", method=RequestMethod.POST)
//	public String receiveUpload(@RequestParam("failche") MultipartFile multiPartFile, Model model) throws IOException{
//		
//		File fileOnDisk = new File(FILE_LOCATION + multiPartFile.getOriginalFilename());
//		Files.copy(multiPartFile.getInputStream(), fileOnDisk.toPath(), StandardCopyOption.REPLACE_EXISTING);
//		vzemiToqImage = multiPartFile.getOriginalFilename();
//		model.addAttribute("filename", multiPartFile.getOriginalFilename());
//		return "upload";
//	}
	
	@RequestMapping(value="/photo/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void uploadPhoto(@PathVariable("fileName") String fileName, HttpServletResponse resp, Model model,HttpSession session) throws IOException {
		
		File file = new File(FILE_LOCATION + vzemiToqImage);
		Files.copy(file.toPath(), resp.getOutputStream());
	}
	
	@RequestMapping(value="/uploadPhoto", method=RequestMethod.POST)
	public String receiveUpload(@RequestParam("failche") MultipartFile multiPartFile, Model model,HttpSession session) throws IOException{
		
		File fileOnDisk = new File(FILE_LOCATION + "guz");
		Files.copy(multiPartFile.getInputStream(), fileOnDisk.toPath(), StandardCopyOption.REPLACE_EXISTING);
//		vzemiToqImage = (String) session.getAttribute("username");
		model.addAttribute("filename", "guz");
		try {
			UserDAO.getInstance().addProfilePicture((String) session.getAttribute("username"), fileOnDisk.getAbsolutePath());
		} catch (SQLException e) {
			System.out.println("error posting file in DAO");
		}
		return "uploadPhoto";
		
	}
	
	
}