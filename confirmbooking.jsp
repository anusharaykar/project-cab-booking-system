<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>confirm booking Page</title>
        <link href="confirmbooking.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <div class="background">
            <div class="formbox">
                <div class="buttonbox">
                    <label>Booking Details</label>
                    <%
                        try
                        {
                                %><form method=get action="otp.jsp" id="login"><%
                                String dname=request.getParameter("dname");
                                %><div class="textdec1"><%out.println("1.Driver name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(dname);%></div>
                                <% session.setAttribute("drivername",dname);
                               

                                String vnum=request.getParameter("vnum");
                                %><div class="textdec2"><%out.println("2.vehicle number&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(vnum);%></div>
                                <% session.setAttribute("vehiclenumber",vnum);

                                
                                
                                String vname=request.getParameter("vname");
                                %><div class="textdec3"><%out.println("3.vehicle name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp :");
                                out.println(vname);%></div>
                                <% session.setAttribute("vehiclename",vname);

                                String connum=request.getParameter("connum");
                                %><div class="textdec4"><%out.println("4.contact number&nbsp&nbsp&nbsp&nbsp:");
                                out.println(connum);%></div>
                                <% session.setAttribute("drivernum",connum);

                                

                                String km=request.getParameter("km");
                                %><div class="textdec5"><%out.println("6.price/km&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(km);%></div>
                                <% session.setAttribute("kilometer",km);


                                String pc=request.getParameter("pcity");
                                %><div class="textdec6"><%out.println("7.Pickup city&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: ");
                                out.println(pc);%></div>
                                <% session.setAttribute("pickupcity",pc);


                                String dc=request.getParameter("dcity");
                                %><div class="textdec7"><%out.println("8.drop-off city&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(dc);%></div>
                                <% session.setAttribute("dropoffcity",dc);

                                
                                String pinc=request.getParameter("pinc");
                                %><div class="textdec2"></div>
                                <% session.setAttribute("pincode",pinc);
                                
                                String td=request.getParameter("tdate");
                                %><div class="textdec8"><%out.println("9.travel date&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(td);%></div>
                                <% session.setAttribute("traveldate",td);

                                String pt=request.getParameter("ptime");
                                %><div class="textdec9"><%out.println("10.Pickup time&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(pt);%></div>
                                <% session.setAttribute("pickuptime",pt);

                                String sc=request.getParameter("sc");
                                sc=sc+"+1";
                                %><div class="textdec10"><%out.println("11.seat capacity&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
                                out.println(sc);%></div>
                                <% session.setAttribute("seatcapacity",sc);
                                
                               String tot=request.getParameter("tot");
                               session.setAttribute("msg",tot);%>
                                <div class="textdec12"><%out.println("13.Travel type&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp :");
                               out.println(tot);%></div><%
                                String day=request.getParameter("day");
                                %><div class="textdec11"><%out.println("12.days&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp :");
                                out.println(day);
                                session.setAttribute("days",day);
                                
                                %></div>
                                
                     
                                <input class="submitb" type="submit" name="submit" value="confirm booking" />
                                </form><%
                                
                                
                                    
                        }
                            
                        catch(Exception e)
                        {
                                   out.println(e);
                        }
                           

                        %>
                   
                    
                  
                </div>
                 
                       
            </div>
        </div>
        
    </body>
</html>
