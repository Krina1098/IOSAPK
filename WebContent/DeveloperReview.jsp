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
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>


<%Connection conn=DbConncetion.getDbConnection("oracle");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Developer Review</title>
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
		background-color:lightgray;
		border-radius: 5px;
		overflow-y:auto;
		
		
	}
	
	.card{
      display:flex;
      width:100%;
      height:200px;
      overflow-y:auto; 
     /* margin-left:12px;*/
         
    }
    
    .box{
    
    width:150vh;
    height:100vh;
    
    overflow:auto;
    border-radius:10px;
    background-color:#11101D;;
    border-weigh:5px;
    margin-bottom:3px;
    margin-left:5%;
    
    }
	table
      { 
		  width:60vw;  
		  height: 95vh;
		  border-collapse: separate;
		  border-spacing: 0 10px;
		  margin-left:5%;
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

    .image{
      width:200px;
      height:200px;
      border-radius:5px;
      margin:10px;
    
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
          <a href="DeveloperLogout"">
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
			    <h2 style="color:black;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;"> Application Review </h2>
			    	   	
			       <% 
                     try
					{
                    	  PreparedStatement stmt=null;
                    	  String UserId=(String)session.getAttribute("username");
                    	  stmt = conn.prepareStatement("SELECT * FROM DEVELOPER where USERNAME=?");


                    	  stmt.setString(1,UserId);
                    	  int row =stmt.executeUpdate();
                    	  if(row>0)
                    	  {
                    		  pageContext.setAttribute("Email", UserId); 
                    	  }
                    	
                    	  	stmt=conn.prepareStatement("SELECT * FROM REVIEW WHERE DEVID=? ORDER BY APPNAME,VERSION");
                    	  	stmt.setString(1,UserId);
                    	    ResultSet rs=stmt.executeQuery();
                    	    
                             
  						     while(rs.next())
  						  { %>
  						    	 
  						    	 
  						    	 <div class="box">
  						    	 <table>
  						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("APPNAME") %></b></td>
   						    	 </tr>
   						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
   						    	 </tr>
   						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> User: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
   						    	 </tr>
   						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Email: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("USERID") %></b></td>
   						    	 </tr>
   						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Rating: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("RATING") %></b></td>
   						    	 </tr>
   						    	 <tr> 
  						    	  <td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Comment: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("COMENT") %></b></td>
   						    	 </tr>
   						    	 </table>
   						    	 </div>
  						    	 
  						    	
					       <%}
					
				}catch(Exception e)
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