package iosapkStore;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserDownload")
public class UserDownload extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) {
		String appName,version;
		String fileName=null;
		Blob fileData=null;
		appName=request.getParameter("Appname");
		version=request.getParameter("Version");
		
		PreparedStatement stmt=null; 
		Connection conn =DbConncetion.getDbConnection("oracle");
	
		
		try {
			stmt = conn.prepareStatement("SELECT * FROM APPLICATION WHERE NAME=? AND VERSION=?");
			stmt.setString(1, appName);
			stmt.setString(2, version);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				    fileName = rs.getString("FILENAME");
		           fileData = rs.getBlob("APPLICATION");
			}
			String contentType = this.getServletContext().getMimeType(fileName);
			response.setHeader("Content-Type", contentType);

	       response.setHeader("Content-Length", String.valueOf(fileData.length()));

	       response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
	       response.setContentType(contentType);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
	    doMethod(request,response);
	}


}
