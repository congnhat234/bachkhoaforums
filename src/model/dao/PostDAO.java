package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import libraries.ConnectDBLibrary;
import model.bean.LikeComment;
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
		String sql = "select * from post;";
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
	
	public ArrayList<Post> getAllPostEnabled() {
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from post where enabled = 1;";
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
	
	public ArrayList<Post> getListPostOffset(int offset, int row_count) {
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from post limit ?,?;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, row_count);
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

	public ArrayList<Post> getPostSubject(int idSub) {		
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM post WHERE id_subject = ? && enabled = 1;";
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

	public ArrayList<Post> getListPostFolowUser(int idUser) {
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM post INNER JOIN follow ON post.id_post=follow.id_post WHERE follow.id_user= ? && enabled = 1;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
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
			
	public int getLastComment(int idPost) {
		int username=0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM forumdb.comment where comment.id_post=? ORDER BY comment.id_comment DESC LIMIT 1;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
			rs = pst.executeQuery();
			while(rs.next()){
				username=rs.getInt("id_user");
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
		if(username==0) return username;
		return username;
	}

	public ArrayList<Post> getListPostByUser(String username) {
		ArrayList<Post> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from post where username = ? && enabled = 1;";
		pst=null;
		rs=null;

		try {
			pst=connection.prepareStatement(sql);
			pst.setString(1, username);
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



	public int countItems() {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM post";
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

	public int countLike(int idPost) {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM like_post WHERE id_post = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
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
	
	public int likedByUser(int idPost, int idUser) {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM like_post WHERE id_post = ? && id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
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

	public boolean likePost(int idPost, int idUser) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "INSERT INTO like_post(id_post, id_user) VALUES (?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, idPost);
			pst.setInt(2, idUser);
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

	public boolean deleteLikedPostByUser(int idPost, int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_post WHERE id_post = ? && id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
			pst.setInt(2, idUser);
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

	public int getStatus(int idPost) {
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT enabled FROM post WHERE id_post = ?;";
		int result = 0;
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
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

	public boolean setStatus(int idPost, int i) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE post SET enabled = ? WHERE id_post = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, i);
			pst.setInt(2, idPost);
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

	public boolean changeSubjectPost(int idSub,int idPost) {
			connection = connectDBLibrary.getConnectMySQL();
			String query = "UPDATE post SET id_subject = ? WHERE id_post = ?;";
			try {		
				pst = connection.prepareStatement(query);
				pst.setInt(1, idSub);
				pst.setInt(2, idPost);
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

	public boolean deleteLikePostByPost(int id_post) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_post WHERE id_post = ?";
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

	public boolean deletePostByUser(String userName) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM post WHERE username = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setString(1, userName);
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

	public boolean deleteLikePostByUser(int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_post WHERE id_user = ?";
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

	public boolean deletePostByIdSub(int idSub) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM post WHERE id_subject = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idSub);
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

	public int likedCommentByUser(int idComment, int idUser) {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM like_comment WHERE id_comment = ? && id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idComment);
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

	public boolean deleteLikedCommentByUser(int idComment, int idUser) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE FROM like_comment WHERE id_comment = ? && id_user = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idComment);
			pst.setInt(2, idUser);
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

	public boolean likeComment(int idComment, int idUser) {
		connection = connectDBLibrary.getConnectMySQL();		
		String query = "INSERT INTO like_comment(id_comment, id_user) VALUES (?, ?);";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, idComment);
			pst.setInt(2, idUser);
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
	public int countLikeComment(int idComment) {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM like_comment WHERE id_comment = ?";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idComment);
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

	public ArrayList<LikeComment> getListLikedComment(int idPost) {
		ArrayList<LikeComment> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from like_comment inner join comment on like_comment.id_comment = comment.id_comment where id_post = ?;";
		pst=null;
		rs=null;

		try {
			pst=connection.prepareStatement(sql);
			pst.setInt(1, idPost);
			rs = pst.executeQuery();
			while(rs.next()){
			LikeComment likeComment = new LikeComment(rs.getInt("id_like_comment"), rs.getInt("like_comment.id_comment"), rs.getInt("id_user"));
			listItems.add(likeComment);
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

	public int followedByUser(int idPost, int id_user) {
		int check = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM follow WHERE id_post = ? AND id_user = ?;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idPost);
			pst.setInt(2, id_user);
			rs=pst.executeQuery();
			while(rs.next()){
				check = rs.getInt("rowcount") ;
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
		return check;
	}
}
