package iosapkStore;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/DeveloperSignUp")
@MultipartConfig(maxFileSize = 16177215)
public class DeveloperSignUp extends HttpServlet {
	
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String NAME, DOB,ADDRESS1,ADDRESS2, PROVINCE, COUNTRY, POSTAL, HINT, USERNAME, PASSWORD, CONFIRM, CONTACT;
		InputStream img = null;
		Part img1 = null;
		Integer CONT;
		NAME=request.getParameter("Name");
		DOB=request.getParameter("DOB");
		CONTACT=request.getParameter("Contact");
		ADDRESS1=request.getParameter("Add1");
		ADDRESS2=request.getParameter("Add2");
		PROVINCE=request.getParameter("PS");
		COUNTRY=request.getParameter("Country");
		POSTAL=request.getParameter("Postal");
		HINT=request.getParameter("Hint");
		USERNAME=request.getParameter("Username");
		PASSWORD=request.getParameter("Pass");
		CONFIRM=request.getParameter("Confirm");
		try {
			img1=request.getPart("Profile");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String img1Name=extractFileName(img1);
		if(img1Name != null)
		{
			img=img1.getInputStream();
		}
		
		response.setContentType("text/html");
		Connection conn =DbConncetion.getDbConnection("oracle");
		
		if(PASSWORD.equals(CONFIRM))
		{
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM DEVELOPER where USERNAME=?");
			stmt.setString(1,USERNAME);
			
			ResultSet rs =stmt.executeQuery();
			
			if(rs.next())
			{
				     RequestDispatcher rd= request.getRequestDispatcher("DeveloperSignUp.html");
				     response.getWriter().println("<!DOCTYPE html>\r\n" + 
				     		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
				     		"  <head>\r\n" + 
				     		"    <meta charset=\"utf-8\">\r\n" + 
				     		"    <title></title>\r\n" + 
				     		"  </head>\r\n" + 
				     		"  <body>\r\n" + 
				     		"    <script type=\"text/javascript\">\r\n" + 
				     		"      alert(\"User already exsist!!!!\");\r\n" + 
				     		"    </script>\r\n" + 
				     		"\r\n" + 
				     		"  </body>\r\n" + 
				     		"</html>");
				     try {
						rd.include(request,response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				   
				    	conn.close();
		  }
		  else 
		  { 
			  
			
			  stmt=conn.prepareStatement("insert into SYSTEM.DEVELOPER (NAME,DOB,CONTACT,ADDRESS,ADDRESS2,PS,COUNTRY,POSTAL,HINT,USERNAME,PASSWORD,IMAGE) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			  stmt.setString(1,NAME);
				stmt.setString(2,DOB);
				stmt.setString(3,CONTACT);
				stmt.setString(4,ADDRESS1);
				stmt.setString(5,ADDRESS2);
				stmt.setString(6,PROVINCE);
				stmt.setString(7,COUNTRY);
				stmt.setString(8,POSTAL);
				stmt.setString(9,HINT);
				stmt.setString(10,USERNAME);
				stmt.setString(11,PASSWORD);
				stmt.setBlob(12,img);
				
				stmt.executeUpdate();
			  response.sendRedirect("DeveloperLogin.html");
			  
		 }
		}
		else
		{
			RequestDispatcher rd= request.getRequestDispatcher("DeveloperSignUp.html");
		     response.getWriter().println("<!DOCTYPE html>\r\n" + 
		     		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
		     		"  <head>\r\n" + 
		     		"    <meta charset=\"utf-8\">\r\n" + 
		     		"    <title></title>\r\n" + 
		     		"  </head>\r\n" + 
		     		"  <body>\r\n" + 
		     		"    <script type=\"text/javascript\">\r\n" + 
		     		"      alert(\"Password Does not match!!!!\");\r\n" + 
		     		"    </script>\r\n" + 
		     		"\r\n" + 
		     		"  </body>\r\n" + 
		     		"</html>");
		     try {
				rd.include(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
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
	
	private String extractFileName(Part part) 
    {
        //content-disposition: is a header that indicating web page or part of web page need to display inline in the browser
    	//that is saved and downloaded locally 
        String contentDisp = part.getHeader("content-disposition");
        
        //"form-data;name=course;filename="F:\CCBT\CCBT_SEM2\Introduction To Cloud computting cbd-2234\Leture2.pdf"
        String[] item = contentDisp.split(";");
        for (String str : item) {
        	
        	//trim eliminate leading and trailing space so it remove space between Introduction to cloud computing
        	//filename="F:\CCBT\CCBT_SEM2\IntroductionToCloudcomputtingcbd-2234\Leture2.pdf"
        	
            if (str.trim().startsWith("filename")) {
                
            	//substring return part of string
            	// F:\CCBT\CCBT_SEM2\IntroductionToCloudcomputtingcbd-2234\Leture2.pdf
                String MaterialName = str.substring(str.indexOf("=") + 2, str.length() - 1);
                
                //this will replace \\ to /
               MaterialName = MaterialName.replace("\\", "/");
                
                // last index of /
                int c = MaterialName.lastIndexOf('/');
                
               //  /Lecture2.pdf
                return MaterialName.substring( c + 1);
            }
        }
        return null;
    }

	

}
