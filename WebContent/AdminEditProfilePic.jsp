<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="iosapkStore.DbConncetion"%>
<%@page import="iosapkStore.UserLogin" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%Connection conn=DbConncetion.getDbConnection("oracle");%>
<%
String name,DOB, Contact, Address,Address2,PS,Country,Postal; 
  PreparedStatement stmt=null;
String UserId=request.getParameter("UserName");
stmt = conn.prepareStatement("SELECT * FROM ADMINCREDENTIAL where USERNAME=?");


stmt.setString(1,UserId);
ResultSet rs =stmt.executeQuery();
if(rs.next())
{       name=rs.getString("NAME");
      pageContext.setAttribute("Name", name);
	pageContext.setAttribute("Email", UserId);

}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile Pic Update</title>
<link rel="stylesheet" href="CSS\style.css">
<link rel="stylesheet" href="CSS\slideNav.css">
<link rel="stylesheet" href="CSS\UserType.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
 
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Poppins', sans-serif;
	}

   .container{
	    width:55vw;
		height:75vh;
		/*margin-bottom:15%;*/
		margin-top:7%;
		margin-bottom: 20px;
		margin-left:20%;
	    margin-right:10%;
	    margin-bottom: 20px;
		background-color:lightgray;
		justify-content: center;
		border-radius: 5px;
		overflow: hidden;
		display:flex;
    }
    
   .applicationBox
	{
         width:50vw;
		height:55vh;
		/*margin-bottom:5%;*/
		margin-right:10%;
		/*margin-top:10%;*/
		background-color:lightgray;
		justify-content: center;
		border-radius: 5px;
		
		
	}
	
	.box
	{
	
	     width:45vw;
		height:40vh;
		margin-bottom: 5%;
	    margin-left:10%;
		background-color:#11101D;
		justify-content: center;
		border-radius: 5px;
		/*overflow: auto;  */
	
	}
		
	table
      { 
		  width:60vw;  
		  height: 95vh;
		  border-collapse: separate;
		  border-spacing: 0 10px;
		  margin-left:20%;
		}

		table tr td
		{
		  padding:10px !important;
		 
		}

	.btn1
	{
		width:10vw;
		height:5vh;
		/*margin-top:5%;*/
		font-size:15px;
		font-weight: 10px;
		font-family:'Poppins', sans-serif;
		border-radius: 5px;
		background: white;
		
	 }
  
   .input{
		width:25vw;
		height:5vh;
		border-radius:5px;
		background-color:white;
	}


</style>

</head>
<body>
<div class="slidebar">
      <div class="logo_content">
        <div class="logo">
          <img src="Images\Logo.jpg" class="logo_design">

        </div>
        <i class='bx bx-menu bx-flip-horizontal' id="btn" ></i>
      </div>
      <ul class="nav_list">
        
	    <li>
          <a href="AdminProfile.jsp">
             <i class='bx bxs-user-circle'></i>
              <span class="links_name"> Profile <span>
         </a>
         <span class="tool_tip"> Profile </span>
	   </li>
	   <li>
          <a href="AdminNotification.jsp">
           <i class='bx bxs-bell-ring'></i>
              <span class="links_name"> Notification <span>
         </a>
         <span class="tool_tip">Notification </span>
	   </li>
	   <li>
          <a href="AdminRemoveComment.html">
           <i class='bx bxs-comment-minus'></i>
              <span class="links_name"> Remove Comment<span>
         </a>
         <span class="tool_tip">Remove Comment</span>
	   </li>
         <li>
          <a href="AdminRemoveApplication.html">
          <i class='bx bxs-user-minus'></i>
              <span class="links_name"> Remove Application<span>
         </a>
         <span class="tool_tip">Remove Application</span>
	   </li>
	    <li>
          <a href="AdminLogout">
             <i class='bx bxs-log-out' ></i>
              <span class="links_name"> LogOut <span>
         </a>
         <span class="tool_tip"> LogOut </span>
       </li>
      </ul>
    </div>
    <section class="home_content">
     <div class="text">
		 <div class="container">
			  <div class="applicationBox">
			    <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;">${Name} Profile Update</h2>
			    <div class="box">
			    <form action="AdminEditProfilePic" method="POST" enctype="multipart/form-data">
			     <center>
			      <br>
			     <b style="color:white;"> Profile Pic: </b> <input  class="input" type="file" name="Profile">
				 <br> 
				 <br>
					<Button class= "btn1" type="submit">Update</Button>
			    </center>
			    </form>
			    </div>
			 </div> 
		 </div>
	</div>
	</section>
    <script src="JS\Navigationbar.js"> </script>

</body>
</html>