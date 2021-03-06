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
            String dname=request.getParameter("drivername");
            String vehinum=request.getParameter("vehiclenumber");
            String vehiname=request.getParameter("vehiclename");
            String connum=request.getParameter("contactnumber");
            String km=request.getParameter("km");
            String scap=request.getParameter("seatcapacity");
            String pc=request.getParameter("pincode");
        %>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                Statement st=cn.createStatement();
                st.executeQuery("INSERT INTO cabinformationss VALUES('"+(dname)+"','"+(vehinum)+"','"+(vehiname)+"','"+(connum)+"','"+(scap)+"','"+(km)+"','"+pc+"')");
               st.executeQuery("INSERT INTO empinfo VALUES('"+(dname)+"','"+(vehinum)+"','"+(vehiname)+"','"+(connum)+"','"+(scap)+"','"+(km)+"','"+pc+"')"); 
        %><jsp:forward page="adminwelcome.jsp" /><%
                st.close();
                cn.close();
            }
            catch(SQLException x)
            {
                out.println(x);
            }
            catch(ClassNotFoundException c)
            {
                
            }
        %>
    </body>
</html>
