package iosapkStore;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/DeveloperEditProfilePic")
@MultipartConfig
public class DeveloperEditProfilePic extends HttpServlet {

	public void doMethod(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException, SQLException
	{
		HttpSession ses=request.getSession();
		String UserName;
		InputStream img=null;
		
		 UserName=(String) ses.getAttribute("username");
		 Part img1=request.getPart("Profile");
		 
		 String img1Name=extractFileName(img1); 
		 
		 response.setContentType("text/html");
	     Connection conn =DbConncetion.getDbConnection("oracle");
	     PreparedStatement stmt=null;
	     
	     if(img1Name != null)
	     {
	    	 img=img1.getInputStream();
	     }
	     int row;
	     stmt=conn.prepareStatement("Update Developer set IMAGE=? where USERNAME=?");
	     stmt.setBlob(1, img);
	     stmt.setString(2, UserName);
	     row=stmt.executeUpdate();
			
			if(row>0)
			{
				RequestDispatcher rd= request.getRequestDispatcher("DeveloperProfile.jsp");
				try {
					response.getWriter().println("<!DOCTYPE html>\r\n" + 
					 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					 		"  <head>\r\n" + 
					 		"    <meta charset=\"utf-8\">\r\n" + 
					 		"    <title></title>\r\n" + 
					 		"  </head>\r\n" + 
					 		"  <body>\r\n" + 
					 		"    <script type=\"text/javascript\">\r\n" + 
					 		"      alert(\"Developer Profile Pic Updated Successfully!!!\");\r\n" + 
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
				RequestDispatcher rd= request.getRequestDispatcher("EditProfile.jsp");
				try {
					response.getWriter().println("<!DOCTYPE html>\r\n" + 
					 		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					 		"  <head>\r\n" + 
					 		"    <meta charset=\"utf-8\">\r\n" + 
					 		"    <title></title>\r\n" + 
					 		"  </head>\r\n" + 
					 		"  <body>\r\n" + 
					 		"    <script type=\"text/javascript\">\r\n" + 
					 		"      alert(\"Try after Some time!!!\");\r\n" + 
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
		try {
			doMethod(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
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
