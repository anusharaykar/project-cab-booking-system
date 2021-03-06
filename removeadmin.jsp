<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>remove cab</title>
        <link rel="stylesheet" href="removeadmin.css">
    </head>
    <body>            
            <%
          try
          {
             
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
             PreparedStatement pr1=cn.prepareStatement("select * from admindetails");
                ResultSet rs1=pr1.executeQuery();
                while(!rs1.next())
                {
            %><script>window.alert("no admins");
                window.history.back();</script><%
                }
                PreparedStatement pr=cn.prepareStatement("select * from admindetails");
                ResultSet rs=pr.executeQuery();
         %> <div class="background">
                     <div class="label">Remove Admin</div>
             <div class="text"> 
                
                    <table border="1" align="center"><tr>
                                <th>Name</th>
                                <th>mobile number</th>
                                
                                <th>place</th>
                                
                                <th colspan="3">pincode</th>
                                </tr><%
                           while(rs.next())
                           {
                                %><tr>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("mobileno")%></td>
                                <td><%=rs.getString("place")%></td>
                                
                                 <td><%=rs.getString("pincode")%></td>
                                
                                <td><a href="confirmremoveadmin.jsp?name=<%=rs.getString("name")%>&num=<%=rs.getString("mobileno")%>"><input type="submit" value="REMOVE" name="remove"></a></td>

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
