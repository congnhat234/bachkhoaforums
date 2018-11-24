package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import libraries.ConnectDBLibrary;
import model.bean.Post;

public class PostDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection conn;
	private Statement st;
	private ResultSet rs;

	public PostDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}

	public ArrayList<Post> getListPost() {
		ArrayList<Post> listItems = new ArrayList<>();
		conn = connectDBLibrary.getConnectMySQL();
		String sql = "select * from post;";
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
			Post post= new Post(rs.getInt("id_post"),rs.getInt("id_subject"),
					rs.getInt("id_user"),rs.getString("date_create"),
					rs.getString("title"),rs.getString("preview_image"),
					rs.getString("preview_content"),rs.getString("content"),
					rs.getInt("view"),rs.getInt("enable"));
			listItems.add(post);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				st.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listItems;
	}

}
