<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login logic Page</title>
    </head>
    <body>
        <% 
            try
            {
			String num=request.getParameter("number");
                       
                        String pass=request.getParameter("password");
                        session.setAttribute("no",num);
	
                        int logc=2;
                        
                        if(num.equals("1234") && pass.equals("manager"))
                            
                        {
                            %> <jsp:forward page="managerwelcome.jsp"/> <%
                        }
                         if(num.equals("1234") && pass.equals("employee"))
                            
                        {
                            %> <jsp:forward page="employeewelcome.jsp"/> <%
                        }
                         			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
			Statement st=cn.createStatement();
			PreparedStatement pr=cn.prepareStatement("select * from userregisters");
			ResultSet rs=pr.executeQuery();
			while(rs.next())
			{
				if((rs.getString("mobileno").equals(num))&& (rs.getString("password").equals(pass)) )
				{
					
						%>
						<jsp:forward page="userwelcome.jsp" />
						<%
							logc=0;
							break;
					}
                            }
			if(logc==2)
			{
                                               
                        PreparedStatement pr1=cn.prepareStatement("select * from admindetails");
			ResultSet rs1=pr1.executeQuery();
			while(rs1.next())
			{
                                if((rs1.getString("mobileno").equals(num))&&(rs1.getString("password").equals(pass)))
				{
					
						%>
                                                <jsp:forward page="adminwelcome.jsp" />
						<%
							logc=1;
							break;
				}
                         }
                        }
                       			if(logc==2)
						{
                                                %><script>window.alert("invalid password or id");
                                                    window.history.back();</script><%
							
			 
           
						}
				 
                        
				                         


}
                        catch(Exception s)
                        {
                                out.print(s);

                        }
                         %>
 

    </body>
</html>
