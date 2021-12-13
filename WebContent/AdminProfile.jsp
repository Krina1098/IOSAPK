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

<%Connection conn=DbConncetion.getDbConnection("oracle");%>
<%
String name,DOB, Contact, Address,Address2,PS,Country,Postal; 
  PreparedStatement stmt=null;
String UserId=(String)session.getAttribute("username");
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
<title>Admin Profile</title>
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
	.box
	{
	
	     width:75vw;
		height:130vh;
		margin-bottom: 5%;
	    margin-left:7%;
		background-color:#11101D;
		justify-content: center;
		border-radius: 5px;
		/*overflow: auto;  */
	
	}
	
	.card{
      display:flex;
      width:100%;
      height:200px;
      justify-content:center;
      margin-top:5%;
         
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
  
     .btn
     {
       width:20px;
       height:20px;
       border-radius: 5px;
       background: white;
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
			    <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;">Admin Profile </h2>
			     <div class="box">     	  
			       <div class="card"> 
				   				 
					   <img class="card_image" src="GetAdminProfileImage.jsp?id=${Email}" style="width:150px;height:150px;border-weight:2px;border-radius:50%;"/>
					   
					    <form action="AdminEditProfilePic.jsp" method="post">
					    
					      <input type="hidden" name="UserName" value="${Email}"> 
					     <button class="btn" type="submit"><i class='bx bx-edit'></i></button> 
	                   </form>
   					</div>
					
					<table style="margin-left:30%;color:white;">
					
					 <tr style="margin-bottom:25%;">
						 <td style="font-size:20px;"> <b> Name:</b> </td>
					    <td> <b> ${Name}</b></td>
					</tr>
					 <tr style="margin-bottom:25%;">
						 <td style="font-size:20px;"> <b> User Id: </b> </td>
					    <td> <b>${Email} </b></td>
					 </tr>
					 <tr style="margin-bottom:25%;">
						<td style="font-size:20px;"> <b> Date of Birth:</b> </td>
					    <td><b> ${Dob}</b></td>

					</tr>
					 <tr style="margin-bottom:25%;">
						 <td style="font-size:20px;"><b> Contact: </b></td>
					    <td><b> ${Contact}</b></td>
					</tr>
					 <tr style="margin-bottom:25%;">
						<td style="font-size:20px;"> <b> Address: </b></td>
						<td><b> ${Address} </b></td>
						
					</tr>
					<tr style="margin-bottom:25%;">
						<td>   </td>
						<td><b> ${Address2} </b></td>
						
					</tr>
					<tr style="margin-bottom:25%;">
						<td>  </td>
						<td><b> ${PS} </b></td>
						
					</tr>
					<tr style="margin-bottom:25%;">
						<td>   </td>
						<td><b>${Country}</b> </td>
						
					</tr>
					<tr>
						<td>   </td>
						<td><b> ${Postal} </b></td>
					
					</tr>
				 
					<form action="AdminEditProfile.jsp" method="post">
					  <tr style="margin-bottom:25%;">
					    <td> <input type="hidden" name="UserName" value="${Email}"> </td>
					<td> <button class="btn1" type="submit">Update</button> </td>
				    </tr> 
                   </form>
			   </table>
               		
			    	   
			 </div>
			 </div> 
		 </div>
	</div>
	</section>
    <script src="JS\Navigationbar.js"> </script>

</body>
</html>