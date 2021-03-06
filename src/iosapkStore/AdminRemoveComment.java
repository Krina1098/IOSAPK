package iosapkStore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminRemoveComment")
public class AdminRemoveComment extends HttpServlet{
	
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException{
		String user,app,ves;
		user=request.getParameter("Username");
		app=request.getParameter("Appname");
		ves=request.getParameter("Version");
		
		Connection conn =DbConncetion.getDbConnection("oracle");
		response.setContentType("text/html");
		
		PreparedStatement stmt=null;
		PreparedStatement state=null;
		try {
			stmt=conn.prepareStatement("DELETE FROM REVIEW WHERE APPNAME=? AND VERSION=? AND USERID=?");
			stmt.setString(1,app);
			stmt.setString(2, ves);
			stmt.setString(3, user);
			int row=stmt.executeUpdate();
			if(row>0)
			{
				state=conn.prepareStatement("DELETE FROM REPORT WHERE ABOUT=? AND USERNAME=? AND APPLICATION=? AND VERSION=?");
				state.setString(1,"User");
				state.setString(2,user);
				state.setString(3,app);
				state.setString(4,ves);
			
				int count=state.executeUpdate();
				if(count>0)
				{
					RequestDispatcher red= request.getRequestDispatcher("AdminNotification.JSP");
					response.getWriter().println("<!DOCTYPE html>\r\n" + 
							"<html lang=\"en\" dir=\"ltr\">\r\n" + 
							"  <head>\r\n" + 
							"    <meta charset=\"utf-8\">\r\n" + 
							"    <title></title>\r\n" + 
							"  </head>\r\n" + 
							"  <body>\r\n" + 
							"    <script type=\"text/javascript\">\r\n" + 
							"      alert(\"Comment and Notification Removed successfully!!!!\");\r\n" + 
							"    </script>\r\n" + 
							"\r\n" + 
							"  </body>\r\n" + 
							"</html>\r\n" + 
							"");
					
					red.include(request, response);
				}
				
			}
			else
			{
				RequestDispatcher rat= request.getRequestDispatcher("AdminRemoveComment.html");
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
				
				rat.include(request, response);
				
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
	
	
	

}
