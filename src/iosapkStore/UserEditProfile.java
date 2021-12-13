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

@WebServlet("/UserEditProfile")

public class UserEditProfile extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession ses=request.getSession();
		
		
		String UserName, Add1, Add2, PS, Country, Postal,Contact;
		UserName=(String) ses.getAttribute("username");
		Contact=request.getParameter("Contact");
		Add1=request.getParameter("Add1");
		Add2=request.getParameter("Add2");
		PS=request.getParameter("PS");
		Country=request.getParameter("Country");
		Postal=request.getParameter("Postal");
		
		System.out.println("UserName:" + UserName);
		response.setContentType("text/html");
		Connection conn =DbConncetion.getDbConnection("oracle");
		PreparedStatement stmt=null;
		int row;
		try {
			stmt=conn.prepareStatement("UPDATE APPUSER SET CONTACT=?,ADDRESS=?,ADDRESS2=?,PS=?,COUNTRY=?,POSTALCODE=? WHERE USERNAME=?");
			stmt.setString(1, Contact);
			stmt.setString(2, Add1);
			stmt.setString(3,Add2);
			stmt.setString(4, PS);
			stmt.setString(5, Country);
			stmt.setString(6,Postal);
			stmt.setString(7,UserName);
			row=stmt.executeUpdate();
			
			if(row>0)
			{
				RequestDispatcher rd= request.getRequestDispatcher("UserProfile.jsp");
				try {
					response.getWriter().println("<!DOCTYPE html>\r\n" + 
					 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					 		"  <head>\r\n" + 
					 		"    <meta charset=\"utf-8\">\r\n" + 
					 		"    <title></title>\r\n" + 
					 		"  </head>\r\n" + 
					 		"  <body>\r\n" + 
					 		"    <script type=\"text/javascript\">\r\n" + 
					 		"      alert(\"Developer Profile Updated Successfully!!!\");\r\n" + 
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
				RequestDispatcher rd= request.getRequestDispatcher("UserEditProfile.jsp");
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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		doMethod(request,response);
	}
}
