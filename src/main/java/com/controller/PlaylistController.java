package com.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.db.PlaylistDAO;
import com.db.UserDAO;
import com.model.User;

public class PlaylistController {

	
	@RequestMapping(value = "/addPlaylist", method = RequestMethod.POST)
	public String addPlaylist(
		@RequestParam(value = "playlist") String playlist,
		@RequestParam(value = "description") String description,
		HttpServletRequest request, HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		if (PlaylistDAO.getInstance().playlistExists(playlist, description, user.getUserId())) {
			PlaylistDAO.getInstance().createPlaylist(user.getUserId(), playlist, description);
		}
		return "song";
         
	}
	
	@RequestMapping(value = "/song_{title}", method= RequestMethod.GET)
	public String giveUser(Model model, HttpSession session, 
			@PathVariable(value="username") String username){
		System.out.println(username + "v profile_{username}");
		User visitedUser = UserDAO.getInstance().getUser(username);
		model.addAttribute("user", visitedUser);
		User currentUser = (User) session.getAttribute("user");
		session.setAttribute("usernameToFollow", username);
		System.out.println(session.getAttribute("usernameToFollow").toString() + "from the session");
		System.out.println(this.isFollowing(currentUser.getUserId(), visitedUser.getUserId()) + "follolva li");
		model.addAttribute("isFollowing", this.isFollowing(currentUser.getUserId(), visitedUser.getUserId())); // check in database if follow

		return "upload1";
	}
	
	@ResponseBody
	@RequestMapping(value="/follow", method = RequestMethod.POST)
	public void followUser(Model model,HttpSession session){
		User currentUser = (User) session.getAttribute("user");
		User visitedUser = UserDAO.getInstance().getUser(session.getAttribute("usernameToFollow").toString());
		System.out.println("kvo stava tuka follow");
		
			try {
				if(UserDAO.getInstance().followUser(currentUser.getUserId(),visitedUser.getUserId())){
					System.out.println("ok");
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
}
