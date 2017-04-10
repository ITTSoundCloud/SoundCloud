package com.model;

import java.util.ArrayList;

public class User {
	
	private int userId;
	private String userName;
	private String password;
	private String email;
	private String name;
	private String country;
	private String bio;
	private String profilePic;
	private ArrayList<Integer> likedSongs;
	
	public User(String userName, String email, String password) {
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.likedSongs = new ArrayList<>();
		
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

	public String getUserName() {
		return userName;
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
