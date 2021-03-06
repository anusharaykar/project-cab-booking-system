<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>notification Page</title>
        <link rel="stylesheet" href="alln.css">
    </head>
    <body>
        <div class="background"><div class="formbox">
            <%
          try
          {  int count=0;
          
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
            Statement st=cn.createStatement();
            String pmob=(String)session.getAttribute("no");
            
            PreparedStatement pr1=cn.prepareStatement("SELECT * FROM notification WHERE mobilenumber='"+pmob+"'" );
            ResultSet rs1=pr1.executeQuery();
             while(rs1.next())
            {   
                            
                                if(count<10)
                                {
                                   
                                      %><div class="text"><%
                                     out.println(rs1.getString("notifications"));%></div><%
                                     out.println();
                                     count=count+1;
                                     
                                  }
                       }


           
          }
          catch(Exception e)
          {
             out.println(e); 
          }

%></div></div> <form method="get" action="userwelcome.jsp"><input class="btn" type="submit" value="okay<<"></form>
        </div></div>
        
    </body>
</html>