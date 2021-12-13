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
<title>Developer Application Category</title>
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
    height:130vh;
    
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
			    <h2 style="color:black;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;"> Application Category</h2>
			    	   	
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
                    	
                    	  	stmt=conn.prepareStatement("SELECT * FROM APPLICATION WHERE DEVID=?");
                    	  	stmt.setString(1,UserId);
                    	    ResultSet rs=stmt.executeQuery();
                    	    
                             String s1="Education";
                             String s3="LifeStyle";
                             String s4="Ecommerce";
                             String s5="Game";
                             String s6="Entertainment";
                             String s7="SocialMedia";
                             String s8="Other";
                            
                             String ap=null;
                             String ver=null;
  						     while(rs.next())
  						  { 
  						    	 String s2=rs.getString("Category");
  						    	 
  						    	 
  						    	
  						       
   							  if(s1.equals(s2))	
   							{%> 
   							    <div class="box"> 
   							     <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:10px;"> <b> Education </b></h3> </center>
   							     <table>    							     
	   							<tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
    	 						
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
    	 						
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
    	 						
    	 						 </tr>
    	 						
    	 						 <tr> 
    	 						  <td><img  class="image" src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
    	 						  <td> <img   class="image" src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
    	 						  <td>  <img   class="image" src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
    	 						   <td>  <img   class="image" src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" alt =" "> </td>
    	 						    <td>  <img   class="image" src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
    	 						 </tr>
    	 						 </table>
    	 						 </div>
    	 						
    	 						 
   							   
						<%}
  						    
  						    	
   							    if(s3.equals(s2))	
  	   							{%>  
  	   							   <div class="box"> 
  	   							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:10px;"> <b> LifeStyle </b></h3> </center>
  	   							   <table>  							     
  		   							<tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						 <tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						 <tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						  <tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						  <tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						  <tr>
  		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
  	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
  	    	 						
  	    	 						 </tr>
  	    	 						
  	    	 						 <tr> 
  	    	 						  <td> <img  class="image" src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
  	    	 						  <td> <img  class="image"  src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
  	    	 						  <td> <img  class="image"  src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
  	    	 						  <td> <img  class="image"  src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>"  alt =" "> </td>
  	    	 						  <td> <img  class="image"  src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>"  =" "> </td>
   	    	 						 </tr>
  	    	 						 </table>
  	    	 						</div>
  	    	 						 
  	   							   
  							<%}
   							    
   							    
   							 if(s4.equals(s2))	
	   							{%>  
	   							   <div class="box"> 
	   							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:10px;"> <b> E Commerce </b></h3> </center>
	   							   <table>  							     
		   							<tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						 <tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:20px;"><b><%=rs.getString("VERSION") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						 <tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						  <tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						  <tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						  <tr>
		   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
	    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
	    	 						
	    	 						 </tr>
	    	 						
	    	 						 <tr> 
	    	 						  <td> <img src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
	    	 						  <td> <img src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
	    	 						  <td> <img src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
	    	 						  <td> <img src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
	    	 						  <td> <img src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
	    	 						 </tr>
	    	 						 </table>
	    	 						</div>
	    	 						 
	   							   
							<%}
   							    if(s5.equals(s2))	
   							{%>  
   							   <div class="box"> 
   							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:15px;"> <b> Game </b></h3> </center>
   							   <table>  							     
	   							<tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
    	 						
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
    	 						
    	 						 </tr>
    	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
    	 						
    	 						 </tr>
    	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
    	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
    	 						
    	 						 </tr>
    	 						
    	 						 <tr> 
    	 						  <td> <img src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
    	 						  <td> <img src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
    	 						  <td> <img src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
    	 						  <td> <img src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
    	 						  <td> <img src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
    	 						 </tr>
    	 						 </table>
    	 						</div>
    	 						 
   							   
						<%}
   							    
   							 if(s6.equals(s2))	
    							{%>  
    							   <div class="box"> 
    							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:15px;"> <b> Entertainment </b></h3> </center>
    							   <table>  							     
 	   							<tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
     	 						
     	 						 </tr>
     	 						 <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
     	 						
     	 						 </tr>
     	 						 <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
     	 						
     	 						 </tr>
     	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
     	 						
     	 						 </tr>
     	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
     	 						
     	 						 </tr>
     	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
     	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
     	 						
     	 						 </tr>
     	 						
     	 						 <tr> 
     	 						  <td> <img src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
     	 						  <td> <img src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
     	 						  <td> <img src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
     	 						  <td> <img src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
     	 						  <td> <img src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
     	 						 </tr>
     	 						 </table>
     	 						</div>
     	 						 
    							   
 						<%}
   							 
   							 if(s7.equals(s2))	
 							{%>  
 							   <div class="box"> 
 							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:15px;"> <b> SocialMedia </b></h3> </center>
 							   <table>  							     
	   							<tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
  	 						
  	 						 </tr>
  	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
  	 						
  	 						 </tr>
  	 						 <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
  	 						
  	 						 </tr>
  	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
  	 						
  	 						 </tr>
  	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
  	 						
  	 						 </tr>
  	 						  <tr>
	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
  	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
  	 						
  	 						 </tr>
  	 						
  	 						 <tr> 
  	 						  <td> <img src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
  	 						  <td> <img src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
  	 						  <td> <img src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
  	 						  <td> <img src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
  	 						  <td> <img src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
  	 						 </tr>
  	 						 </table>
  	 						</div>
  	 						 
 							   
						<%}
   							 
   							 if(s8.equals(s2))	
  							{%>  
  							   <div class="box"> 
  							   <center> <h3 style="color:white;text-align:center;padding-top:5%;font-size:35px;margin-bottom:15px;"> <b> Other </b></h3> </center>
  							   <table>  							     
 	   							<tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b>  Application: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("NAME") %></b></td>
   	 						
   	 						 </tr>
   	 						 <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Version: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("VERSION") %></b></td>
   	 						
   	 						 </tr>
   	 						 <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Operating System: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("OS") %></b></td>
   	 						
   	 						 </tr>
   	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developed By: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVNAME") %></b></td>
   	 						
   	 						 </tr>
   	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> Developer Email: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("DEVID") %></b></td>
   	 						
   	 						 </tr>
   	 						  <tr>
 	   							<td style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"> <b> About Application: </b> </td>
   	 						  <td  style="color:white; font-weight:bold; latter-spacing:1px;font-size:15px;"><b><%=rs.getString("Brief") %></b></td>
   	 						
   	 						 </tr>
   	 						
   	 						 <tr> 
   	 						  <td> <img src="GetDeveloperApplicationImage.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
   	 						  <td> <img src="GetDeveloperApplicationImage2.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
   	 						  <td> <img src="GetDeveloperApplicationImage3.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
   	 						  <td> <img src="GetDeveloperApplicationImage4.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
   	 						  <td> <img src="GetDeveloperApplicationImage5.jsp?app=<%=rs.getString("NAME")%>" style="width:150px;height:150px;border-weight:2px;margin-left:5px;" alt =""> </td>
   	 						 </tr>
   	 						 </table>
   	 						</div>
   	 						 
  							   
 						<%}
   							 
   							 
   							 
   							 
   							 
   							 
					}
					
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