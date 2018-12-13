package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
import model.bean.Follow;
import model.bean.Notification;

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

	public boolean deleteFollowPostByUser(int idPost, int id_user) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM follow WHERE id_user = ? AND id_post=?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, id_user);
			pst.setInt(2, idPost);
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

	public ArrayList<Notification> getListNotify(int idUser) {
		FollowDAO flDao= new FollowDAO();
		ArrayList<Notification> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		int count =flDao.getCountUnSeenNoti(idUser);
		String sql = "SELECT follow.id_post,comment.id_user,post.title,user.username FROM forumdb.follow INNER JOIN forumdb.comment ON follow.id_post=comment.id_post INNER JOIN forumdb.post ON comment.id_post=post.id_post INNER JOIN forumdb.user ON comment.id_user=user.id_user WHERE follow.id_user=? AND comment.id_user!=? ORDER BY comment.id_comment DESC LIMIT 5";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			pst.setInt(2, idUser);
			rs = pst.executeQuery();
			while(rs.next()){
				Notification obj = new Notification(rs.getInt("id_post"),rs.getString("username"),rs.getString("title"),count);
				listItems.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	public boolean seenNotitication(int idUser) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE follow SET notify =1 WHERE id_user = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1,idUser);			
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

	public int getCountUnSeenNoti(int idUser) {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM forumdb.follow INNER JOIN forumdb.comment ON follow.id_post=comment.id_post INNER JOIN forumdb.post ON comment.id_post=post.id_post INNER JOIN forumdb.user ON comment.id_user=user.id_user WHERE follow.id_user=? AND comment.id_user!=? AND follow.notify=0 ORDER BY comment.id_comment DESC LIMIT 5;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			pst.setInt(2, idUser);
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

	public boolean editNotityFollow(int idPost) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE follow SET notify = 0 WHERE id_post = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1,idPost);			
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
	

}
