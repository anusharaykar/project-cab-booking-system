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
        <title>otp Page</title>
         <link rel="stylesheet" href="otp.css">
    </head>
    <body>
        
        <%
            try{
                
                String dname=(String)session.getAttribute("drivername");
                String vnum=(String)session.getAttribute("vehiclenumber");
                String vname=(String)session.getAttribute("vehiclename");
                String dnum=(String)session.getAttribute("drivernum");
                String km=(String)session.getAttribute("kilometer");
                String pc=(String)session.getAttribute("pickupcity");
                String dc=(String)session.getAttribute("dropoffcity");
                String td=(String)session.getAttribute("traveldate");
                String pt=(String)session.getAttribute("pickuptime");
                String sc=(String)session.getAttribute("seatcapacity");
                
                String phone=(String)session.getAttribute("no");
                // Construct data
                int random=new Random().nextInt(999999);
                session.setAttribute("otp",random);
                String apiKey = "apikey=" + "JLJLsfoSC00-6irnECaGwpT0F2pcSxzLZev5KZwex3";
                String message = "&message=" +"Your cab has been booked. Your booking number is:"+random+" driver name:"+dname+" vehicle number"+vnum+" vehicle name"+vname+" rate/km"+km+" pickup time"+pc;             
                String sender = "&sender=" + "TXTLCL";
                String numbers = "&numbers=" + phone;
                
                
                

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
                %><jsp:forward page="driverotp.jsp" /><%

            }

              
            
              //out.println(stringBuffer.toString());
             catch (Exception e) {
                   // out.println("Error SMS "+e);
//			return "Error "+e;
            }
            
            
            %>
                           
       
    </body>
    
</html>
<a href="otp.jsp"></a>
