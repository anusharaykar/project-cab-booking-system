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
        <title>logic</title>
    </head>
    <body><%
        String num=request.getParameter("number");
        String amt=request.getParameter("amount");
        try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                Statement st=cn.createStatement();
                String pno="";
                PreparedStatement ps=cn.prepareStatement("select * from bookingcust where bookingnumber='"+num+"'");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    pno=rs.getString("passengermobilenumber");
                }
                //st.executeUpdate("update bookings set amount='"+amt+"',status='paid' where bookingnumber='"+num+"'");
                st.executeUpdate("update bookingcust set amount='"+amt+"',status='paid' where bookingnumber='"+num+"'");
                String apiKey = "apikey=" + "8otIViZnRps-5luiAQd5hUWiXCJOzzzAyU9nQoce7W";
                String message = "&message=" +"Thank you..we are at your service any time. from BOOKIT-cab booking service" ;             
                String sender = "&sender=" + "TXTLCL";
                String numbers = "&numbers=" + pno; 
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
    %><jsp:forward page="employeewelcome.jsp"/><%
        }
        catch(Exception e)
        {
            
        }
    %>
    </body>
</html>
