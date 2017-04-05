package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContoller {
	
	private static final String WELCOME_VIEW = "welcome";
	
	@RequestMapping("/welcome")
	public String welcome(Model model){
		
		
		
		model.addAttribute("captionOne", "Welcome to the jungle!");
		model.addAttribute("captionTwo", "This is where the lion lives.");
		model.addAttribute("captionThree", "I dunno what to say.");
		
		return WELCOME_VIEW;
		
	}
	
}
