package com.validators;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.db.DBManager;

public class UsernameValidator {

	public static boolean validate(String username){
		
		String query = "select username from soundcloud.users where username = ?;";
		 PreparedStatement ps = null;
		 System.out.println("V bazata sme" + username);
		try {
		    ps = DBManager.getInstance().getConnection().prepareStatement(query);
		    ps.setString(1, username);
			ResultSet rs;
			rs = ps.executeQuery();
			if(!rs.next()){
				return true;
			}
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		finally{
			if(ps !=null){
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return false;
		
	}
	
}
