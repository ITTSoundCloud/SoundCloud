package com.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

public class User {
	
	private int userId;
	private String username;
	private String password;
	private String email;
	private String name;
	private String country;
	private String bio;
	private String profilePic;
	private ArrayList<Integer> likedSongs;
	
	public User(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.likedSongs = new ArrayList<>();
		
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setLikedSongs(ArrayList<Integer> likedSongs) {
		this.likedSongs = likedSongs;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public void likeSong(Song song){
		likedSongs.add(song.getSongId());
	}
	
	public void unlikeSong(Song song){
		likedSongs.remove(song.getSongId());
	}
	
	public int getUserId() {
		return userId;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}
	
	

}
