<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="userviewbookings.css">
        <title>Booking Page</title>
    </head>
    <body>
    <div class="background">
        <div class="label"> Bookings</div>
        <div class="text">  
            
            <%
          try
          {
          String numb=request.getParameter("number");
          session.setAttribute("number",numb);
          Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
	  Statement st=cn.createStatement();
          PreparedStatement pr1=cn.prepareStatement("select * from bookingcust where status='---' and drivernumber='"+numb+"'");
          ResultSet rs1=pr1.executeQuery();
          while(!rs1.next())
          {
            %><script>window.alert("no bookings");
                window.history.back();</script><%
          }
          PreparedStatement pr=cn.prepareStatement("select * from bookingcust where status='---' and drivernumber='"+numb+"'");
          ResultSet rs=pr.executeQuery();
          %> 
              <table border="1" align="center">
                  <tr> <th>Passenger name</th>
                      <th>Booking number</th>
                          <th>mobilenumber</th>
                          <th>Vehicle number</th>
                          <th>driver number</th>
                          <th>Travel type</th>
                          <th>Pick-up city</th>
                          <th>Drop-off city</th>
                          <th>Rate/km</th>
                          <th>Seat capacity</th>
                          <th>Vehicle name</th>
                          <th colspan="8">Travel date</th></tr><%
                     while(rs.next())
                     {
                          %><tr>
                          <%String mn=rs.getString("passengermobilenumber");
                           session.setAttribute("mn",mn);%>
                          <td><%=rs.getString("passengername")%></td>
                          <td><%=rs.getString("bookingnumber")%></td>
                          <td><%=mn%></td>
                          <td><%=rs.getString("vehiclenumber")%></td>
                          <td><%=rs.getString("drivernumber")%></td>
                          <td><%=rs.getString("typeoftravel")%></td>
                          <td><%=rs.getString("pickupcity")%></td>
                          <td><%=rs.getString("dropoffcity")%></td>
                          <td><%=rs.getString("rateperkilometer")%></td>
                          <td><%=rs.getString("seatcapacity")%></td>
                          <td><%=rs.getString("vehiclename")%></td>
                          <td><%=rs.getString("traveldate")%></td>
                            <td>  <a href="allot.jsp?mn=<%=rs.getString("vehiclenumber")%>">allot service>></a></td></tr>
                            <%
                    }
           %></table><%
          }
          catch(Exception c)
           {
            out.print(c);
            }
          %>
            </div>
        
        
    </div>
    </body>
</html>
