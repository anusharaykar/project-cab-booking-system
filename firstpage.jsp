<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="firstpage.css">
        <title>user Page</title>
   
    </head>
    <body>
        <div class="background">
            <div class="text1">BOOKIT</div>s
            
           
            <div class="formbox">
                
                <div class="buttonbox">
                    <div id="btn"></div>
                    <button type="button" class="button" onclick="login()" >Login</button>
                    <button type="button" class="button" onclick="register()">Register</button>
                </div>
                <form method=get action="loginlogic.jsp" id="login" class="input">
                
                    <input class="inputfield" placeholder="Enter  mobile number" type="text" name="number" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter Password" type="password" name="password" value="" size="30" required />
                    <input class="submitbutton" type="submit" value="LogIn" name="submit" />
                    <div class="href1"><a href="forgot.jsp">forgot password?</a></div>
                                     </form>
               
                <form method=get action="registerlogic.jsp" id="register" class="input">
                    <input class="inputfield" placeholder="Enter Username" type="text" name="username" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter mobile number" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|pattern[0]?)?[789]\d{9}$" type="text" name="mobilenumber" value="" size="10" required />
                    <input class="inputfield" placeholder="Enter email-id(optional)" type="email" name="email" value="" size="30">
                    <input class="inputfield" placeholder="Enter Password"  type="password" name="password" value="" size="30" required />
                    <input class="inputfield" placeholder="Confirm password" type="password" name="password2" value="" size="30" required />
                    <input class="submitbutton" type="submit" value="Register" name="submit" />
                    </form>
            </div>
        </div>
        <script>
            var x= document.getElementById("login");
             var y= document.getElementById("register");
              var z= document.getElementById("btn")
            
           function register(){
               x.style.left="-400px";
               y.style.left="50px";
               z.style.left="110px";
           } 
                function login(){
               x.style.left="50px";
               y.style.left="450px";
               z.style.left="0";
           }
        </script>
    </body>
</html>
