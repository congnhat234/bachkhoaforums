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
		String query = "SELECT * FROM comment inner join user on comment.id_user = user.id_user where id_comment = ?;";
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
		String query = "INSERT INTO comment(id_post, id_user, date_create, content, notify) VALUES (?, ?, ?, ?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			
			pst.setInt(1, comment.getId_post());
			pst.setInt(2, comment.getId_user());
			pst.setString(3, comment.getDate_create());
			pst.setString(4, comment.getContent());
			pst.setInt(5, comment.getNotify());

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

//	public boolean edit(Comment comment) {
//		connection = connectDBLibrary.getConnectMySQL();
//		String query = "UPDATE comment SET id_post=?, id_user=?, content=?, notify = ? WHERE id_comment = ?;";
//		try {		
//			pst = connection.prepareStatement(query);
//			
//			pst.setInt(1, comment.getId_post());
//			pst.setInt(2, comment.getId_user());
//			pst.setString(4, comment.getContent());
//			pst.setInt(5, comment.getNotify());
//			pst.setInt(6, comment.getId_comment());
//			
//			int r = pst.executeUpdate();
//			if (r>0) return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pst.close();
//				connection.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}

	public boolean delete(int idComment) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM comment WHERE id_comment = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idComment);
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
		String sql = "select * from comment inner join user on comment.id_user = user.id_user where comment.id_post = ?;";
		
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
			rs = pst.executeQuery();
			while(rs.next()){
				Comment comment= new Comment(rs.getInt("id_comment"),rs.getInt("id_post"),
					rs.getInt("comment.id_user"),rs.getString("date_create"),
					rs.getString("content"),rs.getString("user.username"),rs.getInt("notify"),rs.getString("user.avatar"));
			listItems.add(comment);
			}
		} catch (SQLException e) {
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


	public boolean deleteLikeCommentByComment(int id_comment) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_comment WHERE id_comment = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id_comment);
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


	public boolean deleteCommentByPost(int id_post) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM comment WHERE id_post = ?";
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


	public boolean deleteCommentByUser(int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM comment WHERE id_user = ?";
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


	public boolean deleteLikeCommentByUser(int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_comment WHERE id_user = ?";
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
