<%-- 
    Document   : CustomerForm_Server
    Created on : 04-Apr-2022, 6:50:28 am
    Author     : janhvipanikar
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String cn=request.getParameter("dn");
            String mn=request.getParameter("pn");
            String ct=request.getParameter("ye");
          
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/banking","root","");
            PreparedStatement ps=c.prepareStatement("insert into customers(Name,Email,Current_Balance) values(?,?,?,?)");
            ps.setString(1, cn);
            ps.setString(2, mn);
            ps.setString(3, ct);
            ps.executeUpdate();
            out.println("<script>alert('Data Saved.');window.location.assign('viewCustomers.jsp');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
