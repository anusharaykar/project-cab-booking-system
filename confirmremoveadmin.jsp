<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>remove Page</title>
    </head>
    <body>
        <%
         try
         {
            String num=request.getParameter("num");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            st.executeUpdate("delete from admindetails where mobileno='"+num+"'");
           
            %><jsp:forward page="managerwelcome.jsp" /><%
            
         }
         catch(Exception e)
         {
             
         }
            %>                    
    </body>
</html>
