<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="iosapkStore.EmailFunctionality"%>
<%@ page import="javax.mail.MessagingException"%>
<%
	String message = null;
	
	if (request.getParameter("submit") != null) {
		EmailFunctionality em= new EmailFunctionality();
		em.setServerProperties();
		String sub = "Comment";
		String body = "Hello, ";
		if (request.getParameter("fname") != null & request.getParameter("lname") != null) {
			body = "I'm  " + request.getParameter("fname")+ " "+ request.getParameter("lname")+"<br>";
					
		}
		if (request.getParameter("Contact") != null) {
			body= body + "You can contact me on my contct number "
					+ request.getParameter("Contact") + " ";
		}
		if (request.getParameter("email") != null) {
			body = body + "or email id "
					+ request.getParameter("email") + ". ";
		}
		if (request.getParameter("msg") != null) {
			body = body + " " + request.getParameter("msg")
					+ "<br>";
		}
		em.createMessage(sub,body);
		try {
			 em.sendEmail();
			
			
			out.write("<!DOCTYPE html>\r\n" + 
		     		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
		     		"  <head>\r\n" + 
		     		"    <meta charset=\"utf-8\">\r\n" + 
		     		"    <title></title>\r\n" + 
		     		"  </head>\r\n" + 
		     		"  <body>\r\n" + 
		     		"    <script type=\"text/javascript\">\r\n" + 
		     		"      alert(\"Email Sent Successfully!!!!\");\r\n" + 
		     		"    </script>\r\n" + 
		     		"\r\n" + 
		     		"  </body>\r\n" + 
		     		"</html>");
		} catch (MessagingException e) {
			e.printStackTrace();
			out.write("<!DOCTYPE html>\r\n" + 
		     		"<html lang=\"en\" dir=\"ltr\">\r\n" + 
		     		"  <head>\r\n" + 
		     		"    <meta charset=\"utf-8\">\r\n" + 
		     		"    <title></title>\r\n" + 
		     		"  </head>\r\n" + 
		     		"  <body>\r\n" + 
		     		"    <script type=\"text/javascript\">\r\n" + 
		     		"      alert(\"Try after some time!!!!\");\r\n" + 
		     		"    </script>\r\n" + 
		     		"\r\n" + 
		     		"  </body>\r\n" + 
		     		"</html>");
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title> Contact Us</title>
<link rel="stylesheet" href="CSS\style.css">
<link rel="stylesheet" href="CSS\slideNav.css">
<link rel="stylesheet" href="CSS\UserType.css">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<meta charset="ISO-8859-1">
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
		height:75vh;
		margin-bottom: 5%;
	    margin-left:7%;
		background-color:lightgrey;
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
		
		.textarea{
		width:55vw;
		height:15vh;
		border-radius:5px;

	}
	 .input{
		width:55vw;
		height:6vh;
		border-radius:5px;
		background-color:white;
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
          <a href="Home.html">
            <i class='bx bxs-home bx-flip-horizontal' ></i>
            <span class="links_name"> Home </span>
         </a>
         <span class="tool_tip"> Home </span>
       </li>
        <li>
           <a href="AboutUs.html">
          <i class='bx bxs-info-square bx-flip-horizontal' ></i>
          <span class="links_name"> About Us <span class="links_name"> </span>
         </a>
         <span class="tool_tip"> About Us </span>
       </li>
        <li>
           <a href="Contact.jsp">
              <i class='bx bxs-contact'></i>
              <span class="links_name">Contact Us </span>
            </a>
            <span class="tool_tip"> Contact Us</span>
        </li>
        <li>
          <a href="UserType.html">
             <i class='bx bxs-user-account' ></i>
              <span class="links_name">Sign in<span>
         </a>
         <span class="tool_tip"> Sign in </span>
       </li>
      </ul>
    </div>
    <section class="home_content">
	 <div class="text">
	  <div class="container">
	    <div class="applicationBox">
	      <h2 style="color:#11101d;text-align:center;padding-top:5%;font-size:45px;margin-bottom:20px;">Contact Us </h2>
	       <div class="box">
	       <form  class="b1" action=" " method="post">
         <table>
           <tr  style="margin-bottom:25%;">
             <td style="font-weight:bold; latter-spacing:1px;font-size:20px;">First Name:</td>
             <td><input class="input"  type="text" name="fname" placeholder="Name" required></td>
           </tr>
            <tr  style="margin-bottom:25%;">
             <td style="font-weight:bold; latter-spacing:1px;font-size:20px;">Last Name:</td>
             <td><input class="input"  type="text" name="lname" placeholder="Last Name" required></td>
           </tr>
           <tr  style="margin-bottom:25%;">
             <td style="font-weight:bold; latter-spacing:1px;font-size:20px;">Contact:</td>
             <td><input class="input"  type="text" name="Contact" placeholder="contact" required></td>
           </tr>
           <tr  style="margin-bottom:25%;">
             <td style= "font-weight:bold;latter-spacing:1px;font-size:20px;">Email:</td>
             <td><input class="input" type="email" name="email" placeholder="xyz@gmail.com" required></td>
           </tr>
           <tr  style="margin-bottom:25%;">
             <td style="font-weight:bold; latter-spacing:1px;font-size:20px;">Message:</td>
             <td><textarea class="textarea" name="msg" rows="10" cols="50" placeholder="Add Message" maxlength="500" required></textarea></td>
           </tr>
           <tr  style="margin-bottom:25%;">
             <td> </td>
             <td><Button class="btn1"  type="submit" name="submit"><b> Send Message </b></Button></td>
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