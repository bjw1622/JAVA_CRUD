package kr.ac.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtils {

	public static Connection getConnection() {
		Connection con = null;
		try
		{
			String url = "jdbc:mysql://localhost:3306/angry1?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
			String user = "root";
			String password = "0361";
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
