package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import libraries.ConnectDBLibrary;
import model.bean.Follow;

public class FollowDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public FollowDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}
	
	public boolean add(Follow follow) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "INSERT INTO follow(id_post, id_user, notify) VALUES (?, ?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, follow.getId_post());
			pst.setInt(2, follow.getId_user());
			pst.setInt(3, follow.getNotify());
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
		return false;
	}

	public boolean deleteFollowByPost(int id_post) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM follow WHERE id_post = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id_post);
			result = pst.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public boolean deleteFollowByUser(int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM follow WHERE id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			result = pst.executeUpdate();
			if(result > 0) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
