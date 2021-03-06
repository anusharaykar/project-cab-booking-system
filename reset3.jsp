<%-- 
    Document   : reset3
    Created on : 22 Mar, 2020, 7:20:43 AM
    Author     : gurudatth
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            try
            {
           String pass1=request.getParameter("txtpass1");
           String pass2=request.getParameter("txtpass2");
           String num=(String)session.getAttribute("num");
           if(pass1.equals(pass2))
           {
            
           Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
			Statement st=cn.createStatement();
			PreparedStatement pr=cn.prepareStatement("select * from userregisters");
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				if(rs.getString("mobileno").equals(num))
				{
                                  //String pasn=rs.getString("password");
                                 //String pasn=pass1;
                                  
                                  st.executeUpdate("update userregisters set password='"+pass1+"' where mobileno='"+num+"'");
                                  
                                }
                        }
                        %><jsp:forward page="firstpage.jsp" /><%
           }
        else
        {
        %><script>window.alert("missmatch ofpassword");window.history.back();
            </script><%
        }
}
catch(Exception e)
{
out.println(e);
}

            
            %>
    </body>
</html>
