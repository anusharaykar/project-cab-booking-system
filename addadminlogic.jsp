<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add cab logic Page</title>
    </head>
    <body>
        <%
            String name=request.getParameter("name");
             String pincode=request.getParameter("pincode");
//            String vehiname=request.getParameter("vehiclename");
            String connum=request.getParameter("contactnumber");
            String pass=request.getParameter("pass");
            String place=request.getParameter("place");
            
        %>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                Statement st=cn.createStatement();
                st.executeQuery("INSERT INTO admindetails VALUES('"+(name)+"','"+(connum)+"','"+(place)+"','"+pincode+"','"+(pass)+"')");
                %><jsp:forward page="managerwelcome.jsp" /><%
                st.close();
                cn.close();
            }
            catch(SQLException x)
            {
                
            }
            catch(ClassNotFoundException c)
            {
                
            }
        %>
    </body>
</html>
