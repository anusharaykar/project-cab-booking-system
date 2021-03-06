<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><link rel="stylesheet" href="forgot.css">
    </head>
    <body>
        <div class="background">
                <div class="formbox">
        <form method="get" action="reset2.jsp">
         <input class="inputfield" placeholder="Enter otp" type="text" name="txtotp" value="" size="30" required />
         <input class="submitbutton" type="submit" value="SUBMIT" name="submit" /> <% int otp1=(Integer)session.getAttribute("otp1");out.println(otp1);%>
        </form>  </div></div>    
    </body>
</html>
