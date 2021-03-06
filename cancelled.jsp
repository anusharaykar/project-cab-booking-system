
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String mn=(String)session.getAttribute("mn");
            String bn=(String)session.getAttribute("bn");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            //Statement st=cn.createStatement();
            //st.executeUpdate("delete from bookings where bookingnumber='"+bn+"'and passengermobilenumber='"+mn+"'");
           Statement st2=cn.createStatement();
            st2.executeUpdate("delete from bookingcust where bookingnumber='"+bn+"'and passengermobilenumber='"+mn+"'");
          String text=request.getParameter("txtarea");
            String apiKey = "apikey=" + "8otIViZnRps-5luiAQd5hUWiXCJOzzzAyU9nQoce7W";
                String message = "&message=" + " your booking has been cancelled"+text;             
                String sender = "&sender=" + "TXTLCL";
                String numbers = "&numbers=" + mn;
                
                

                // Send data
                HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
                String data = apiKey + numbers + message + sender;
                conn.setDoOutput(true);
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
                conn.getOutputStream().write(data.getBytes("UTF-8"));
                final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                final StringBuffer stringBuffer = new StringBuffer();
                String line;
                while ((line = rd.readLine()) != null) {
                        stringBuffer.append(line);
                }
                rd.close();
              
            }

             
            
        %><%
           
         
         catch(Exception e)
         {
            out.println(e); 
         }
            %> <jsp:forward page="adminwelcome.jsp" />                   
    </body>
</html>
