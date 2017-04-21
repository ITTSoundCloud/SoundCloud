package com.db;

import java.sql.Connection;
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

	
	public int createPlaylist(int user_id, String title) throws SQLException{
		String sql = "insert into soundcloud.playlists (user_id, title) VALUES (?,?) ";
		int playlist_id = 0;
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, user_id);
			ps.setString(2, title);
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
	

	public List<Playlist> getAllPlaylists() throws SQLException {
		String sql = "select playlist_id, title, user_id from soundcloud.playlists";
		List<Playlist> playlists = new ArrayList<>();
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				playlists.add(new Playlist(rs.getInt("playlist_id"), 
											rs.getString("title"),
											rs.getInt("user_id")));
				
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
	
	
	public List<Playlist> getUserPlaylists(int user_id) throws SQLException{
		String sql = "SELECT playlist_id, title, user_id FROM soundcloud.playlists where user_id = ?;";
		
		List<Playlist> userPlaylists = new ArrayList<>();
		PreparedStatement ps = null;
		try{
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, user_id);
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()){
				userPlaylists.add(new Playlist(resultSet.getInt("p.playlist_id"),
						resultSet.getString("p.title"),
						resultSet.getInt("p.userId")));
			}
			System.out.println(userPlaylists);
		}
		
		finally{
			ps.close();
		}
		return Collections.unmodifiableList(userPlaylists);
	}
	

	
	public int getPlaylistId(String name){
		String sql = "select playlist_id from soundcloud.playlists where title = ?;";
		PreparedStatement ps = null;
		int id = 0;
		
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				id = rs.getInt("playlist_Id");
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
		
	

}
