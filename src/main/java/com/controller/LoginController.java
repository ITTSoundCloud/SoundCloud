package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
		@RequestMapping(value = "/home", method = RequestMethod.POST)
			public String welcome(@RequestParam(value = "username") String username,
				@RequestParam(value = "password") String password, HttpServletRequest request, Model model) {
			 
			return "search1";
			 
		 }
	 }

