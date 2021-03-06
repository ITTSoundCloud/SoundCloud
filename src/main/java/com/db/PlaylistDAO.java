package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

				Playlist playlist = new Playlist(
						resultSet.getInt("playlist_id"),
						resultSet.getString("title"),
						resultSet.getInt("user_Id"));

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
	
	
	
	//get username and playlist object
	public Map<String,Playlist> getPlaylist(int playlist_id) throws SQLException{
		String sql = "SELECT p.playlist_id, p.title, p.user_id,u.username,p.description FROM soundcloud.playlists p join soundcloud.users u"
				+ " using(user_id) where p.playlist_id = ?;";
		
		Map<String,Playlist> playlists = new HashMap<>();
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()){

				Playlist playlist = new Playlist(
						resultSet.getInt("p.playlist_id"),
						resultSet.getString("p.title"),
						resultSet.getInt("p.user_Id"));

				playlist.setDescription(resultSet.getString("p.description"));
				playlists.put(resultSet.getString("u.username"), playlist);
				
			}
		
		}
		
		finally{
			ps.close();
		}
		return Collections.unmodifiableMap(playlists);
	}
	
	

	// for? TODO
	public int getPlaylistId(String name) throws SQLException {
		String sql = "select playlist_id from soundcloud.playlists where title = ?;";
		PreparedStatement ps = null;
		int id = 0;
		

			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				id = rs.getInt("playlist_id");
			}
				
		return id;
	}
	
	// if song exist in the playlist
	public boolean existsInPlaylist(int song_id,int playlist_id) throws SQLException {
		String sql = "SELECT playlist_id,song_id FROM soundcloud.playlists_songs "
				+ "WHERE playlist_id = ? AND song_id = ?";
		PreparedStatement ps = null;

			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			ps.setInt(2, song_id);
			ResultSet rs = ps.executeQuery();
		
			if(rs.next()){
				return false;
			}
						
			return true;
			
		}
	
	//get all songs from playlist
	public List<Song> getAllSongsFromPlaylist(int playlist_id) throws SQLException {
		
		String sql = "SELECT s.song_id, s.title, s.artist,s.genre,s.song_path,s.user_id,s.timesPlayed,s.description,"
				+ "s.songphoto_path,s.upload_time FROM soundcloud.songs s join soundcloud.playlists_songs ps"
				+ " using(song_id) where ps.playlist_id = ?;";

		List<Song> songsInPlaylist = new ArrayList<Song>();
		PreparedStatement ps;

			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, playlist_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Song song = new Song(rs.getInt("s.song_id"), 
						rs.getString("s.title"), 
						rs.getString("s.artist"), 
						rs.getString("genre"),
						rs.getInt("s.user_id") ,
						rs.getString("s.song_path"));
				
				song.setPhoto(rs.getString("s.songphoto_path"));
				song.setAbout(rs.getString("s.description"));
				song.setUploadingTime(rs.getTimestamp("s.upload_time").toLocalDateTime());
				
			songsInPlaylist.add(song);
		
			}
			System.out.println("OK " + songsInPlaylist);
		
		return songsInPlaylist;
	}
	
	// search playlist by name 
	 public List<Playlist> searchForPLaylist(String word) throws SQLException {
			String sql = "SELECT p.playlist_id, p.title, p.user_id,u.username,p.description FROM soundcloud.playlists p join soundcloud.users u using(user_id) WHERE p.title LIKE ?";
			String search = "%" + word + "%";
			ArrayList<Playlist> playlistsMatching = new ArrayList<>();
			PreparedStatement prepStatement = null;

				prepStatement = DBManager.getInstance().getConnection().prepareStatement(sql);
				prepStatement.setString(1, search);
				ResultSet rs = prepStatement.executeQuery();
				
				while (rs.next()) {
					Playlist playlist = new Playlist(rs.getInt("p.playlist_id"), 
							rs.getString("p.title"),
							rs.getInt("p.user_id"));
					playlist.setDescription(rs.getString("p.description"));
					
					playlist.setUsername(rs.getString("u.username"));
			
					playlistsMatching.add(playlist);
				}
			
			
			return Collections.unmodifiableList(playlistsMatching);
		}
	 
	 
	 
	 public boolean playlistExists(String title,String description,int user_id) throws SQLException {
			String sql = "SELECT title,description,user_id FROM soundcloud.playlists "
					+ "WHERE title = ? AND description = ? AND user_id=?;";
			PreparedStatement ps = null;

				ps = DBManager.getInstance().getConnection().prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, description);
				ps.setInt(3, user_id);
				ResultSet rs = ps.executeQuery();
			
				if(rs.next()){
					return false;
				}

				return true;
				
			}

}
