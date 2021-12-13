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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Notification</title>
<link rel="stylesheet" href="CSS\style.css">
<link rel="stylesheet" href="CSS\slideNav.css">
<link rel="stylesheet" href="CSS\UserType.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
</head>
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
	
	
	.card{
      display:flex;
      width:100%;
      height:200px;
      overflow-y:auto; 
     /* margin-left:12px;*/
         
    }
    
     .box{
    
    width:80vw;
    height:65vh;
    
    
    border-radius:10px;
    background-color:#11101D;;
    border-weigh:5px;
    margin-bottom:3px;
    margin-left:5%;
    
    }
	table
      { 
		  width:60vw;  
		  height:40vh;
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
			    <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;">Admin Notification</h2>
			     	  
			       
               		<% 
               		  try
               		   {
               			PreparedStatement stmt=null;
               			 stmt = conn.prepareStatement("SELECT * FROM REPORT");
               			 ResultSet rs=stmt.executeQuery();
               			 String user=null,dev=null;
               			 user="User";
               			 dev="Developer";
               			 String about;
               			 while(rs.next())
               			 {
               				 about=rs.getString("ABOUT");
               				 if(user.equalsIgnoreCase(about))
               				 {%>
               				     <div class="box"> 
               				     <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:10px;"> <b> User</b></h3> </center>
               				    <table>    							     
	   							<tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b>  Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("APPLICATION") %></b></td>
       	 						 </tr>
       	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b> VERSION: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
       	 						 </tr>
       	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b> Email: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("USERNAME") %></b></td>
       	 						 </tr>
       	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b>  Comment: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("COMPLAIN") %></b></td>
       	 						 </tr>
    	 						 </table>
               					 </div>
               				 <%}
               				 else if(dev.equalsIgnoreCase(about))
               				 {%>
               				      <div class="box">
            				    
            				     <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:10px;"> <b> Developer</b></h3> </center>
            				      <table>    							     
	   							<tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b>  Application: </b> </td>
 	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("APPLICATION") %></b></td>
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b> VERSION: </b> </td>
 	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b> Email: </b> </td>
 	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("USERNAME") %></b></td>
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"> <b>  Comment: </b> </td>
 	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("COMPLAIN") %></b></td>
    	 						 </tr>
 	 						 </table>
            					 </div>
            				 <%}
               			 }
               			 
               		    }
               		catch(Exception e)
					{
						e.printStackTrace();
					}
               		
               		%>
			    	   
			 
			 </div> 
		 </div>
	</div>
	</section>
    <script src="JS\Navigationbar.js"> </script>
</body>
</html>