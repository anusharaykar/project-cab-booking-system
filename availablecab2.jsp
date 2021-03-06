<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>available cabs Page</title>
        <link rel="stylesheet" href="availablecab.css">
    </head>
    <body>            
            <%
          try
          {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            String pin=request.getParameter("pincode");
            String days="--";
            String date=request.getParameter("tdate");
            String sc=request.getParameter("sc");
             String scc=sc+"+1";
            PreparedStatement pr1=cn.prepareStatement("SELECT * FROM CABINFORMATIONSS WHERE SEATCAPACITY = '"+scc+"'and pincode='"+pin+"'" );
            ResultSet rs1=pr1.executeQuery();
            String tot="local";
            if(!rs1.next())
            {
                %>
                
                <script>
                    window.alert("Sorry...  Cabs are not available at this moment");
                    window.history.back();
                </script>
                
                <%
            }
            else
            {
             %>
             <div class="background">
                     <div class="label">Available Cabs</div>
             <div class="text"> 
                <%  
                                   PreparedStatement pr=cn.prepareStatement("select * from cabinformationss where seatcapacity='"+scc+"'and pincode='"+pin+"'");
                ResultSet rs=pr.executeQuery();
                
                
               
               %> <table border="1" align="center"><tr>
                                <th>Driver Name</th>
                                <th>vehicle number</th>
                                <th>vehicle name</th>
                                <th>contact number</th>
                                <th>rate/km</th>
                                <th colspan="3">seat capacity</th>
                                </tr><%
               
                %>
                    <%
                            
                    %><tr><% while(rs.next())
                    {
                                   %>
                                <td><%=rs.getString("drivername")%></td>
                                <td><%=rs.getString("vehiclenumber")%></td>
                                <td><%=rs.getString("vehicletype")%></td>
                                <td><%=rs.getString("contactnumber")%></td>
                                 <td><%=rs.getString("rateperkm")%></td>
                                 <td><%=rs.getString("seatcapacity")%></td>
                                 <td><a href="confirmbooking.jsp?dname=<%=rs.getString("drivername")%>&pinc=<%=rs.getString("pincode")%>&vnum=<%=rs.getString("vehiclenumber")%>&vname=<%=rs.getString("vehicletype")%>&connum=<%=rs.getString("contactnumber")%>&scap=<%=rs.getString("seatcapacity")%>&km=<%=rs.getString("rateperkm")%>&pcity=<%=request.getParameter("pcity")%>&dcity=<%=request.getParameter("dcity")%>&tdate=<%=request.getParameter("tdate")%>&ptime=<%=request.getParameter("ptime")%>&sc=<%=request.getParameter("sc")%>&tot=<%=tot%>&day=<%=days%>"> <input type="submit" value="select"></a></td></tr>

                                 
                               <%                              
}
}  
                               
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
