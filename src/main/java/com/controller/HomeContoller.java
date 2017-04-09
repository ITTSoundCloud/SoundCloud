package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContoller {
	
	private static final String WELCOME_VIEW = "index";
	
	@RequestMapping("/index")
	public String welcome(Model model){
			
		return WELCOME_VIEW;
		
	}
	
}
