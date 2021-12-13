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
import javax.servlet.http.HttpSession;

@WebServlet("/DeveloperReport")
public class DeveloperReport extends HttpServlet{
	
	public void doMethod(HttpServletRequest request,HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException
	{
		HttpSession ses=request.getSession();
		PreparedStatement stmt=null;
		String About, Username, Appname, Version, From, Rate, Comment;
		
		 About="User";
		 From=(String) ses.getAttribute("username");
		Appname=request.getParameter("Appname");
		Version=request.getParameter("Version");
		Username=request.getParameter("UserId");
		Comment=request.getParameter("Comment");
		
		try
		{
		response.setContentType("text/html");
		Connection conn =DbConncetion.getDbConnection("oracle");
		
		stmt= conn.prepareStatement("insert into REPORT (ABOUT, USERNAME,COMPLAIN, REPORTFROM, APPLICATION, VERSION) values(?,?,?,?,?,?)");
		stmt.setString(1,About);
		stmt.setString(2,Username);
	    stmt.setString(3,Comment);
		stmt.setString(4,From);
		stmt.setString(5,Appname);
		stmt.setString(6,Version);
		
		
		int row=stmt.executeUpdate();
		if(row>0)
		{
			
		
		RequestDispatcher rd= request.getRequestDispatcher("DeveloperReport.jsp");
		try {
			response.getWriter().println("<!DOCTYPE html>\r\n" + 
			 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
			 		"  <head>\r\n" + 
			 		"    <meta charset=\"utf-8\">\r\n" + 
			 		"    <title></title>\r\n" + 
			 		"  </head>\r\n" + 
			 		"  <body>\r\n" + 
			 		"    <script type=\"text/javascript\">\r\n" + 
			 		"      alert(\"Reported  Successfully!!!\");\r\n" + 
			 		"    </script>\r\n" + 
			 		"\r\n" + 
			 		"  </body>\r\n" + 
			 		"</html>");

			try {
				rd.include(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else
		{
			RequestDispatcher rd= request.getRequestDispatcher("DeveloperReport.jsp");
			try {
				response.getWriter().println("<!DOCTYPE html>\r\n" + 
				 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
				 		"  <head>\r\n" + 
				 		"    <meta charset=\"utf-8\">\r\n" + 
				 		"    <title></title>\r\n" + 
				 		"  </head>\r\n" + 
				 		"  <body>\r\n" + 
				 		"    <script type=\"text/javascript\">\r\n" + 
				 		"      alert(\"Invalid information try Again!!!\");\r\n" + 
				 		"    </script>\r\n" + 
				 		"\r\n" + 
				 		"  </body>\r\n" + 
				 		"</html>");

				try {
					rd.include(request,response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
	   }catch(SQLException e)
		{
			e.printStackTrace();
		}
	}	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	{
		try {
			doMethod(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	


}
