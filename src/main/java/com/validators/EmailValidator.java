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

		public static boolean validate(String emailStr) {
		        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(emailStr);
		        String query = "select email from users ";
		        ArrayList<String> usersEmails = new ArrayList<>();
				try {
				    PreparedStatement ps = DBManager.getInstance().getConnection().prepareStatement(query);
					ResultSet rs;
					rs = ps.executeQuery();
					while(rs.next()){
						usersEmails.add(rs.getString("email"));
					}
					for (String child : usersEmails) {
						if(child.equals(emailStr)){
							return false;
						}
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
		        return matcher.find();
		}

}
