package com.model;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Song {
	
	private int songId;
	private int userId;
	private String path;
	private String atrist;
	private String title;
	private String photo;
	private String genre;
	private LocalDateTime uploadingTime;
	private int timesPlayed;
	private String about;
	private ArrayList<Comment> comments;
	
	public Song(int songId, String title, String artist, String genre, int userId , String path) {
		this.songId = songId;
		this.userId = userId;
		this.title = title;
		this.genre = genre;
		this.atrist =  artist;
		this.path = path;
		this.comments = new ArrayList<>();
		
	}
	
	public int getSongId() {
		return songId;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public LocalDateTime getUploadingTime() {
		return uploadingTime;
	}

	public void setUploadingTime(LocalDateTime uploadingTime) {
		this.uploadingTime = uploadingTime;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getAtrist() {
		return atrist;
	}

	public String getTitle() {
		return title;
	}

	public String getGenre() {
		return genre;
	}

	public int getTimesPlayed() {
		return timesPlayed;
	}

	public ArrayList<Comment> getComments() {
		return comments;
	}

	public int getUserId() {
		return userId;
	}

	public String getPath() {
		return path;
	}
	
	
	

}
