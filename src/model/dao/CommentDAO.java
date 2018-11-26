package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
import model.bean.Comment;

public class CommentDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public CommentDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}


	public Comment get(int idComment) {
		connection = connectDBLibrary.getConnectMySQL();
		pst = null;
		rs = null;
		String query = "SELECT * FROM comment inner join user on id_comment = ?;";
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, idComment);
			rs = pst.executeQuery();
			while(rs.next()) {				
				return new Comment(rs.getInt("id_comment"),rs.getInt("id_post"),
						rs.getInt("id_user"),rs.getString("date_create"),
						rs.getString("content"),rs.getString("user.username"),rs.getInt("notify"));
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

	public boolean add(Comment comment) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "INSERT INTO commet(id_comment, id_post, id_user, date_create, content, notify) VALUES (?, ?, ?, ?, ?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, comment.getId_comment());
			pst.setInt(2, comment.getId_post());
			pst.setInt(3, comment.getId_user());
			pst.setString(4, comment.getDate_create());
			pst.setString(5, comment.getContent());
			pst.setInt(6, comment.getNotify());

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

	public boolean edit(Comment comment) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE comment SET id_comment=?, id_post=?, id_user=?, date_create=?, content=?, notify WHERE id_comment = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, comment.getId_comment());
			pst.setInt(2, comment.getId_post());
			pst.setInt(3, comment.getId_user());
			pst.setString(4, comment.getDate_create());
			pst.setString(5, comment.getContent());
			pst.setInt(6, comment.getNotify());
			
			int r = pst.executeUpdate();
			if (r>0) return true;
		} catch (Exception e) {
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

	public boolean delete(int idPost) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM post WHERE id_comment = ?";
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

	public ArrayList<Comment> getListComment(int idPost) {		
		ArrayList<Comment> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from comment inner join user on comment.id_post='"+idPost+"';";
		
		try {
			st=connection.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				Comment comment= new Comment(rs.getInt("id_comment"),rs.getInt("id_post"),
					rs.getInt("id_user"),rs.getString("date_create"),
					rs.getString("content"),rs.getString("user.username"),rs.getInt("notify"));
			listItems.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				st.close();
				connection.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listItems;
	}
}
