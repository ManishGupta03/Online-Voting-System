package ONLINE_VOTING_V1;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseManager{
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevotingdb2","root","Manursh@987@789");
					return conn;
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
