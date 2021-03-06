<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logic Page</title>
    </head>
    <body>
        <%
            String name=request.getParameter("username");
            Long mobilenumber=Long.parseLong(request.getParameter("mobilenumber"));
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String password2=request.getParameter("password2");
            session.setAttribute("no",mobilenumber);
            
        %>
        <%
            try
            {
                if(password.equals(password2))
                {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                Statement st=cn.createStatement();
                st.executeQuery("INSERT INTO userregisters VALUES('"+(name)+"',"+(mobilenumber)+",'"+(email)+"','"+(password)+"')");
                %><jsp:forward page="userwelcome.jsp"/><%
                st.close();
                cn.close();
                }
                else
                {%>
                <script>window.alert("mismatch of password")
                window.history.back();
                </script>
                <%

                }
              %><%
            }
            catch(SQLException x)
            {
                
            }
            catch(ClassNotFoundException c)
            {
                
            }
        %>
    </body>
</html>
