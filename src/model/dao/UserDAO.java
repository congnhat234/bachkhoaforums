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
import utils.CryptoUtils;
import utils.SlugUtils;

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
		String query = "SELECT * FROM user WHERE token = ? && enabled = 1;";
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
			if(SlugUtils.makeSlug(user.getUsername()).equals(SlugUtils.makeSlug(list.get(i).getUsername()))) {
				check= false;
			}
		}
		return check;
	}

	public boolean edit(User user) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE user SET id_role = ?, fullname = ?,password=?,token=?, address = ?, city = ?, gender = ?, email = ?, phone = ?, birthday = ?,"
				+ "avatar = ?, enabled = ? WHERE username = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, user.getId_role());
			pst.setString(2, user.getFullname());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getToken());
			pst.setString(5, user.getAddress());
			pst.setString(6, user.getCity());
			pst.setInt(7, user.getGender());
			pst.setString(8, user.getEmail());
			pst.setString(9, user.getPhone());
			pst.setString(10, user.getBirthhday());
			pst.setString(11, user.getAvatar());
			pst.setInt(12, user.getEnabled());
			pst.setString(13, user.getUsername());
			
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
	
	public ArrayList<User> getListUsersEnabled() {
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
	public User findByUserName(String username) {
		connection = connectDBLibrary.getConnectMySQL();
		User objUser = null;
		String query = "SELECT * FROM user WHERE username = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, username);
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
	
	public int countItemsEnabled() {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM user WHERE enabled = 1;";
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

	public int getStatus(int idUser) {
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT enabled FROM user WHERE id_user = ?;";
		int result = 0;
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			rs = pst.executeQuery();
			while(rs.next()){
			result = rs.getInt("enabled");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public boolean setStatus(int idUser, int i) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE user SET enabled = ? WHERE id_user = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, i);
			pst.setInt(2, idUser);
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

	public boolean changePassWord(int userid, String token,String password) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE user SET token = ?,password=? WHERE id_user = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setString(1,token );
			pst.setString(2, password);
			pst.setInt(3, userid);
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
	public int getRate(int idUser) {
		int count=0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql="select rate from user WHERE id_user=?;";
		
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			rs = pst.executeQuery();
			while(rs.next()){
			count = rs.getInt("rate");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	public boolean setRate(int idUser, int rate) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE user SET rate = ? WHERE id_user = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, rate);
			pst.setInt(2, idUser);
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

	public int findByUserNameAndEmail(String username, String email) {
		connection = connectDBLibrary.getConnectMySQL();
		int count = 0;
		String query = "SELECT COUNT(*) AS count FROM user WHERE username = ? && email = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, email);
			rs = pst.executeQuery();
			while(rs.next()) {				
				count = rs.getInt("count");
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
		return count;
	}
	
	public boolean resetPassword(String username, String uuid) {
		connection = connectDBLibrary.getConnectMySQL();
		String passwordCryp = CryptoUtils.md5(uuid);
		String token = CryptoUtils.md5(username + uuid);
		String query = "UPDATE user SET password = ?, token = ? WHERE username = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setString(1, passwordCryp);
			pst.setString(2, token);
			pst.setString(3, username);
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
}
