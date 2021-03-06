<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> cab informations</title>
        <link rel="stylesheet" href="removecab.css">
    </head>
    <body>            
            <%
          try
          {
             //String no=(String)session.getAttribute("no");
             String pc=request.getParameter("pc");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
//             PreparedStatement pr1=cn.prepareStatement("select * from admindetails where mobileno='"+no+"'");
//                ResultSet rs1=pr1.executeQuery();
//                while(rs1.next())
//                {
//                    pc=rs1.getString("pincode");
//                }
            PreparedStatement pr2=cn.prepareStatement("select * from cabinformationss where pincode='"+pc+"'");
                ResultSet rs2=pr2.executeQuery();
                while(!rs2.next())
                {
            %><script>window.alert("no registered vehicles in this place");
                window.history.back();</script><%
                }
                PreparedStatement pr=cn.prepareStatement("select * from cabinformationss where pincode='"+pc+"'");
                ResultSet rs=pr.executeQuery();
         %> <div class="background">
                     <div class="label">view employees</div>
             <div class="text"> 
                
                    <table border="1" align="center"><tr>
                                <th>Driver Name</th>
                                <th>vehicle number</th>
                                <th>vehicle name</th>
                                <th>contact number</th>
                                <th>rate/km</th>
                                
                                <th colspan="2">seat capacity</th></tr><%
                           while(rs.next())
                           {
                                %><tr>
                                <td><%=rs.getString("drivername")%></td>
                                <td><%=rs.getString("vehiclenumber")%></td>
                                <td><%=rs.getString("vehicletype")%></td>
                                <td><%=rs.getString("contactnumber")%></td>
                                 <td><%=rs.getString("rateperkm")%></td>
                                 
                                <td><%=rs.getString("seatcapacity")%></td>
                               
                              </tr>


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
