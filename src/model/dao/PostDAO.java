package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import libraries.ConnectDBLibrary;
import model.bean.Post;

public class PostDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public PostDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}

	public ArrayList<Post> getListPost() {
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from post ;";
		try {
			st=connection.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
			Post post= new Post(rs.getInt("id_post"),rs.getInt("id_subject"),
					rs.getString("username"),rs.getString("date_create"),
					rs.getString("title"),rs.getString("preview_image"),
					rs.getString("preview_content"),rs.getString("content"),
					rs.getInt("view"),rs.getInt("enabled"));
			listItems.add(post);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
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

	public Post get(int idPost) {
		connection = connectDBLibrary.getConnectMySQL();
		pst = null;
		rs = null;
		String query = "SELECT * FROM post WHERE id_post = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, idPost);
			rs = pst.executeQuery();
			while(rs.next()) {				
				return new Post(rs.getInt("id_post"),rs.getInt("id_subject"),rs.getString("username"),rs.getString("date_create"),rs.getString("title"),
						rs.getString("preview_image"),rs.getString("preview_content"),rs.getString("content"),rs.getInt("view"),rs.getInt("enabled"));
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

	public boolean add(Post post) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "INSERT INTO post(id_subject, username, date_create, title, preview_image, preview_content, content, view, enabled) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, post.getId_subject());
			pst.setString(2, post.getUsername());
			pst.setString(3, post.getDate_create());
			pst.setString(4, post.getTitle());
			pst.setString(5, post.getPreview_image());
			pst.setString(6, post.getPreview_content());
			pst.setString(7, post.getContent());
			pst.setInt(8, post.getView());
			pst.setInt(9, post.getEnable());
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

	public boolean edit(Post post) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE post SET id_subject = ?, title = ?, preview_image = ?, preview_content = ?, content = ? WHERE id_post = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, post.getId_subject());
			pst.setString(2, post.getTitle());
			pst.setString(3, post.getPreview_image());
			pst.setString(4, post.getPreview_content());
			pst.setString(5, post.getContent());
			pst.setInt(6, post.getId_post());
			
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

	public boolean delete(int idPost) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM post WHERE id_post = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
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

	public ArrayList<Post> getPostSubject(int idSub) {		
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM post WHERE id_subject = ?;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idSub);
			rs = pst.executeQuery();
			while(rs.next()){
			Post post= new Post(rs.getInt("id_post"),rs.getInt("id_subject"),
					rs.getString("username"),rs.getString("date_create"),
					rs.getString("title"),rs.getString("preview_image"),
					rs.getString("preview_content"),rs.getString("content"),
					rs.getInt("view"),rs.getInt("enabled"));
			listItems.add(post);
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
		return listItems;
	}
}
