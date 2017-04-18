package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Comment;

public class CommentDAO {
	
	
	private static CommentDAO instance;
	
		public synchronized static CommentDAO getInstance() {
			if (instance == null) {
				instance = new CommentDAO();
			}
			return instance;
		}
		
		
		public synchronized int addComment(String content, int user_id,int song_id) throws SQLException{
			String sql = "Insert into soundcloud.comments (content,upload_time,user_id,song_id) "
					+ "values (?,?,?,?);";
			PreparedStatement ps = null;
			
			ps = DBManager.getInstance().getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			int comment_id = 0;
			 ps.setString(1, content);
			 
			 Instant instant = Instant.now(); 
		     Timestamp t=java.sql.Timestamp.from(instant);
		     
			 ps.setTimestamp(2, t);
		     ps.setInt(3, user_id);
		     ps.setInt(4, song_id);
		     
		     ps.executeUpdate();	     
		     ResultSet rs = ps.getGeneratedKeys();
		     
		     while(rs.next()){
		    	 comment_id=rs.getInt(1);
		     }
		     
		     return comment_id;
			
		}
		
		
		public List<Comment> getComments() throws SQLException{
			
			String sql = "select comment_id,content,upload_time,user_id,song_id from soundcloud.comments;";
			List<Comment> comments = new ArrayList<Comment>();
			PreparedStatement ps = null;
	       
	            ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	comments.add(new Comment(rs.getString("content"),
	            			rs.getTimestamp("upload_time").toLocalDateTime(), 
	            			rs.getInt("comment_id"), 
	            			rs.getInt("song_id"), 
	            			rs.getInt("user_id")));
	            }
	        
	        return comments;

		}
		
		
		
	

}
