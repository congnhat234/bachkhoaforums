package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libraries.ConnectDBLibrary;
import model.bean.Message;

public class MessageDAO {
	private ConnectDBLibrary connectDBLibrary;
	private Connection connection;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public MessageDAO() {
		connectDBLibrary = new ConnectDBLibrary();
	}
	
	public ArrayList<Message>getListMessage(){
		ArrayList<Message> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from message;";
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				Message obj = new Message(rs.getInt("id_message"), rs.getInt("id_user"), 
										rs.getString("email"), rs.getString("message_content"), rs.getString("reply"),
										rs.getString("date_create"), rs.getInt("notify_user"), rs.getInt("notify_admin"));
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
	
	public ArrayList<Message>getListMessageByUser(int idUser){
		ArrayList<Message> listItems = new ArrayList<>();
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "select * from message where id_user = ?;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idUser);
			rs = pst.executeQuery();
			while(rs.next()){
				Message obj = new Message(rs.getInt("id_message"), rs.getInt("id_user"), 
										rs.getString("email"), rs.getString("message_content"), rs.getString("reply"),
										rs.getString("date_create"), rs.getInt("notify_user"), rs.getInt("notify_admin"));
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
	
	public Message getMessage(int idMessage){
		Message obj=null;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT * FROM message WHERE id_message = ? ;";
		try {
			pst = connection.prepareStatement(sql);
			pst.setInt(1, idMessage);
			rs = pst.executeQuery();
			while(rs.next()){
				obj = new Message(rs.getInt("id_message"), rs.getInt("id_user"), 
						rs.getString("email"), rs.getString("message_content"), rs.getString("reply"),
						rs.getString("date_create"), rs.getInt("notify_user"), rs.getInt("notify_admin"));
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

	public boolean addMessage(Message message) {
		connection = connectDBLibrary.getConnectMySQL();	
		String query = "INSERT INTO message (id_user,email,message_content,reply,date_create,notify_user,notify_admin) VALUES (?,?,?,?,?,?,?);";
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, message.getId_user());
			pst.setString(2, message.getEmail());
			pst.setString(3, message.getMessage_content());
			pst.setString(4, message.getReply());
			pst.setString(5, message.getDate_create());
			pst.setInt(6, message.getNotify_user());
			pst.setInt(7, message.getNotify_admin());
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
		return false;
	}
	
	public boolean reply(int idMessage, String messageReply) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE message SET reply = ? WHERE id_message = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setString(1, messageReply);
			pst.setInt(2, idMessage);
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
	
	public int countUnseenMessage() {
		int count = 0;
		connection = connectDBLibrary.getConnectMySQL();
		String sql = "SELECT COUNT(*) AS rowcount FROM message WHERE notify_admin = 1;";
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
	
	public boolean setSeen(int idMessage) {
		connection = connectDBLibrary.getConnectMySQL();
		String query = "UPDATE message SET notify_admin = 0 WHERE id_message = ?;";
		try {		
			pst = connection.prepareStatement(query);
			pst.setInt(1, idMessage);
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
