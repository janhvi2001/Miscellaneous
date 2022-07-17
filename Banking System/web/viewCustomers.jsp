
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Customers</title>
        
        <style>
            
            body {
                background:url(feed-bg.jfif);
                background-size: 2000px 700px;
                opacity:20;
                filter:alpha(opacity=10);
            }
            
            h1 {
                left:400px;
                position:absolute;
            }
            
            tr,th,td {
                border: 2px solid black;
            }
            
            table {
                position:absolute;
                left: 200px;
                top:150px;
                border: 2px solid black;
                height: 70px;
                width:1000px;
            }
            
        </style>
        
    </head>
    <body>
        <h1>Customers List</h1>
        <%
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking", "root", "");
         Statement st = c.createStatement();
         ResultSet rs=st.executeQuery("select*from customers");
         out.println("<table align='center' border='2' cellspacing='10' cellpadding='20'><tr><th>Customer's Name</th><th>Email</th><th>Current Balance</th></tr>");
         int i=1;
         while(rs.next())
         {
         out.println("<tr><td><b>"+rs.getString(1)+"</b></td><td><b>"+rs.getString(2)+"</b></td><td><b>"+rs.getString(3)+"</b></td></tr>"+rs.getString(4)+"<th><button href=''>Select Customer</th>");
         i++;
         
         }
         out.println("</table>");
        
        }
        catch(Exception e){out.println(e);}
        %>
    </body>
</html>
