package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
    
    
    
    
    public int uploadSong(int user_id,String title,String artist, String song_path, String songphoto_path, String description, String genre) throws SQLException {
    	
       String sql = "INSERT INTO soundcloud.songs(user_id, title, artist, songphoto_path, song_path, description, genre, upload_time,timesPlayed) "
       		+ "VALUES (?,?,?,?,?,?,?,?,0)";

        PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, user_id);
        ps.setString(2, title);
        ps.setString(3, artist);
        ps.setString(4, songphoto_path);
        ps.setString(5, song_path);
        ps.setString(6, description);
        ps.setString(7, genre);
          
        Instant instant = Instant.now(); 
        Timestamp t=java.sql.Timestamp.from(instant);
  
        ps.setTimestamp(8, t);
        int song_id = 0;
        song_id = ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            song_id = rs.getInt(1);
        }
        return song_id;
    }
    
    
    

}
