package com.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Song;

public class SongDAO {
	
private static SongDAO instance;
	
	public synchronized static SongDAO getInstance() {
		if (instance == null) {
			instance = new SongDAO();
		}
		return instance;
	}
	
	// get all songs
    public List<Song> getAllPosts() {
        List<Song> songs = new ArrayList<Song>();
        try {
            Statement st = DBManager.getInstance().getConnection().createStatement();
            ResultSet resultSet = st.executeQuery("");
            while (resultSet.next()) {
            //	songs.add(new Song(songId, title, artist, genre, userId, path));
            	
            }
        } catch (SQLException e) {
            System.err.println("Error, cannot make postsDAO statement.");
        }
        return songs;
    }

}
