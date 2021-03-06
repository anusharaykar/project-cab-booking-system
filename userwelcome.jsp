<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="userwelcome.css">
        <title>first Page</title>
        <style>.hh{
            margin:10px;
            background-color:  orange;
            color: black;
            padding: 10px 20px;
            font-size: 10px;
            position: absolute;
            display: inline-block;
            border-radius: 2px;
            border: 2px solid black;
    
    }
        </style>
    </head>
    <body>
        <div class="background">
            <div class="formbox">
                <div class="buttonbox">
                   
                    <a href="about.jsp" target="_self"> <button type="button" class="button">ABOUT</button></a>
                    <a href="useraccess.jsp" target="_self"> <button type="button" class="button">SEARCH CAB</button></a>
                    <a href="usersviewbookings.jsp" target="_self"> <button type="button" class="button">MY BOOKINGS</button></a>
                    <a href="firstpage.jsp" target="_self"> <button type="button" class="button">LOGOUT</button></a>
                </div><div class="hh"> <a href="notify.jsp" class="notification"><span>messages</span></a>
                     
                    
                  
                </div>
                
            </div>
        </div>
    </body>
</html>
