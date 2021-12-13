<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="iosapkStore.DbConncetion"%>
<%@page import="iosapkStore.DeveloperLogin" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%Connection con =DbConncetion.getDbConnection("oracle");%>
<%
String name;
PreparedStatement stmt=null;
String UserId=(String)session.getAttribute("username");
stmt = con.prepareStatement("SELECT * FROM DEVELOPER where USERNAME=?");
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
<title>Developer Report</title>
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
		/*margin-bottom: 5%;*/
		margin-right:5%;
		background-color:lightgray;
		justify-content: center;
		border-radius: 5px;
		overflow: auto;
		
	}
	
	
	table
      { 
		  width:60vw;  
		  height: 85vh;
		  border-collapse: separate;
		  border-spacing: 0 10px;
		   margin-left:10%;
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
     
     .input{
		width:55vw;
		height:6vh;
		border-radius:5px;
		background-color:white;
	}	

    .textarea{
		width:55vw;
		height:15vh;
		border-radius:5px;

	}
	
	  .box{
    
    width:150vh;
    height:130vh;
    
    overflow:auto;
    border-radius:10px;
    background-color:#11101D;;
    border-weigh:5px;
    margin-left:5%;
    
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
          <a href="DeveloperHome.html">
            <i class='bx bxs-home bx-flip-horizontal' ></i>
            <span class="links_name"> Home </span>
         </a>
         <span class="tool_tip"> Home </span>
	   </li>
	    <li>
          <a href="DeveloperProfile.jsp">
             <i class='bx bxs-user-circle'></i>
              <span class="links_name"> Profile <span>
         </a>
         <span class="tool_tip"> Profile </span>
	   </li>
        <li>
           <a href="DeveloperDeploy.jsp">
          <i class='bx bx-upload'></i>
          <span class="links_name"> Deploy </span>
         </a>
         <span class="tool_tip"> Deploy </span>
	   </li>
	    </li>
        <li>
           <a href="DeveloperCategory.jsp">
          <i class='bx bxs-category'></i>
          <span class="links_name"> Category </span>
         </a>
         <span class="tool_tip"> Category </span>
	   </li>
	   <li>
           <a href="DeveloperReview.jsp">
			  
			<i class='bx bxs-comment-detail'></i>
			<span class="links_name"> Review </span>
            </a>
            <span class="tool_tip"> Review  </span>
        </li>
        <li>
           <a href="DeveloperReport.jsp">
              <i class='bx bxs-report'></i>
              <span class="links_name"> Report </span>
            </a>
            <span class="tool_tip"> Report </span>
		</li>
		 
       
	   
	    <li>
          <a href="DeveloperLogout">
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
			    <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:10px;">Report User Comment</h2>
			    <div class="box">   	  
			    <form action="DeveloperReport" method="post">
		    		<table class="b1">
		    		<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> Name:</b> </td>
						<td><input class="input" type="text" name="Name" value="${Name}" disabled></td>
					</tr>
					
					<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> Email:</b> </td>
						<td><input class="input" type="email" name="Username" value="${Email}" disabled></td>
					</tr>
					<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> Application:</b> </td>
						<td><input class="input" type="text" name="Appname" placeholder="Application name" ng-model="Appname" required></td>
					</tr>
					<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> Version:</b> </td>
						<td><input class="input" type="text" name="Version" placeholder="Version" ng-model="Version" required></td>
					</tr>
					<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> User email:</b> </td>
						<td><input class="input" type="text" name="UserId" placeholder="email" ng-model="DevID"></td>
					</tr>
					<tr style="margin-bottom:25%;color:white;">
						<td style="latter-spacing:1px;"> <b> Comment:</b> </td>
						<td> <textarea class="textarea" rows:"10" cols:"30" maxlength="1000" name="Comment" required> </textarea></td>
					</tr>
	                
					<tr>
					    <td> </td>			   
						<td> <button type="SUBMIT" class= "btn1">  Report </button></td>
						
				    </tr>
				    <tr>
				    <td> </td>
				    <td> <button type="RESET" class= "btn1"> Clear </button></td>
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