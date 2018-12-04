package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
import model.bean.Subject;
import model.bean.User;

public class UserDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}
	
	public User findByToken(String token) {
		connection = connectDBLibrary.getConnectMySQL();
		User objUser = null;
		String query = "SELECT * FROM user WHERE token = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, token);
			rs = pst.executeQuery();
			while(rs.next()) {				
				objUser = new User(rs.getInt("id_user"),rs.getInt("id_role"),rs.getString("username"),rs.getString("password"),rs.getString("token"),
						rs.getString("fullname"),rs.getString("address"),rs.getString("city"),rs.getInt("gender"),rs.getString("email"),rs.getString("phone"),
						rs.getString("birthday"),rs.getString("date_join"),rs.getString("avatar"),rs.getInt("rate"),rs.getInt("enabled"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return objUser;
	}
	
	public User get(String username) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "SELECT * FROM user WHERE username = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while(rs.next()) {				
				return new User(rs.getInt("id_user"),rs.getInt("id_role"),rs.getString("username"),rs.getString("password"),rs.getString("token"),
						rs.getString("fullname"),rs.getString("address"),rs.getString("city"),rs.getInt("gender"),rs.getString("email"),rs.getString("phone"),
						rs.getString("birthday"),rs.getString("date_join"),rs.getString("avatar"),rs.getInt("rate"),rs.getInt("enabled"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public boolean add(User user) {
		connection = connectDBLibrary.getConnectMySQL();
		if(Check(user)) {
		String query = "INSERT INTO user(id_role, username, password, token, fullname, address, city, gender, email, phone, birthday,"
				+ "date_join, avatar, rate, enabled) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, user.getId_role());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getToken());
			pst.setString(5, user.getFullname());
			pst.setString(6, user.getAddress());
			pst.setString(7, user.getCity());
			pst.setInt(8, user.getGender());
			pst.setString(9, user.getEmail());
			pst.setString(10, user.getPhone());
			pst.setString(11, user.getBirthhday());
			pst.setString(12, user.getDate_join());
			pst.setString(13, user.getAvatar());
			pst.setInt(14, user.getRate());
			pst.setInt(15, user.getEnabled());
			int r = pst.executeUpdate();
			return (r == 1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		return false;
	}
	
	private boolean Check(User user) {
		boolean check=true;
		UserDAO userDAO= new UserDAO();
		ArrayList<User>list=userDAO.getListUsers();
		for(int i=0; i<list.size();i++) {
			if(user.getUsername().equals(list.get(i).getUsername())) {
				check= false;
			}
		}
		return check;
	}

	public boolean edit(User user) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE user SET id_role = ?, fullname = ?, address = ?, city = ?, gender = ?, email = ?, phone = ?, birthday = ?,"
				+ "avatar = ?, enabled = ? WHERE username = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, user.getId_role());
			pst.setString(2, user.getFullname());
			pst.setString(3, user.getAddress());
			pst.setString(4, user.getCity());
			pst.setInt(5, user.getGender());
			pst.setString(6, user.getEmail());
			pst.setString(7, user.getPhone());
			pst.setString(8, user.getBirthhday());
			pst.setString(9, user.getAvatar());
			pst.setInt(10, user.getEnabled());
			pst.setString(11, user.getUsername());
			
			int r = pst.executeUpdate();
			if (r>0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean delete(int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM user WHERE id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			result = pst.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public ArrayList<User> getListUsers() {
		ArrayList<User> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from user;";
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				User obj = new User(rs.getInt("id_user"),rs.getInt("id_role"),rs.getString("username"),rs.getString("password"),rs.getString("token"),
						rs.getString("fullname"),rs.getString("address"),rs.getString("city"),rs.getInt("gender"),rs.getString("email"),rs.getString("phone"),
						rs.getString("birthday"),rs.getString("date_join"),rs.getString("avatar"),rs.getInt("rate"),rs.getInt("enabled"));
				listItems.add(obj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				st.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listItems;
	}

	public User findByIDUser(int idUser) {
			connection = connectDBLibrary.getConnectMySQL();
			User objUser = null;
			String query = "SELECT * FROM user WHERE id_user = ?;";
			try {
				pst = connection.prepareStatement(query);
				pst.setInt(1, idUser);
				rs = pst.executeQuery();
				while(rs.next()) {				
					objUser = new User(rs.getInt("id_user"),rs.getInt("id_role"),rs.getString("username"),rs.getString("password"),rs.getString("token"),
							rs.getString("fullname"),rs.getString("address"),rs.getString("city"),rs.getInt("gender"),rs.getString("email"),rs.getString("phone"),
							rs.getString("birthday"),rs.getString("date_join"),rs.getString("avatar"),rs.getInt("rate"),rs.getInt("enabled"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pst.close();
					connection.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return objUser;
		
	}

	public ArrayList<User> getListUserOffset(int offset) {
		ArrayList<User> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from user limit 5 offset "+offset+";";
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				User obj = new User(rs.getInt("id_user"),rs.getInt("id_role"),rs.getString("username"),rs.getString("password"),rs.getString("token"),
						rs.getString("fullname"),rs.getString("address"),rs.getString("city"),rs.getInt("gender"),rs.getString("email"),rs.getString("phone"),
						rs.getString("birthday"),rs.getString("date_join"),rs.getString("avatar"),rs.getInt("rate"),rs.getInt("enabled"));
				listItems.add(obj);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				st.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listItems;
	}

	public int countItems() {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM user";
		try {
			pst = connection.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
			   count = rs.getInt("rowcount") ;
			}
			  
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
}
