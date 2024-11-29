
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO{

	private static String dburl = "jdbc:mysql://localhost:3306/bankdb";
	private static String dbuname = "root";
	private static String dbpassword = "Benny@7173";
	private static String dbdriver = "com.mysql.jdbc.Driver";
	
	
	
	public static Connection getConnection()
	{
		Connection con = null;
		try {
			Class.forName(dbdriver);
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
}
