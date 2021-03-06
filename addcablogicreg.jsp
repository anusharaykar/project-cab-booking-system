<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add cab logic Page</title>
    </head>
    <body>
        <%
            //String dname=request.getParameter("drivername");
            String vehinum=request.getParameter("vehiclenumber");
            //String vehiname=request.getParameter("vehiclename");
            String connum=request.getParameter("contactnumber");
            //String km=request.getParameter("km");
            //String scap=request.getParameter("seatcapacity");
            //String pc=request.getParameter("pincode");
        %>
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                Statement st=cn.createStatement();
                PreparedStatement pr1=cn.prepareStatement("SELECT * FROM empinfo WHERE vehiclenumber = '"+vehinum+"'and contactnumber='"+connum+"'" );
            ResultSet rs1=pr1.executeQuery();
            if(!rs1.next())
            {
                %>
                
                <script>
                    window.alert("invalid number");
                    window.history.back();
                </script>
                
                <%
            }
            String dname="";
            String vtype="";
            String sc="";
            String rk="";
            String pc1="";
            PreparedStatement pr2=cn.prepareStatement("SELECT * FROM empinfo WHERE vehiclenumber = '"+vehinum+"' and contactnumber='"+connum+"'" );
            ResultSet rs2=pr2.executeQuery();
            while(rs2.next())
            {
             dname=rs2.getString("drivername");
             vtype=rs2.getString("vehicletype");
             sc=rs2.getString("seatcapacity");
             rk=rs2.getString("rateperkm");
             pc1=rs2.getString("pincode");

            }
            out.println("fhf");
            st.executeQuery("INSERT INTO cabinformationss VALUES('"+(dname)+"','"+(vehinum)+"','"+(vtype)+"','"+(connum)+"','"+(sc)+"','"+(rk)+"','"+pc1+"')");
                %><jsp:forward page="employeewelcome.jsp" /><%
                st.close();
                cn.close();
            }
            catch(Exception x)
            {
              out.println(x);  
            }
            
        %>
    </body>
</html>
