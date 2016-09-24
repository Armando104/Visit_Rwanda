<%@page import="java.util.List"%>
<%@page import="pack.Domain"%>
<%@page import="pack.Instutition"%>
<!DOCTYPE html>
<jsp:useBean id="c" scope="request" class="pack.Visitor"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>visit rwanda</title>
        <link rel="shortcut icon" HREF="imgs/icon.png" />
        <link rel="stylesheet" href="styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <link rel="stylesheet" href="styless/fonts.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>

    </head>
    <body style="background:url(imgs/10.jpg) repeat-y center top">
    <center>
        <div style="width: 960px;height: auto;background-color: white;border: 2px solid whitesmoke;box-shadow:0 0 36px #000;-moz-box-shadow:0 0 36px #000;-webkit-box-shadow:0 0 6px #000;">
            <div style="width: 960px;height: auto;background-color: white;margin-bottom: 4px;">
                <img src="imgs/top.png" width="960" height="100" alt="top"/>

            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <jsp:include page="Home_Menus.html"/>
            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <img src="imgs/Copy of top.png" width="960" height="63" alt="Copy of top"/>

            </div>
            <div style="width: 960px;height: auto;background-color: #00513a;color:white;border-bottom: 4px solid #99FF00">

                <center> 

                    ${c.msg} 
                    <form action="Visitor_Registration_Processing.jsp" method="GET">
                        <table border="0">

                            <tbody>
                                <tr>
                                    <td></td>
                                    <td><h3 style="color: white">New Visitor's Registration Form</h3></td>
                                    <td style="color: red;"></td>
                                </tr>
                                 
                                <tr>
                                    <td>Names</td>
                                    <td><input type="text" name="names" value="${c.names}" required="" /></td>
                                    <td style="color: red;"></td>
                                </tr>
                                 <tr>
                                    <td>Nationality</td>
                                    <td><input type="text" name="nationality" value="${c.nationality}" required=""/></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><input type="text" name="address" value="${c.address}" required=""/></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Telephone</td>
                                    <td><input type="text" name="tel" value="${c.tel}" required=""/></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" name="email" value="${c.email}" required=""/></td>
                                    <td style="color: red;"></td>
                                </tr>
                                <tr>
                                    <td>Profession</td>
                                    <td><input type="text" name="occupation" value="${c.occupation}" required=""/></td>
                                    <td style="color: red;"></td>
                                </tr>


                                <tr>
                                    <td>Username</td>
                                    <td><input type="text" name="username" value="${c.username}" required=""/></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><input type="password" name="password" value="${c.password}" required=""/></td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Submit" class="btn btn-success" style="height: 35px;"/></td>
                                    <td></td>
                                </tr>
                            </tbody>

                        </table>
                    </form>
                </center>
            </div>

            <div style="width:100%; height:150px; background-color: #3d3d3d; border-top:3px #99FF00 solid;">

                <div style="float:left; border:0px #99CC00 solid; width:70%; height:150px; color:#fff;">

                    <div style="float:left; border:0px #99CC00 solid; width:39%; height:100px; margin:30px;" id="footerlink">
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="www.visitrwanda24.com">Home</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="company.html">About Us</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="#">Advertise with US</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="contact.html">Contact Us</a></strong></p>
                    </div>

                    <div style="float:right; border:0px #99CC00 solid; width:49%; height:150px;">
                        <p style="margin-bottom:10px; font-size:24px; border-bottom:2px dotted #99FF00;">CONTACT US</p>
                        <p style="margin-bottom:5px; float:left; clear:both;"><strong>Tel:</strong>-</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>P.O.Box :</strong> 1880 Kigali-Rwanda</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>Email:</strong> info@visitrwanda24.com</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>Web:</strong><a href="wwww.visitrwanda24.com" style="color:#FFFFFF;"> www.visitrwanda24.com</a></p>
                    </div>

                </div>
                <div style="float:right; border:0px #99CC00 solid; width:29.5%; height:150px;"><a href="https://www.facebook.com/pages/visitrwanda24com/200722686802832?ref=hl"><img src="imgs/facebook_like_logo.gif" style="margin-top:25px; width:300px;" /></a>
                    <div style=" border:0px solid #990000; width:150px; height:20px; margin-top:13px; float:right; color:#FFFFCC; font-size:10px;" id="designer">Designed by Akili H.2015</div>
                </div>
            </div>
        </div>

    </center>
</body>
</html>
