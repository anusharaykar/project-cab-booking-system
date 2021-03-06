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
        <title>driver Page</title>
         <link rel="stylesheet" href="otp.css">
    </head>
    <body>
        
        <%
            try{
                String tot=(String)session.getAttribute("msg");
                int otp=(Integer)session.getAttribute("otp");
                String pc=(String)session.getAttribute("pickupcity");
                String dc=(String)session.getAttribute("dropoffcity");
                String td=(String)session.getAttribute("traveldate");
                String pt=(String)session.getAttribute("pickuptime");
                
                
                
                String apiKey = "apikey=" + "JLJLsfoSC00-6irnECaGwpT0F2pcSxzLZev5KZwex3";
                String message = "&message=" +"request from user for your service. booking number is:"+otp+" pickup time:"+pt+" pickup:"+pc+" departure:"+dc+" mode of travel:"+tot+" travel date:"+td+"";             
                String sender = "&sender=" + "TXTLCL";
                String numbers = "&numbers=" + "8792666164";
                
                

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
               %> <jsp:forward page="lastpage.jsp" /><%
            }

              
            
              //out.println(stringBuffer.toString());
             catch (Exception e) {
                 out.println("Error SMS "+e);
//			return "Error "+e;
            }
            
            
            %>
            
               
       
    </body>
    
</html>
