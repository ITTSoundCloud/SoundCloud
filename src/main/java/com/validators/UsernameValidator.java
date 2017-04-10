package com.validators;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.db.DBManager;

public class UsernameValidator {

	public static boolean validate(String username){
		
		String query = "select username from users ";
        ArrayList<String> usersEmails = new ArrayList<>();
		try {
		    PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query);
			ResultSet rs;
			rs = ps.executeQuery();
			while(rs.next()){
				usersEmails.add(rs.getString("email"));
			}
			for (String child : usersEmails) {
				if(child.equals(username)){
					return false;
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return true;
		
	}
	
}
