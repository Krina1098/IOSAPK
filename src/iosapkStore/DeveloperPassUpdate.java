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

@WebServlet("/DeveloperPassUpdate")
public class DeveloperPassUpdate extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request,HttpServletResponse response)
	{
		PreparedStatement stmt=null;
		String hint,pass,conf,user;
		hint=request.getParameter("Hint");
		user=request.getParameter("Username");
		pass=request.getParameter("Pass");
		conf=request.getParameter("Confirm");
		
		response.setContentType("text/html");
		Connection conn =DbConncetion.getDbConnection("oracle");
		
		if(pass.equals(conf))
		{
			int row;
			try {
				stmt=conn.prepareStatement("Update Developer set PASSWORD=? where HINT=? AND USERNAME=?");
				stmt.setString(1, pass);
				stmt.setString(2, hint);
				stmt.setString(3,user);
				row=stmt.executeUpdate();
				if(row>0)
				{
				RequestDispatcher rd= request.getRequestDispatcher("DeveloperLogin.html");
				try {
					response.getWriter().println("<!DOCTYPE html>\r\n" + 
					 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					 		"  <head>\r\n" + 
					 		"    <meta charset=\"utf-8\">\r\n" + 
					 		"    <title></title>\r\n" + 
					 		"  </head>\r\n" + 
					 		"  <body>\r\n" + 
					 		"    <script type=\"text/javascript\">\r\n" + 
					 		"      alert(\"Developer Password Updated Successfully!!!\");\r\n" + 
					 		"    </script>\r\n" + 
					 		"\r\n" + 
					 		"  </body>\r\n" + 
					 		"</html>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					rd.include(request,response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
				else
				{
					RequestDispatcher rd= request.getRequestDispatcher("DeveloperPasswordReset.html");
					try {
						response.getWriter().println("<!DOCTYPE html>\r\n" + 
						 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
						 		"  <head>\r\n" + 
						 		"    <meta charset=\"utf-8\">\r\n" + 
						 		"    <title></title>\r\n" + 
						 		"  </head>\r\n" + 
						 		"  <body>\r\n" + 
						 		"    <script type=\"text/javascript\">\r\n" + 
						 		"      alert(\"Invalid Information!!!\");\r\n" + 
						 		"    </script>\r\n" + 
						 		"\r\n" + 
						 		"  </body>\r\n" + 
						 		"</html>");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						rd.include(request,response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else
		{
			RequestDispatcher rd= request.getRequestDispatcher("DeveloperPasswordReset.html");
			try {
				response.getWriter().println("<!DOCTYPE html>\r\n" + 
				 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
				 		"  <head>\r\n" + 
				 		"    <meta charset=\"utf-8\">\r\n" + 
				 		"    <title></title>\r\n" + 
				 		"  </head>\r\n" + 
				 		"  <body>\r\n" + 
				 		"    <script type=\"text/javascript\">\r\n" + 
				 		"      alert(\"Enter Password Again!!!\");\r\n" + 
				 		"    </script>\r\n" + 
				 		"\r\n" + 
				 		"  </body>\r\n" + 
				 		"</html>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				rd.include(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		doMethod(request,response);
	}

	
}
