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

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException{
		String USERNAME, PASSWORD;
		
		USERNAME=request.getParameter("Username");
		PASSWORD=request.getParameter("Pass");
		
		Connection conn =DbConncetion.getDbConnection("oracle");
		response.setContentType("text/html");
		
		PreparedStatement stmt=null;
		try {
			stmt = conn.prepareStatement("SELECT * FROM ADMINCREDENTIAL WHERE USERNAME=? AND PASS=?");
			stmt.setString(1,USERNAME);
			stmt.setString(2,PASSWORD);
			ResultSet rs=stmt.executeQuery();
			
			if(rs.next())
			{
				String user=rs.getString("USERNAME");
				String password=rs.getString("PASS");
				request.getRequestDispatcher("AdminProfile.jsp").include(request, response);
				HttpSession session=request.getSession();
				session.setAttribute("username", user);
				session.setAttribute("password", password);
			}
			else
			{
				RequestDispatcher red= request.getRequestDispatcher("AdminLogin.html");
				
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


