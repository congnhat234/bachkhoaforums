package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
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
			// TODO Auto-generated catch block
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
		return obj;
	}
}
