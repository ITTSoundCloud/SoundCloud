package com.validators;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.db.DBManager;

public class EmailValidator {
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
		    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
		//if exist in database returns false 
		public static boolean validate(String emailStr) {
		        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(emailStr);
		        String query = "select email from soundcloud.users where email = ?;";
		        PreparedStatement ps = null;

				try {
				    ps = DBManager.getInstance().getConnection().prepareStatement(query);
				    ps.setString(1, emailStr);
					ResultSet rs;
					rs = ps.executeQuery();
					if(rs.next()){
						return false;
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
							e.printStackTrace();
						}
					}
				}
				
		        return matcher.find();
		}

}
