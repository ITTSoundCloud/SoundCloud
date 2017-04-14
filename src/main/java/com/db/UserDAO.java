package com.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDAO {
	
	private static UserDAO instance;
	
	public synchronized static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	//insert user
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
	
	
	//login validation
	public boolean isValidLogin(String username, String password) {
		PreparedStatement ps = null;
		String sql = "SELECT username, password "
				+ "FROM soundcloud.users WHERE username = ? AND password = ?;";
		try {

			ps = DBManager.getInstance().getConnection().prepareStatement(sql);
		
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (!(rs.next())) {
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
	
	//update name of the user
	public void editName(String username, String newName){

        PreparedStatement ps = null;
        try {
        	ps = DBManager.getInstance().getConnection().prepareStatement("UPDATE soundcloud.users SET name = ? WHERE username = ?");
        	
            ps.setString(1, newName);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
        	System.out.println("User name cannot be update.");
			e.printStackTrace();
		} finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error with closing statement in editName() method ");
                    e.printStackTrace();
                }
            }
        }
    }
	
	//update country
	public void editCountry(String username, String newCountry){

        PreparedStatement ps = null;
        try {
        	ps = DBManager.getInstance().getConnection().prepareStatement("UPDATE soundcloud.users SET country = ? WHERE username = ?");
        	
            ps.setString(1, newCountry);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
        	System.out.println("Country cannot be update.");
			e.printStackTrace();
		} finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error with closing statement in editCountry() method ");
                    e.printStackTrace();
                }
            }
        }
    }
	
	//update description
	public void editDescription(String username, String newDescription){

        PreparedStatement ps = null;
        try {
        	ps = DBManager.getInstance().getConnection().prepareStatement("UPDATE soundcloud.users SET description = ? WHERE username = ?");
        	
            ps.setString(1, newDescription);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
        	System.out.println("Description cannot be update.");
			e.printStackTrace();
		} finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error with closing statement in editDescription() method ");
                    e.printStackTrace();
                }
            }
        }
    }
	
	//update photo path
	public void editPhoto(int userId, String newPhotoPath){

        PreparedStatement ps = null;
        try {
        	ps = DBManager.getInstance().getConnection().prepareStatement("UPDATE soundcloud.users SET profilephoto_path = ? WHERE user_id =?");
        	
            ps.setString(1, newPhotoPath);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
        	System.out.println("Photo path cannot be update.");
			e.printStackTrace();
		} finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error with closing statement in editPhoto() method ");
                    e.printStackTrace();
                }
            }
        }
    }
	
	//update password
	public void editPassword(int userId, String newPassword){

        PreparedStatement ps = null;
        try {
        	ps = DBManager.getInstance().getConnection().prepareStatement("UPDATE soundcloud.users SET password=? WHERE user_id=?");
        	
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
        	System.out.println("Photo path cannot be update.");
			e.printStackTrace();
		} finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("Error with closing statement in editPhoto() method ");
                    e.printStackTrace();
                }
            }
        }
    }
	
	
	
	   public boolean followUser(int follower_id, int followed_id) throws SQLException {
		   
	        String sql = "insert into soundcloud.who_follows_who (follower_id, followed_id) values (?,?);";
	        PreparedStatement ps = null;
	        try {
	            ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ps.setInt(1, follower_id);
	            ps.setInt(2, followed_id);
	            int rowsAff = ps.executeUpdate();
	            if(rowsAff > 0){
	            	return true;
	            }
	        } 
	        finally {
	            if (ps != null) {
	                try {
	                    ps.close();
	                } catch (SQLException e) {
	                    System.out.println(e.getMessage());
	                }
	            }
	        }
	        
	     return false;

	    }
	   
	   
	   
	   public boolean unfollow(int follower_id, int followed_id) throws SQLException {
	        String sql = "delete from soundcloud.who_follows_who where follower_id = ? AND followed_id = ?;";
	        PreparedStatement ps = null;
	        
	        try {
	        	ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ps.setInt(1, follower_id);
	            ps.setInt(2, followed_id);
	            
	            int rowsAff = ps.executeUpdate();
	            
	            if(rowsAff > 0){
	            	return true;
	            }
	        } catch (SQLException e) {
	        	System.out.println(e.getMessage());
				
			}
	         finally {
	        	
	            if (ps != null) {
	                try {
	                    ps.close();
	                } catch (SQLException e) {
	                    System.out.println(e.getMessage());
	                }
	            }
	        }
	       return false;
	    }
	   
	   
	   
	   public List<Integer> getFollowing(int follower_id) {
	        
	        String sql = "select followed_id from soundcloud.who_follows_who where follower_id = ?;";
	        		
	        ArrayList<Integer> following = new ArrayList<>();
	        PreparedStatement ps = null;
	        
	        try {
	        	ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ps.setInt(1, follower_id);
	            
	            ResultSet rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                following.add(rs.getInt("followed_id"));
	            }
	            
	        } catch (SQLException e) {
	            System.out.println("Error with getting following UserDAO");
	            e.printStackTrace();
	            
	        } finally {
	            if (ps != null) {
	                try {
	                    ps.close();
	                } catch (SQLException e) {
	                    System.out.println(e.getMessage());
	                    e.printStackTrace();
	                }
	            }
	        }
	        return following;
	    }
	   
	
	   
	   public List<Integer> getFollowers(int followed_id) {
	        
	        String sql = "select follower_id from soundcloud.who_follows_who where followed_id = ?;";
	        
	        ArrayList<Integer> followers = new ArrayList();
	        PreparedStatement ps = null;
	        try {
	        	ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ps.setInt(1, followed_id);
	            ResultSet rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                followers.add(rs.getInt("follower_id"));
	            }
	        } 
	        catch (SQLException e) {
	            System.out.println("Error getting followers of user.");    
	        }
	        finally {
	            if (ps != null) {
	                try {
	                    ps.close();
	                } catch (SQLException e) {
	                    System.out.println(e.getMessage());
	                    
	                }
	            }
	        }
	        return followers;
	    }
	   
	   
	   public void addProfilePicture(String username, String photo) throws SQLException {
	        String sql = "update soundcloud.users set profilephoto_path = ? where username = ?;";
	        PreparedStatement ps = null;
	        try {
	            ps = DBManager.getInstance().getConnection().prepareStatement(sql);
	            ps.setString(1, photo);
	            ps.setString(2, username);
	            System.out.println(ps.executeUpdate());
	            System.out.println("promenqme");
	            System.out.println(photo);
	            ps.executeUpdate();
	        } finally {
	            if (ps != null) {
	                try {
	                    ps.close();
	                } catch (SQLException e) {
	                    System.out.println("Error in UserDAO");
	                    e.printStackTrace();
	                }
	            }
	        }

	    }


}
