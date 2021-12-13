package iosapkStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException{
		HttpSession session=request.getSession();
		String user;
		response.setContentType("text/html");
		user=(String) session.getAttribute("username");
		if(user != null) {
			session.removeAttribute("username");
			session.removeAttribute("name");
			session.invalidate();
			RequestDispatcher red= request.getRequestDispatcher("Home.html");
		
		
			response.getWriter().println("<!DOCTYPE html>\r\n" + 
					"<html lang=\"en\" dir=\"ltr\">\r\n" + 
					"  <head>\r\n" + 
					"    <meta charset=\"utf-8\">\r\n" + 
					"    <title></title>\r\n" + 
					"  </head>\r\n" + 
					"  <body>\r\n" + 
					"    <script type=\"text/javascript\">\r\n" + 
					"      alert(\"User Successfully Logout!!!!\");\r\n" + 
					"    </script>\r\n" + 
					"\r\n" + 
					"  </body>\r\n" + 
					"</html>\r\n" + 
					"");
			
			red.include(request, response);
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
