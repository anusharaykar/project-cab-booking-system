
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>

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
            String mn=request.getParameter("mn");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            PreparedStatement pr3=cn.prepareStatement("select * from bookingcust where bookingnumber='"+mn+"'");
              ResultSet rs3=pr3.executeQuery();
              String stt="";
              while(rs3.next())
              {
                 stt=rs3.getString("status");
              }
               if((stt).equals("---"))
               {
            //st.executeUpdate("delete from bookingcust where bookingnumber='"+mn+"' and status='---'");
           Statement st2=cn.createStatement();
            st2.executeUpdate("delete from bookingcust where bookingnumber='"+mn+"'and status='---'");
         }
               else{
        %><script>window.alert("unable to cancel");window.history.back();</script><%
               }
         }
           
         
         catch(Exception e)
         {
            out.println(e); 
         }
        %><jsp:forward page="userwelcome.jsp" />                   
    </body>
</html>
