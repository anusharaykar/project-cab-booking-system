<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
        <link href="confirmcancel.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <div class="background">
            <div class="formbox">
                <div class="buttonbox">
                    <form method=get action="bookingslogic.jsp">
                        <DIV class="TEXT"> Enter your Mobile number:</div><input type="text" class="textarea" name="number" required/>
                                                                           <input class="inputfield" type="submit" value="submit"><%
                                                                               String mn=(String)session.getAttribute("mn");
                              
                                %>
                                
                     
                                
                                
                                
                                    
                        
                           

                        
                   
                    
                  
                </div>
                 
                       
            </div>
        </div>
        
    </body>
</html>
