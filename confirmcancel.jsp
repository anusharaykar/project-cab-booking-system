<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>confirm booking Page</title>'
        <link href="confirmcancel.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <div class="background">
            <div class="formbox">
                <div class="buttonbox">
                    <form method=get action="cancelled.jsp">
                        <DIV class="TEXT"> REASON:</div><input type="text" class="textarea" rows="4" cols='8'  name="txtarea" required/>
                                                                           <input class="inputfield" type="submit" value="submit"><%
                                                                               String mn=(String)session.getAttribute("mn");
                                                                               String bn=request.getParameter("bn");
                                                                               
                                                                               session.setAttribute("bn",bn);
                               
                                %>
                                
                                
                                
                                
                                    
                        
                           

                        
                   
                    
                  
                </div>
                 
                       
            </div>
        </div>
        
    </body>
</html>
