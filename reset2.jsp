<%-- 
    Document   : reset2
    Created on : 22 Mar, 2020, 7:06:10 AM
    Author     : gurudatth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><link rel="stylesheet" href="forgot1.css">
    </head>
    
    <body><div class="background">
                <div class="formbox">
        <%   
            int ran=((Integer)session.getAttribute("otp1"));
            
            int ran2=Integer.parseInt(request.getParameter("txtotp"));
            if(ran==ran2)
            {
            %><form method="get" action="reset3.jsp"><input class="inputfield" placeholder="Enter new password" type="password" name="txtpass1" value="" size="30" required />
      <input class="inputfield" placeholder="confirmpassword" type="password" name="txtpass2" value="" size="30" required />
      
            <input class="submitbutton" type="submit" value="RESET" name="submit" />
          </form>
            <%
                }
                else
                {
            %><script> window.alert("invalid otp");
                window.history.back();</script><%        
                

}
            %>
                </div></div>  </body>
</html>
