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
import javax.servlet.http.HttpSession;

@WebServlet("/DeveloperLogin")
public class DeveloperLogin extends HttpServlet{

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		String username, password;
		username=request.getParameter("Username");
		password=request.getParameter("Pass");
		
		Connection conn =DbConncetion.getDbConnection("oracle");
		response.setContentType("text/html");
		
		
		try {
			PreparedStatement stmt=conn.prepareStatement("SELECT * FROM DEVELOPER WHERE USERNAME=? AND PASSWORD=?");
			stmt.setString(1,username);
			stmt.setString(2,password);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{ 	
				try {
					
					String user=rs.getString("USERNAME");
					String name=rs.getString("NAME");
					request.getRequestDispatcher("DeveloperHome.html").include(request, response);
					HttpSession session=request.getSession();
					session.setAttribute("username", user);
					session.setAttribute("name",name);
					
				} catch (ServletException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				
				
				
			}
			else
			{
				RequestDispatcher red= request.getRequestDispatcher("DeveloperLogin.html");
				try {
					try {
						response.getWriter().println("<!DOCTYPE html>\r\n" + 
								"<html lang=\"en\" dir=\"ltr\">\r\n" + 
								"  <head>\r\n" + 
								"    <meta charset=\"utf-8\">\r\n" + 
								"    <title></title>\r\n" + 
								"  </head>\r\n" + 
								"  <body>\r\n" + 
								"    <script type=\"text/javascript\">\r\n" + 
								"      alert(\"Invalid Credential try again!!!!\");\r\n" + 
								"    </script>\r\n" + 
								"\r\n" + 
								"  </body>\r\n" + 
								"</html>\r\n" + 
								"");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						red.include(request,response);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		    
		}
			catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			doMethod(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			doMethod(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
