package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.model.Playlist;
import com.model.Song;



public class PlaylistDAO {
	
	private static PlaylistDAO instance;
	
	private PlaylistDAO(){
		
		
	}
	
	public static synchronized PlaylistDAO getInstance(){
		if(instance == null){
			instance = new PlaylistDAO();
		}
		return instance;
	}

	public int createPlaylist(int user_id, String title,String description) throws SQLException{
		String sql = "insert into soundcloud.playlists (user_id, title,description) VALUES (?,?,?) ";
		int playlist_id = 0;
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, user_id);
			ps.setString(2, title);
			ps.setString(3, description);
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			while(rs.next()){
				playlist_id = rs.getInt(1);
			}
		}
		finally{
			if(ps != null){
				ps.close();
			}
		}
		return playlist_id;
	}
	
	//add song to playlist
	public void addSongToPlayList(int playlist_id, int song_id) throws SQLException {
		String sql = "insert into soundcloud.playlists_songs (playlist_id, song_id) VALUES (?,?) ";
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			ps.setInt(2, song_id);
			ps.executeUpdate();
		}
		finally{
			if(ps != null){
				ps.close();
			}
		}
		
	}
	
	//get all playlists
	public List<Playlist> getAllPlaylists() throws SQLException {
		String sql = "select playlist_id, title, user_id,description from soundcloud.playlists";
		List<Playlist> playlists = new ArrayList<>();
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Playlist playlist = new Playlist(rs.getInt("playlist_id"), 
											rs.getString("title"),
											rs.getInt("user_id"));
				playlist.setDescription(rs.getString("description"));
				
				playlists.add(playlist);
			}
		}
		finally{
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("ops");
			}
		}
		
		
		return playlists;
	}
	
	// get playlist by user
	public List<Playlist> getUserPlaylists(int user_id) throws SQLException{
		String sql = "SELECT playlist_id, title, user_id,description FROM soundcloud.playlists where user_id = ?;";
		
		List<Playlist> userPlaylists = new ArrayList<>();
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, user_id);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()){
				Playlist playlist = new Playlist(resultSet.getInt("playlist_id"),
						resultSet.getString("title"),
						resultSet.getInt("userId"));
				playlist.setDescription(resultSet.getString("description"));
				
				userPlaylists.add(playlist);
			}
			System.out.println(userPlaylists);
		}
		
		finally{
			ps.close();
		}
		return Collections.unmodifiableList(userPlaylists);
	}
	

	// 
	public int getPlaylistId(String name){
		String sql = "select playlist_id from soundcloud.playlists where title = ?;";
		PreparedStatement ps = null;
		int id = 0;
		
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				id = rs.getInt("playlist_id");
			}
		}
		catch(SQLException e)
		{
			System.out.println("DB problem selecting the playlist.");
		}
		finally{
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("ops");
			}
		}
		return id;
	}
	
	// if song exist in the playlist
	public boolean existsInPlaylist(int song_id,int playlist_id){
		String sql = "SELECT playlist_id,song_id FROM soundcloud.playlists_songs "
				+ "WHERE playlist_id = ? AND song_id = ?";
		PreparedStatement ps = null;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			ps.setInt(2, song_id);
			ResultSet rs = ps.executeQuery();
		
			if(rs.next()){
				return false;
			}
			
			} catch (SQLException e) {
				System.out.println("ops");
			}
			finally{
				try {
					ps.close();
				} catch (SQLException e) {
					System.out.println("ops");
				}
			}
			return true;
			
		}
	
	//get all songs from playlist
	public List<Song> getAllSongsFromPlaylist(int playlist_id,int user_id) {
		
		String sql = "SELECT s.song_id, s.title, s.artist,s.genre,s.song_path,s.user_id,s.timesPlayed,s.description,"
				+ "s.songphoto_path,s.upload_time FROM soundcloud.songs s join soundcloud.playlists_songs ps"
				+ " using(song_id) where ps.playlist_id = ? AND ps.song_id = ?;";

		List<Song> songsInPlaylist = new ArrayList<Song>();
		PreparedStatement ps;
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			ps.setInt(2, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Song song = new Song(rs.getInt("song_id"), 
						rs.getString("title"), 
						rs.getString("artist"), 
						rs.getString("genre"),
						rs.getInt("user_id") ,
						rs.getString("song_path"));
				
				song.setPhoto(rs.getString("songphoto_path"));
				song.setAbout(rs.getString("description"));
				song.setUploadingTime(rs.getTimestamp("upload_time").toLocalDateTime());
				
			songsInPlaylist.add(song);
		
			}
			System.out.println("OK " + songsInPlaylist);
		} catch (SQLException e) {
			System.out.println("DB problem with selcting all songs." + e.getMessage());
		}
		return songsInPlaylist;
	}
	
	// search playlist by name 
	 public List<Playlist> searchForPLaylist(String word){
			String sql = "SELECT p.playlist_id, p.title, p.user_id,u.username,p.description FROM soundcloud.playlists p join soundcloud.users u WHERE title LIKE ?";
			String search = "%" + word + "%";
			ArrayList<Playlist> playlistsMatching = new ArrayList<>();
			PreparedStatement prepStatement = null;
			try {
				prepStatement = DBManager.getInstance().getConnection().prepareStatement(sql);
				prepStatement.setString(1, search);
				ResultSet rs = prepStatement.executeQuery();
				
				while (rs.next()) {
					Playlist playlist = new Playlist(rs.getInt("playlist_id"), 
							rs.getString("title"),
							rs.getInt("user_id"));
					playlist.setDescription(rs.getString("p.description"));
					
					playlist.setUsername(rs.getString("u.username"));
			
					playlistsMatching.add(playlist);
				}
			} catch (SQLException e) {
				System.out.println("Problem with DataBase in playlistSearch - " + e.getMessage());
			}
			
			return Collections.unmodifiableList(playlistsMatching);
		}
	 
	 
	 
	 public boolean playlistExists(String title,String description,int user_id){
			String sql = "SELECT title,description,user_id FROM soundcloud.playlists "
					+ "WHERE title = ? AND description = ? AND user_id=?;";
			PreparedStatement ps = null;
			try {
				ps = DBManager.getInstance().getConnection().prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setInt(3, user_id);
				ResultSet rs = ps.executeQuery();
			
				if(rs.next()){
					return false;
				}
				
				} catch (SQLException e) {
					System.out.println("ops");
				}
				finally{
					try {
						ps.close();
					} catch (SQLException e) {
						System.out.println("ops");
					}
				}
				return true;
				
			}
	    
	    
		
	

}
