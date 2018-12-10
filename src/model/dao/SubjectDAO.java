package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
import model.bean.Post;
import model.bean.Subject;

public class SubjectDAO {

	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public SubjectDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}
	
	
	public ArrayList<Subject>getListSubject(){
		ArrayList<Subject> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from subject;";
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Subject obj = new Subject(rs.getInt("id_subject"), rs.getString("name"));
				listItems.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	
	public Subject getSubject(int idSub){
		Subject obj=null;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM subject WHERE id_subject = ? ;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idSub);
			rs = pst.executeQuery();
			while(rs.next()){
				obj = new Subject(rs.getInt("id_subject"), rs.getString("name"));
				return obj;
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
		return obj;
	}


	public boolean addSubject(Subject Sub) {
		connection = connectDBLibrary.getConnectMySQL();	
		if (Check(Sub)) {
			String query = "INSERT INTO subject(name) VALUES (?);";
			try {
				pst = connection.prepareStatement(query);
				pst.setString(1, Sub.getName());
				int r = pst.executeUpdate();
				return (r == 1);
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
		}
		return false;
	}

	private boolean Check(Subject sub) {
		boolean check=true;
		SubjectDAO subDAO= new SubjectDAO();
		ArrayList<Subject>list=subDAO.getListSubject();
		for(int i=0; i<list.size();i++) {
			if(sub.getName().equals(list.get(i).getName())) {
				check= false;
			}
		}
		return check;
	}


	public boolean edit(Subject Sub) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE subject SET name = ? WHERE id_subject = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setString(1, Sub.getName());
			pst.setInt(2, Sub.getId_subject());
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

	public boolean delete(int idSub) {
		int result = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "DELETE  FROM forumdb.subject WHERE subject.id_subject=?;";
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


	public int countItems() {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM subject";
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


	public ArrayList<Subject> getListSubjectOffset(int offset, int row_count) {
		ArrayList<Subject> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from subject limit ?,?;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, row_count);
			rs = pst.executeQuery();
			while(rs.next()){
				Subject obj = new Subject(rs.getInt("id_subject"), rs.getString("name"));
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


}
