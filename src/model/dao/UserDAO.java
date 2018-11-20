package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import libraries.ConnectDBLibrary;
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
		pst = null;
		rs = null;
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
		PreparedStatement ps = null;
		String query = "INSERT INTO user(id_role, username, password, token, fullname, address, city, gender, email, phone, birthday,"
				+ "date_join, avatar, rate, enabled) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {		
			ps = connection.prepareStatement(query);
			ps.setInt(1, user.getId_role());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getToken());
			ps.setString(5, user.getFullname());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getCity());
			ps.setInt(8, user.getGender());
			ps.setString(9, user.getEmail());
			ps.setString(10, user.getPhone());
			ps.setString(11, user.getBirthhday());
			ps.setString(12, user.getDate_join());
			ps.setString(13, user.getAvatar());
			ps.setInt(14, user.getRate());
			ps.setInt(15, user.getEnabled());
			int r = ps.executeUpdate();
			return (r == 1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean edit(User user) {
		connection = connectDBLibrary.getConnectMySQL();
		PreparedStatement ps = null;
		String query = "UPDATE user SET id_role = ?, fullname = ?, address = ?, city = ?, gender = ?, email = ?, phone = ?, birthday = ?,"
				+ "avatar = ?, enabled = ? WHERE username = ?;";
		try {		
			ps = connection.prepareStatement(query);
			ps.setInt(1, user.getId_role());
			ps.setString(2, user.getFullname());
			ps.setString(3, user.getAddress());
			ps.setString(4, user.getCity());
			ps.setInt(5, user.getGender());
			ps.setString(6, user.getEmail());
			ps.setString(7, user.getPhone());
			ps.setString(8, user.getBirthhday());
			ps.setString(9, user.getAvatar());
			ps.setInt(10, user.getEnabled());
			ps.setString(11, user.getUsername());
			
			int r = ps.executeUpdate();
			if (r>0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
