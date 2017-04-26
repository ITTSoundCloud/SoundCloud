package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.model.Song;
import com.model.User;

public class SongDAO {

	private static SongDAO instance;
	private static final String SELECT_SONGS_BY_GENRE =
	        "SELECT s.song_id, s.title, s.artist, s.songphoto_path, s.user_id, s.genre, s.upload_time, s.description, "
	        + "s.timesPlayed, s.song_path FROM soundcloud.songs s"
	        + " JOIN soundcloud.genres g USING(genre) WHERE g.genre = ?;";

	public synchronized static SongDAO getInstance() {
		if (instance == null) {
			instance = new SongDAO();
		}
		return instance;
	}


	public List<Song> getAllSongs() throws SQLException {
		List<Song> songs = new ArrayList<Song>();
		String sql = "SELECT s.song_id, s.title, s.artist, s.songphoto_path, s.user_id, s.genre, s.upload_time,"
				+ "s.description, s.timesPlayed, s.song_path,count(sl.song_id) FROM soundcloud.songs s "+
				"left outer join soundcloud.songs_likes sl using(song_id) group by s.song_id;";
		
		PreparedStatement ps = null;


			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
		ResultSet resultSet = ps.executeQuery();

		while (resultSet.next()) {

			Song song = new Song(resultSet.getInt("s.song_id"),
					resultSet.getString("s.title"),
					resultSet.getString("s.artist"),
					resultSet.getString("s.genre"),
					resultSet.getInt("s.user_id"),
					resultSet.getString("s.song_path"));

			song.setPhoto(resultSet.getString("s.songphoto_path"));
			song.setAbout(resultSet.getString("s.description"));
			song.setUploadingTime(resultSet.getTimestamp("s.upload_time").toLocalDateTime());
			song.setLikes(resultSet.getInt("count(sl.song_id)"));
			
			System.out.println(song.getSongId());
			songs.add(song);

		}
		
		return songs;
	}
	
	

	//get song by title
	public Song getSong(String title) throws SQLException {
		String sql = "SELECT s.song_id, s.title, s.artist, s.songphoto_path, s.user_id, s.genre, s.upload_time," +
				"s.description, s.timesPlayed, s.song_path,count(sl.song_id) FROM soundcloud.songs s " +
					"left outer join soundcloud.songs_likes sl using(song_id) where s.title = ? group by s.song_id;";
		Song song = null;
		PreparedStatement ps = null;
		System.out.println("V DB SME " + title);

		ps = DBManager.getInstance().getConnection().prepareStatement(sql);
		ps.setString(1, title);
		ResultSet resultSet = ps.executeQuery();

		while (resultSet.next()) {

			song = new Song(resultSet.getInt("s.song_id"),
					resultSet.getString("s.title"),
					resultSet.getString("s.artist"),
					resultSet.getString("s.genre"),
					resultSet.getInt("s.user_id"),
					resultSet.getString("s.song_path"));

			song.setPhoto(resultSet.getString("s.songphoto_path"));
			song.setAbout(resultSet.getString("s.description"));
			song.setUploadingTime(resultSet.getTimestamp("s.upload_time").toLocalDateTime());
			song.setLikes(resultSet.getInt("count(sl.song_id)"));

		}
		return song;

	}

	public int uploadSong(int user_id, String title, String artist, String song_path, String songphoto_path,
			String description, String genre) throws SQLException {

		String sql = "INSERT INTO soundcloud.songs(user_id, title, artist, songphoto_path, song_path, description, genre, upload_time,timesPlayed) "
				+ "VALUES (?,?,?,?,?,?,?,?,0)";

		PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(sql,
				Statement.RETURN_GENERATED_KEYS);
		ps.setInt(1, user_id);
		ps.setString(2, title);
		ps.setString(3, artist);
		ps.setString(4, songphoto_path);
		ps.setString(5, song_path);
		ps.setString(6, description);
		ps.setString(7, genre);

		Instant instant = Instant.now();
		Timestamp t = java.sql.Timestamp.from(instant);

		ps.setTimestamp(8, t);
		int song_id = 0;
		song_id = ps.executeUpdate();
		ResultSet rs = ps.getGeneratedKeys();
		if (rs.next()) {
			song_id = rs.getInt(1);
		}
		return song_id;
	}

	public List<Song> searchForSong(String word) throws SQLException {
		String sql = "SELECT song_id, title, artist,genre,song_path,user_id,timesPlayed,description,songphoto_path,"
				+ "upload_time FROM soundcloud.songs WHERE title LIKE ? OR artist LIKE ?";
		String search = "%" + word + "%";
		ArrayList<Song> songsMatching = new ArrayList<>();
		PreparedStatement prepStatement = null;

			prepStatement = DBManager.getInstance().getConnection().prepareStatement(sql);
			prepStatement.setString(1, search);
			prepStatement.setString(2, search);
			ResultSet rs = prepStatement.executeQuery();

			while (rs.next()) {
				Song song = new Song(rs.getInt("song_id"), rs.getString("title"), rs.getString("artist"),
						rs.getString("genre"), rs.getInt("user_id"), rs.getString("song_path"));

				song.setPhoto(rs.getString("songphoto_path"));
				song.setAbout(rs.getString("description"));
				song.setUploadingTime(rs.getTimestamp("upload_time").toLocalDateTime());

				songsMatching.add(song);
			}
		
		return Collections.unmodifiableList(songsMatching);
	}

	public void increaseTimesPlayed(int song_id) throws SQLException {
		String sql = "update soundcloud.songs set timesPlayed=timesPlayed+1 where song_id = ?;";
		PreparedStatement ps = null;

			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			ps.setInt(1, song_id);
			int rowsAff = ps.executeUpdate();
			if (rowsAff > 0) {
				System.out.println("success");
			}
		
	}
	
	
	public List<String> getGenres() throws SQLException {
		
		String sql = "select genre from soundcloud.genres";
		ArrayList<String> genres = new ArrayList<>();
		PreparedStatement prepStatement = null;

			prepStatement = DBManager.getInstance().getConnection().prepareStatement(sql);
			ResultSet rs = prepStatement.executeQuery();
			while(rs.next()){
				genres.add(rs.getString("genre"));
			}
		
		return Collections.unmodifiableList(genres);
	}
	
	
	public List<Song> getGenreSongs(String genre) throws SQLException {
		List<Song> songsInGenre = new ArrayList<Song>();
		PreparedStatement ps=null;

			ps = DBManager.getInstance().getConnection().prepareStatement(SELECT_SONGS_BY_GENRE);
			ps.setString(1, genre);
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
				
				songsInGenre.add(song);
				
			}
		
		return Collections.unmodifiableList(songsInGenre);
	}
	
	
}
