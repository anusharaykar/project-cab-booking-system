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
              String vn=request.getParameter("mn");
            String mn=(String)session.getAttribute("number");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            st.executeUpdate("delete from cabinformationss where vehiclenumber='"+vn+"' and contactnumber='"+mn+"'");
          
            
            String apiKey = "apikey=" + "8otIViZnRps-5luiAQd5hUWiXCJOzzzAyU9nQoce7W";
                String message = "&message=" + " your booking has been alloted for service";             
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
            %> <jsp:forward page="employeewelcome.jsp" />                   
    </body>
</html>
