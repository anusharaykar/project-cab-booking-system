<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add cab logic Page</title>
        <link rel="stylesheet" href="lastpage.css">
    </head>
    <body>
        
        <%  try
        {
            
                int otp=(Integer)session.getAttribute("otp"); 
                String dname=(String)session.getAttribute("drivername");
                String vnum=(String)session.getAttribute("vehiclenumber");
                String vname=(String)session.getAttribute("vehiclename");
                String dnum1=(String)session.getAttribute("drivernum");
                String days=(String)session.getAttribute("days");
                String km=(String)session.getAttribute("kilometer");
                String pc=(String)session.getAttribute("pickupcity");
                String dc=(String)session.getAttribute("dropoffcity");
                String td=(String)session.getAttribute("traveldate");
                String pt=(String)session.getAttribute("pickuptime");
                String sc=(String)session.getAttribute("seatcapacity");
                String pmob=(String)session.getAttribute("no");
                String tot=(String)session.getAttribute("msg");
                String pin=(String)session.getAttribute("pincode");
                
               
       
              Class.forName("oracle.jdbc.driver.OracleDriver");
                 String pname="";
                
                Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
                
                Statement st=cn.createStatement();
                PreparedStatement ps=cn.prepareStatement("select * from userregisters where mobileno='"+pmob+"'");
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    pname=rs.getString("name");
                }
                
          
                
                //st.executeQuery("INSERT INTO bookings VALUES('"+(pname)+"','"+(pmob)+"','"+(dname)+"','"+(vnum)+"','"+(dnum1)+"','"+(tot)+"','"+(pc)+"','"+dc+"','"+km+"','"+sc+"','"+vname+"','"+td+"','"+days+"','---','---','"+pin+"','"+otp+"','"+pt+"')");
               Statement st2=cn.createStatement();
               st2.executeQuery("INSERT INTO bookingcust VALUES('"+(pname)+"','"+(pmob)+"','"+(dname)+"','"+(vnum)+"','"+(dnum1)+"','"+(tot)+"','"+(pc)+"','"+dc+"','"+km+"','"+sc+"','"+vname+"','"+td+"','"+days+"','---','---','"+pin+"','"+otp+"','"+pt+"')");
               Statement st3=cn.createStatement();
               
               String msgg="your cab has  been booked where booking number:"+otp+"and travel date:"+td+".";
              String indexval;
               int count2=0;
               
               PreparedStatement psn=cn.prepareStatement("select max(indexvalue) as id from notification");
                ResultSet rsn=psn.executeQuery();
                
                 
                while(rsn.next())
                {
                    count2=rsn.getInt("id");
                    count2+=1;
                   
                }
                
         
               st3.executeQuery("INSERT INTO notification VALUES('"+(pmob)+"','"+msgg+"','"+count2+"')");
               %><div class="background">
            <div class="formbox"><div class="textt"><h1>your booking has been succeded..you will get confirmation message to your registered mobile number..
                        Save the message for further use..<br><br>
                       Thank you</h1></div><form method="get" action="userwelcome.jsp"><input type="submit" class="btn" value="okay"><%
                  
                
            }
            catch(Exception x)
            {
                out.print(x);
            }
           
        %>
        </div>
        </div>
    </body>
</html>
