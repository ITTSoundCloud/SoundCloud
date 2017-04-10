package com.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.db.UserDAO;
import com.model.User;
import com.validators.EmailValidator;
import com.validators.PasswordValidator;
import com.validators.UsernameValidator;

@Controller
public class UserConroller {
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String welcome(
		@RequestParam(value = "username") String username,
		@RequestParam(value = "password") String password,
		@RequestParam(value = "email") String email,
		HttpServletRequest request, Model model) {
			
		User user = null;

        if (validateRegister(model, username, password, email)) {
        	user = new User(username, email, password);
        	System.out.println(user.getEmail());
            if (!UserDAO.getInstance().saveUser(user)) {
            	model.addAttribute("ErrorRegMessage", "Cannot register.");
			}
            else{
            	return "home";
            }
                                               
        } 
            return "index";
         
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
	

}