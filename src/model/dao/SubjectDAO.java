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
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public SubjectDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}
	
	
	public ArrayList<Subject>getListSubject(){
		ArrayList<Subject> listItems = new ArrayList<>();
		conn = connectDBLibrary.getConnectMySQL();
		String sql = "select * from subject;";
		try {
			st = conn.createStatement();
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
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listItems;
	}
	public String getNameSubject(int index){
		String nameSub="";
		conn = connectDBLibrary.getConnectMySQL();
		String sql = "select * from subject where id_subject='"+index+"';";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				return nameSub=rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				st.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return nameSub;
	}
}
