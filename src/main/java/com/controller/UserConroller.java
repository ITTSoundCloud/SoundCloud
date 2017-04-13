package com.controller;

import java.sql.SQLException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.db.UserDAO;
import com.fasterxml.jackson.databind.deser.std.MapDeserializer;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.PasswordValidator;
import com.validators.UsernameValidator;

@Controller
@MultipartConfig
public class UserConroller {
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String welcome(
		@RequestParam(value = "username") String username,
		@RequestParam(value = "password") String password,
		@RequestParam(value = "email") String email,
		HttpServletRequest request, Model model) {
			
		System.out.println("query made");
		User user = null;

        if (validateRegister(model, username, password, email)) {
        	user = new User(username, email, password);
            if (!UserDAO.getInstance().saveUser(user)) {
            	model.addAttribute("ErrorRegMessage", "Cannot register.");
			}
            else{
            	return "home";
            }
                                               
        } 
            return "index";
         
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String welcome(
		@RequestParam(value = "username") String username,
		@RequestParam(value = "password") String password,
		HttpServletRequest request, Model model, HttpSession session) {
			System.out.println(username);
			System.out.println(password);
			User user = null;
            if (!UserDAO.getInstance().isValidLogin(username, password)) {
            	model.addAttribute("ErrorRegMessage", "Cannot login.");
            	return "index";
			}
            session.setAttribute("username", username);
            return "search1";                                                   
	}
	
	

	
	
	private boolean validateRegister(Model model, String username, String password, String email) {
		
		PasswordValidator passwordValidator = new PasswordValidator();

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()  && email != null && !email.isEmpty()) {
                if (!EmailValidator.validate(email)) {
                    model.addAttribute("ErrorRegMessage", "Wrong email format or it already exist.");
                    return false;
                }

            if (username.length() <= 30 && username.length() >= 3) {
                if (!UsernameValidator.validate(username)) {
                    model.addAttribute("ErrorRegMessage", "Username already exist");
                    return false;
                }
            } else {
                model.addAttribute("ErrorRegMessage", "Username length should be between 3 to 30 characters.");
                return false;
            }
            
            if (!passwordValidator.validate(password)) {
            	model.addAttribute("ErrorRegMessage", "Invalid password. It must contains ....");
                return false;
			}
                                  
        }      
        return true;
    }
	
	@ResponseBody
	@RequestMapping(value="/validateUser", method = RequestMethod.POST)
	public boolean validateUser(@RequestParam(value = "username") String username){
	
		System.out.println(username);
		System.out.println("validation for " + username);
		return UsernameValidator.validate(username);
	}
	
	@ResponseBody
	@RequestMapping(value="/validateEmail", method = RequestMethod.POST)
	public boolean validateEmail(@RequestParam(value = "email") String email){
		System.out.println("validation for " + email);
		
		return EmailValidator.validate(email);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/validatePassword", method = RequestMethod.POST)
	public boolean validatePassword(HttpServletRequest req){
		System.out.println("validation for " + req.getParameter("password"));
	
		//return PasswordValidator.validate(req.getParameter("password"));
		return true;

	}
	
	
	@ResponseBody
	@RequestMapping(value="/validateEverything", method = RequestMethod.POST)
	public boolean validateEverything(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "email") String email,
			HttpServletRequest request, Model model){
		System.out.println("vika li");
		return EmailValidator.validate(email) && UsernameValidator.validate(username) && true;
	}
	
	
}
