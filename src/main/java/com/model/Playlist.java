package com.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Playlist {
	
	private int playlistId;
	private String title;
	private int userId;
	private ArrayList<Song> songs;
	private String description;
	private String username;
	

	public Playlist(int playlistId, String title, int userId) {
		this.playlistId = playlistId;
		this.title = title;
		this.userId = userId;
		this.songs = new ArrayList<>();
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getPlaylistId() {
        return playlistId;
    }

    public String getTitle() {
        return title;
    }

    public int getUserId() {       
        return userId;
    }

    public List<Song> getAllSongs() {
        return Collections.unmodifiableList(songs);
    }

    public void addSong(Song song) {
        songs.add(song);
    }
    
    public void removeSong(Song song){
    	songs.remove(song);
    }
    
    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
}
