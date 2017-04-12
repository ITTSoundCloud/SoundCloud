package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDAO {
	
	private static UserDAO instance;
	
	public synchronized static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	public synchronized boolean saveUser(User user) {

		PreparedStatement statement = null;
		try {
			String sql = "INSERT INTO users (email,username,password)"
					+ "VALUES(?,?,?)";
			statement = DBManager.getInstance().getConnection().prepareStatement(sql);
			
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getUserName());
			statement.setString(3, user.getPassword());

			int rowsAffected = statement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("Saving user successful.");
				return true;
			}

		} catch (SQLException e) {
			System.out.println("Cannot add to DB." + e.getClass().getName() + " " + e.getMessage());
			return false;
		}
		finally{
			if(statement != null){
				try {
					statement.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}
		return true;
	}
	
	
	
	public boolean isValidLogin(String username, String password) {
		PreparedStatement ps = null;
		String sql = "SELECT username, password "
				+ "FROM soundcloud.users WHERE username = ? AND password = ?;";
		try {
			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
			
			ps.setString(1, username);
			ps.setString(2, password);
			System.out.println("v igrata");
			System.out.println(username);
			System.out.println(password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()==false) {
				System.out.println("Wrong credentials.");
				return false;
			}

		} catch (SQLException e) {
			System.out.println("User cannot be logged in.");
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
		return true;
	}
	

}
