package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.model.Song;


public class LikeDAO {
	
	   private static LikeDAO instance;
	   
	   private static final String LIKE_SONG = "insert into soundcloud.songs_likes(user_id, song_id) values (?,?);";
	   private static final String REMOVE_LIKE_SONG = "delete from soundcloud.songs_likes where "
	   		+ "user_id = ? and song_id = ?";
	   private static final String GET_LIKED_SONGS = "SELECT s.song_id, s.title, s.artist, s.songphoto_path, s.user_id, s.genre, s.upload_time, s.description, "
		        + "s.timesPlayed, s.song_path FROM soundcloud.songs s"
		        + " JOIN soundcloud.songs_likes sl USING(song_id) WHERE sl.user_id = ?;";
	   private static final String GET_USERS_LIKED = "SELECT u.username,u.profilephoto_path FROM soundcloud.users u"
		        + " JOIN soundcloud.songs_likes sl USING(user_id) WHERE sl.song_id = ?;";
	   

	    public synchronized static LikeDAO getInstance() {
	        if (instance == null) {
	        	instance = new LikeDAO();
	            }
	        
	        return instance;
	    }
	    
	    
	    public void likeSong(int user_id, int song_id) throws SQLException {
	    	
	        PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(LIKE_SONG);
	        ps.setInt(1, user_id);
	        ps.setInt(2, song_id);
	        ps.executeUpdate();
	    }
	    
	    
	    public void removeLikeSong(int user_id, int song_id) throws SQLException {
	    	
	        PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(REMOVE_LIKE_SONG);
	        ps.setInt(1, user_id);
	        ps.setInt(2, song_id);
	        ps.executeUpdate();
	    }
	    
	    
	    public List<Song> getUserLikedSongs(int user_id){
	    	
	    	List<Song> likedSongs = new ArrayList<>();
			PreparedStatement ps = null;
			try {
				ps = DBManager.getInstance().getConnection().prepareStatement(GET_LIKED_SONGS);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Song song = new Song(rs.getInt("s.song_id"),
							rs.getString("s.title"),
							rs.getString("s.artist"),
							rs.getString("s.genre"),
							rs.getInt("s.user_id"),
							rs.getString("s.song_path"));

					song.setPhoto(rs.getString("s.songphoto_path"));
					song.setAbout(rs.getString("s.description"));
					song.setUploadingTime(rs.getTimestamp("s.upload_time").toLocalDateTime());
					
					likedSongs.add(song);

				}
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
			finally{
				try {
					ps.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			return likedSongs;
		}
	    
	    
	    
   public Map<String,String> getLikesOfSong(int song_id){
	    	
	   		Map<String,String> usersLiked = new HashMap<>();
			PreparedStatement ps = null;
			try {
				ps = DBManager.getInstance().getConnection().prepareStatement(GET_USERS_LIKED);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					
					usersLiked.put(rs.getString("u.username"),rs.getString("u.profilephoto_path"));
				}
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
			finally{
				if(ps != null){
					try {
						ps.close();
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}
				}
			}
			return usersLiked;
		}

	
	    

}
