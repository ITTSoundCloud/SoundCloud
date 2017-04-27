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
//	   private static final String COUNT_LIKES = " SELECT count(song_id) FROM soundcloud.songs_likes where song_id=?;";
	   private static final String USERS_LIKED_COMMENT= "SELECT user_id FROM soundcloud.comments_likes"
		        + " WHERE commend_id = ?;";

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
	    
	    
	    public List<Song> getUserLikedSongs(int user_id) throws SQLException {
	    	
	    	List<Song> likedSongs = new ArrayList<>();
			PreparedStatement ps = null;

				ps = DBManager.getInstance().getConnection().prepareStatement(GET_LIKED_SONGS);
				ps.setInt(1, user_id);
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
				
			return likedSongs;
		}
	    
    
   public Map<String,String> getLikesOfSong(int song_id) throws SQLException {
	    	
	   		Map<String,String> usersLiked = new HashMap<>();
			PreparedStatement ps = null;

		   
				ps = DBManager.getInstance().getConnection().prepareStatement(GET_USERS_LIKED);
				ps.setInt(1, song_id);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					
					usersLiked.put(rs.getString("u.username"),rs.getString("u.profilephoto_path"));
			}
			
			return usersLiked;
		}
   
   
   
   
  public List<Integer> getLikesOfComment(int comment_id) throws SQLException {
	    	
	   		List<Integer> usersLikedComment = new ArrayList<>();
			PreparedStatement ps = null;

		   
				ps = DBManager.getInstance().getConnection().prepareStatement(USERS_LIKED_COMMENT);
				ps.setInt(1, comment_id);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					usersLikedComment.add(rs.getInt("user_id"));
			}
			
			return usersLikedComment;
		}
	    
	    

}
