<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user access Page</title>
        <link rel="stylesheet" href="useraccess.css">

    </head>
    <body>
            <div class="background">
              <div class="formbox">
                <div class="label">CHECK AVAILABILITY</div>
                 <div class="buttonbox">
                    <div id="btn"></div>
                    <button type="button" class="button" onclick="oneway()" >oneway</button>
                    <button type="button" class="button" onclick="local()">local</button>
                    <button type="button" class="button" onclick="outstation()">out station</button>
                </div>
                
                <form method=get action="availablecab.jsp" id="oneway" class="input" > <% String oneway="oneway";
                    session.setAttribute("msg",oneway);%>
                       
                    <input class="inputfield" placeholder="enter pick-up city name" type="text" name="pcity" value="" size="30" required />
                    <input class="inputfield" placeholder="enter pincode" type="number" name="pincode" required/>
                    <input class="inputfield" placeholder="enter drop-off city name" type="text" name="dcity" value="" size="30" required />
                    
                    <input class="inputfield" placeholder="enter seat capacity" type="number" id="sc1" name="sc" value="" size="30" required />
                     
                    <input class="submitbutton" type="submit" value="search cab" name="submit" onclick="clicked()"/>
                </form>
                
                <form method=get action="availablecab2.jsp" id="local" class="input"> <% String local="local";
                    session.setAttribute("msg",local);%>
                  <input class="inputfield" placeholder="enter pick-up city name" type="text" name="pcity" value="" size="30" required />
                   <input class="inputfield" placeholder="enter pincode" type="number"  name="pincode" required/>
                    <input class="inputfield" placeholder="enter drop-off city name" type="text" name="dcity" value="" size="30" required />
                    <input class="inputfield" placeholder="" type="date" name="tdate" value="" size="30" required />
                    <input class="inputfield" placeholder="" type="time" name="ptime" value="" size="30" required />
                    <input class="inputfield" placeholder="enter seat capacity" type="text" id="sc2" name="sc" value="" size="30" required />
                    <input class="submitbutton" type="submit" value="search cab" name="submit" onclick="clicked()" />  
                </form>
                <form method=get action="availablecab3.jsp" id="outstation" class="input"> <% String outstation="outstation";
                session.setAttribute("msg",outstation);%>

                    <input class="inputfield" placeholder="enter pick-up city name" type="text" name="pcity" value="" size="30" required />
                    <input class="inputfield" placeholder="enter pincode" type="number" name="pincode" required/>
                    <input class="inputfield" placeholder="enter drop-off city name" type="text" name="dcity" value="" size="30" required />
                    <input class="inputfield" placeholder="" type="date" name="tdate" value="" size="30" required />
                    <input class="inputfield" placeholder="" type="time" name="ptime" value="" size="30" required />
                    <input class="inputfield" placeholder="enter days" type="text" name="day" value="" size="30" required />
                    <input class="inputfield" placeholder="enter seat capacity" type="text" id="sc3" name="sc" value="" size="30" required />
                    <input class="submitbutton" type="submit" value="search cab" name="submit" onclick="clicked()" />
                </form>
           
        <script>
            var x= document.getElementById("oneway");
             var y= document.getElementById("local");
              var z= document.getElementById("outstation");
              var z1= document.getElementById("btn");
            
           function oneway(){
               x.style.left="50px";
               y.style.left="550px";
               z.style.left="510px";
               z1.style.left="0px";
           } 
                function local(){
               x.style.left="-500px";
               y.style.left="50px";
               z.style.left="550px";
               z1.style.left="80px";
           }
            function outstation(){
               x.style.left="-520px";
               y.style.left="-450px";
               z.style.left="50px";
               z1.style.left="175px";
           }
        </script>
            </div>
        </div> 
    </body>
</html>
