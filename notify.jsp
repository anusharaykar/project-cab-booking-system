<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>notification Page</title>
        <link rel="stylesheet" href="notify.css">
    </head>
    <body>
        <div class="background"><div class="formbox">
            <%
          try
          {  
              int count=0;
          
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            String pmob=(String)session.getAttribute("no");
            
            PreparedStatement pr1=cn.prepareStatement("SELECT * FROM notification WHERE mobilenumber='"+pmob+"'" );
            ResultSet rs1=pr1.executeQuery();
            
            if(!rs1.next())
            {
                
                %>
                
                <script>
                    window.alert("No notifications");
                    window.history.back();
                </script>
                
                <%
                    }

                PreparedStatement pr3=cn.prepareStatement("SELECT max(indexvalue) as id from notification where mobilenumber='"+pmob+"'");
                ResultSet rs3=pr3.executeQuery();
                int count2=0;
                int cmsg=0;
               while(rs3.next())
               {
                  count2=rs3.getInt("id");
                  
                }
           PreparedStatement pr2=cn.prepareStatement("SELECT * FROM notification where mobilenumber='"+pmob+"'");
           ResultSet rs2=pr2.executeQuery();

            while( rs2.next())
            {  
                cmsg=rs2.getInt("indexvalue");
                 if((rs2.getInt("indexvalue")==count2))

                    {%><div class="text"><%
                        
                        out.println(rs2.getString("notifications"));%></div><%

                    }
               cmsg++;
                  

            }
          }
          catch(Exception e)
          {
             out.println(e); 
          }

%></div></div> <form method="get" action="userwelcome.jsp"><input class="btn" type="submit" value="back<<"></form>
        </div></div>
        <div class="hhh">     <a href="alln.jsp">see all the notification</a></div>
    </body>
</html>