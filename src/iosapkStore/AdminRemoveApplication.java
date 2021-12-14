package iosapkStore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminRemoveApplication")
public class AdminRemoveApplication extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException {
		String username,appname,version;
		username=request.getParameter("User");
		appname=request.getParameter("App");
		version=request.getParameter("Ver");
		
		Connection conn =DbConncetion.getDbConnection("oracle");
		response.setContentType("text/html");
		
		PreparedStatement stmt=null;
		PreparedStatement state=null;
		try {
			stmt=conn.prepareStatement("DELETE FROM APPLICATION  WHERE DEVID=? AND NAME=? AND VERSION=?");
			stmt.setString(1, username);
			stmt.setString(2, appname);
			stmt.setString(3, version);
			
			int row=stmt.executeUpdate();
			if(row>0)
			{
				int rowCount=0;
				state=conn.prepareStatement("DELETE FROM REPORT WHERE ABOUT=? AND USERNAME=? AND APPLICATION=? AND VERSION=?");
				state.setString(1,"Developer");
				state.setString(2,username);
				state.setString(3,appname);
				state.setString(4,version);
			
				 rowCount=state.executeUpdate();
				
					if(rowCount>=0)
					{
						System.out.println(rowCount);
						try {
							
							System.out.println("count:"+rowCount);
					     RequestDispatcher rds=request.getRequestDispatcher("AdminRemoveApplication.html");
					    				          
						response.getWriter().println("<!DOCTYPE html>\r\n" + 
								"<html lang=\"en\" dir=\"ltr\">\r\n" + 
								"  <head>\r\n" + 
								"    <meta charset=\"utf-8\">\r\n" + 
								"    <title></title>\r\n" + 
								"  </head>\r\n" + 
								"  <body>\r\n" + 
								"    <script type=\"text/javascript\">\r\n" + 
								"      alert(\"Application and Notification Removed successfully!!!!\");\r\n" + 
								"    </script>\r\n" + 
								"\r\n" + 
								"  </body>\r\n" + 
								"</html>\r\n" + 
								"");
						
						rds.include(request, response);
						 
						}
						 catch (IOException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
							
						
					}
				
			}
			else {
				
				try {
				RequestDispatcher red= request.getRequestDispatcher("AdminRemoveApplication.jsp");
				response.getWriter().println("<!DOCTYPE html>\r\n" + 
						"<html lang=\"en\" dir=\"ltr\">\r\n" + 
						"  <head>\r\n" + 
						"    <meta charset=\"utf-8\">\r\n" + 
						"    <title></title>\r\n" + 
						"  </head>\r\n" + 
						"  <body>\r\n" + 
						"    <script type=\"text/javascript\">\r\n" + 
						"      alert(\"In correct Information, Try after sometime!!!!\");\r\n" + 
						"    </script>\r\n" + 
						"\r\n" + 
						"  </body>\r\n" + 
						"</html>\r\n" + 
						"");
				
				red.include(request, response);
				} catch (ServletException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			try {
				doMethod(request,response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			try {
				doMethod(request,response);
			} catch (ClassNotFoundException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
