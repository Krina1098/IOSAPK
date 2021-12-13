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
{  
	
    name=rs.getString("NAME");
    pageContext.setAttribute("Name", name);
	
	pageContext.setAttribute("Email", UserId);
	DOB=rs.getString("DOB");
	pageContext.setAttribute("Dob", DOB);
   	Contact=rs.getString("CONTACT");
	pageContext.setAttribute("Contact", Contact);
	Address=rs.getString("ADDRESS");
	pageContext.setAttribute("Address", Address);
	Address2=rs.getString("ADDRESS2");
	pageContext.setAttribute("Address2", Address2);
	PS=rs.getString("PS");
	pageContext.setAttribute("PS", PS);
	Country=rs.getString("COUNTRY");
	pageContext.setAttribute("Country", Country);
	Postal=rs.getString("POSTAL");
	pageContext.setAttribute("Postal", Postal);
	
	
	
}


  
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Amin Profile Update</title>
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

 
   .applicationBox
	{
         width:90vw;
		height:95vh;
		margin-bottom: 5%;
		margin-right:5%;
		background-color:lightgray;
		justify-content: center;
		border-radius: 5px;
		overflow: auto;
		
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
		margin-top:5%;
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

   .box
	{
	
	     width:75vw;
		height:110vh;
		margin-bottom: 5%;
	    margin-left:7%;
		background-color:#11101D;
		justify-content: center;
		border-radius: 5px;
		/*overflow: auto;  */
	
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
			    <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;">Update Admin Profile</h2>
			    <div class="box"> 
			    <form action="AdminEditProfile" method="POST">
			    <table style="color:white;">
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Name:</b> </td>
					<td><input class="input" type="text" name="Name" value="${Name}" disabled></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Date of Birth:</b> </td>
					<td><input class="input" type="text" name="DOB" value="${Dob}" disabled></td>
				</tr>
				<tr style="margin-bottom:30%;">
					<td style="latter-spacing:1px;"> <b> Contact:</b> </td>
					<td><input class="input" type="text" name="Contact" value="${Contact}"></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Address:</b> </td>
					<td><input class="input" type="text" name="Add1" value="${Address}"></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Address:</b> </td>
					<td><input class="input" type="text" name="Add2" value="${Address2}" ></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Province/State:</b> </td>
					<td><input class="input" type="text" name="PS" value="${PS}"></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Country:</b> </td>
					<td><input class="input" type="text" name="Country" value="${Country}" ></td>
				</tr>
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Postal code:</b> </td>
					<td><input class="input" type="text" name="Postal" value="${Postal}"></td>
				</tr>
				
				<tr style="margin-bottom:25%;">
					<td style="latter-spacing:1px;"> <b> Email:</b> </td>
					<td><input class="input" type="email" name="UserName" value="${Email}" disabled></td>
				</tr>
				
				<tr>
				<td>              </td>
				<td> <Button class= "btn1" type="submit">Update</Button></td>
				</tr>
				</table>
			    </form>
			    </div>
			 </div> 
		 </div>
	</div>
	</section>
    <script src="JS\Navigationbar.js"> </script>

</body>
</html>