<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="iosapkStore.DbConncetion"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%Connection conn=DbConncetion.getDbConnection("oracle");%>
<%
    String app = request.getParameter("app");
    /* String version=request.getParameter("version");*/
    try {
       
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM APPLICATION WHERE NAME=?");
        ps.setString(1, app);
        /*ps.setString(2, version);*/
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("IMAGE1");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
         }
    } catch (Exception e) {
        out.println(e);
    }
%>