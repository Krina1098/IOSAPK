package iosapkStore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConncetion {
	static String dbName;
	public static Connection getDbConnection(String Name) 
	{
		dbName=Name;
		Connection con=null;
		
		if(dbName.equalsIgnoreCase("oracle"))
		{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			  
			//step2 create  the connection object  
		     	try {
					con=DriverManager.getConnection("jdbc:oracle:thin:@oracledb.cytfn4lqtcuq.ca-central-1.rds.amazonaws.com:1521:DATABASE","admin","Krina$1098");
					
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
			  
		}
		
		return  con;
	}

}

