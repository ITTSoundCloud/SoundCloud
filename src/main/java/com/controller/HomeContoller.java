package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContoller {
	
	private static final String WELCOME_VIEW = "upload";
	
	@RequestMapping("/index")
	public String welcome(Model model){
			
		return WELCOME_VIEW;
		
	}
	
	
	@RequestMapping("/search_text")
	public String search(Model model){
			
		return WELCOME_VIEW;
		
	}
	
}
