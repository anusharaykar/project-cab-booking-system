
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="addcab.css">
        <title>add cab Page</title>
    </head>
    <body>
        <div class="background">
            <div class="formbox">
                <div class="label">Enter Vehicle Details</div>
                <form method=get action="addcablogic2.jsp" class="input">
                    <input class="inputfield" placeholder="Enter DriverName" type="text" name="drivername" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter vehicle number" type="text" name="vehiclenumber" value="" size="10" required />
                    <input class="inputfield" placeholder="Enter vehicle name" type="text" name="vehiclename" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter Contact Number" type="text" name="contactnumber" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|pattern[0]?)?[789]\d{9}$" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter seat capacity" type="text" name="seatcapacity" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter rate per km " type="text" name="km" value="" size="30" required />
                    <input class="inputfield" placeholder="Enter pincode" type="number" name="pincode" value="" size="30" required />
     
                    <input class="submitbutton" type="submit" value="add" name="submit" />
                </form>
                
            </div>
        </div>
    </body>
</html>
