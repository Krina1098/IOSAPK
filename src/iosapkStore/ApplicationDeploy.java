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

@WebServlet("/ApplicationDeploy")
@MultipartConfig

public class ApplicationDeploy  extends HttpServlet{
	
	/**
	 * 
	 */
	

	public void doMethod(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		
		HttpSession ses=request.getSession();
		
	   String DevName, DevId,AppName,AppVersion,Category, OS, Brief; 
	   InputStream app=null;
	   InputStream img1=null; 
	   InputStream img2=null ;
	   InputStream img3=null;
	   InputStream img4=null; 
	   InputStream img5=null;  
	   
	   DevName=(String) ses.getAttribute("name");
	   DevId=(String) ses.getAttribute("username");
	   AppName=request.getParameter("AppName");
	   AppVersion=request.getParameter("AppVersion");
	   Category=request.getParameter("Category");
	   OS=request.getParameter("OS");
	   Brief=request.getParameter("Brief");
	   
	   Part app1=request.getPart("App");
	   Part img11=request.getPart("Img1");
	   Part img12=request.getPart("Img2");
	   Part img13=request.getPart("Img3");
	   Part img14=request.getPart("Img4");
	   Part img15=request.getPart("Img5");
	 
	   String appName=extractFileName(app1); 
	   String img11Name=extractFileName(img11); 
	   String img12Name=extractFileName(img12); 
	   String img13Name=extractFileName(img13); 
	   String img14Name=extractFileName(img14);
	   String img15Name=extractFileName(img15); 
	    
	   response.setContentType("text/html");
		Connection conn =DbConncetion.getDbConnection("oracle");
		
	   
	   if(appName != null && img11Name != null && img12Name!= null)
	   {
		   app=app1.getInputStream();
		   img1= img11.getInputStream();
		   img2=img12.getInputStream();
		   
		   if(img13Name != null)
		   {
			   img3=img13.getInputStream();
			   
		   }
		   
		   if(img14Name != null)
		   {
			   img4=img14.getInputStream();
			   
		   }
		   
		   if(img15Name != null)
		   {
			   img5=img15.getInputStream();
			   
		   }
		   
		   
		   
		   try {
			PreparedStatement stmt=conn.prepareStatement("INSERT INTO APPLICATION (NAME,DEVNAME,DEVID,VERSION,APPLICATION,IMAGE1,IMAGE2,IMAGE3,IMAGE4,IMAGE5,BRIEF,CATEGORY,OS,FILENAME) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			stmt.setString(1, AppName);
			stmt.setString(2,DevName);
			stmt.setString(3, DevId);
			stmt.setString(4,AppVersion);
			stmt.setBlob(5, app);
			stmt.setBlob(6,img1);
			stmt.setBlob(7, img2);
			stmt.setBlob(8, img3);
			stmt.setBlob(9, img4);
			stmt.setBlob(10, img5);
			stmt.setString(11,Brief);
			stmt.setString(12,Category);
			stmt.setString(13, OS);
			stmt.setString(14,appName);
			int row=stmt.executeUpdate();
			
			if(row>0)
			{
				RequestDispatcher red= request.getRequestDispatcher("DeveloperDeploy.jsp");
				response.getWriter().println("<!DOCTYPE html>\r\n" + 
						"<html lang=\"en\" dir=\"ltr\">\r\n" + 
						"  <head>\r\n" + 
						"    <meta charset=\"utf-8\">\r\n" + 
						"    <title></title>\r\n" + 
						"  </head>\r\n" + 
						"  <body>\r\n" + 
						"    <script type=\"text/javascript\">\r\n" + 
						"      alert(\"Application Uploaded Successfully!!!!\");\r\n" + 
						"    </script>\r\n" + 
						"\r\n" + 
						"  </body>\r\n" + 
						"</html>\r\n" + 
						"");
				red.include(request,response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   
		   
		   
	   }
	   
	   else
	   {
		   RequestDispatcher red= request.getRequestDispatcher("DeveloperDeploy.jsp");
			response.getWriter().println("<!DOCTYPE html>\r\n" + 
					"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					"  <head>\r\n" + 
					"    <meta charset=\"utf-8\">\r\n" + 
					"    <title></title>\r\n" + 
					"  </head>\r\n" + 
					"  <body>\r\n" + 
					"    <script type=\"text/javascript\">\r\n" + 
					"      alert(\"Try Again some information is missing!!!!\");\r\n" + 
					"    </script>\r\n" + 
					"\r\n" + 
					"  </body>\r\n" + 
					"</html>\r\n" + 
					"");
			red.include(request,response);
		   
	   }
		
		          
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		try {
			doMethod(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException
	{
		try {
			doMethod(request,response);
		} catch (IOException e) {
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
