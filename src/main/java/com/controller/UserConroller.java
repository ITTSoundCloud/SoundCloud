package com.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Validator;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	//lll
	private PasswordValidator passValidator = new PasswordValidator();
	
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
            	return "search1";
            }
                                               
        } 
            return "index";
         
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String welcome(
			@RequestParam(value = "username-login") String username,
		HttpServletRequest request, Model model, HttpSession session) {
		 	session.setAttribute("username", username);
		 	Set<User> allUsers = UserDAO.getInstance().getAllUsers();
		 	for(User u : allUsers){
		 		System.out.println(u);
		 	}
		 	model.addAttribute("user", UserDAO.getInstance().getUser((String) session.getAttribute("username")));
		 	model.addAttribute("allUsers", allUsers);
            return "search1";                                                   
	}
	
	

		@RequestMapping(value = "/profile_{username}", method= RequestMethod.GET)
		public String daiMiCankovci(Model model, HttpSession s, 
				@PathVariable(value="username") String username){
			model.addAttribute("user", UserDAO.getInstance().getUser(username));
			return "uploadNewProfile";
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
		System.out.println("validateUser");
		System.out.println(username);
		
		System.out.println("validation username for " + username);
		return UsernameValidator.validate(username);
	}
	
	@ResponseBody
	@RequestMapping(value="/validateEmail", method = RequestMethod.POST)
	public boolean validateEmail(@RequestParam(value = "email") String email){
		System.out.println("validation for " + email);
		System.out.println("validateEmail");
		return EmailValidator.validate(email);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/validatePassword", method = RequestMethod.POST)
	public boolean validatePassword(HttpServletRequest req){
		System.out.println("validation for " + req.getParameter("password"));
		System.out.println("validatePassword");
		return this.passValidator.validate(req.getParameter("password"));

	}
	
	
	@ResponseBody
	@RequestMapping(value="/validateEverything", method = RequestMethod.POST)
	public boolean validateEverything(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "email") String email,
			HttpServletRequest request, Model model){
		System.out.println("validateEverything");
		return EmailValidator.validate(email) && UsernameValidator.validate(username) && passValidator.validate(password);
	}
	
	@ResponseBody
	@RequestMapping(value="/validateAllLogin", method = RequestMethod.POST)
	public boolean validateAllLogin(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			HttpServletRequest request, Model model){
		System.out.println("all validation username " + username);
		System.out.println("all validation pass " + password);
		
		return UserDAO.getInstance().isValidLogin(username, password);
	}
	
	
	
}
