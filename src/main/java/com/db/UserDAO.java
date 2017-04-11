package com.db;

import java.sql.PreparedStatement;
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
		String sql = "INSERT INTO users (email,username,password)"
				+ "VALUES(?,?,?)";
		PreparedStatement statement = null;
		try {
			statement =  DBManager.getInstance().getConnection().prepareStatement(sql);
			
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
		finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					System.out.println("Connection closed.");
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	
	

}
