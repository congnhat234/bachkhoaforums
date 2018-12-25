package libraries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDBLibrary {
	private Connection conn;
	private String url;
	private String user;
	private String password;
	
	public ConnectDBLibrary() {
		this.url = "jdbc:mysql://localhost:3306/forumdb?useUnicode=true&characterEncoding=UTF-8";
		this.user =  "root";
		this.password = "Congnhat@234";
//		this.password = "Beo@1997";
		this.password = "1234";
	}
	
	public Connection getConnectMySQL() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}

}
