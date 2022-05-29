package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		String url = "jdbc:sqlserver://"+serverName+":"+portNumber +"\\" +instance+";databaseName="+dbName+";encrypt=true;trustServerCertificate=true;";
		
		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName +";encrypt=true;trustServerCertificate=true;";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userId, password);
	}
	
	//Khai báo các thông số:
	private final String serverName="localhost";
	private final String portNumber="1433";
	private final String instance="";
	private final String dbName="Project";
	private final String userId="sa";
	private final String password="Hi12345678";
	
	public static void main(String[] args) {
		Connection conn;
		try {
			conn = new DBContext().getConnection();
			
			if (conn != null) {System.out.println("Thanh Cong");}
			else {System.out.println("That bai");}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
