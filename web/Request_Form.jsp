<%@page import="pack.Service"%>
<%@page import="java.util.*"%>
<%@page import="pack.Domain"%>
<%@page import="pack.Instutition"%>
<!DOCTYPE html>
<%@page import="pack.*"%>
 <jsp:useBean id="dd" scope="request" class="pack.User"/>
<%    
    User u = (User) session.getAttribute("v");
    if (u == null) {
        dd.setMsg("<h3 style=color:yellow>Please Login Or Get Registered Before Requesting This Service</h3>");
%>
<jsp:forward page="LoginForm.jsp"/>
<%        }
     Visitor v=Visitor.getVisitor_USER_ID(u.getUser_id()+"");
    String h="";
    Calendar cal = new GregorianCalendar();
         
        int day, mon = (cal.get(Calendar.MONTH) + 1);
        String monn = "";
        day = cal.get(Calendar.DAY_OF_MONTH);
        String fdate;
        if (mon < 10) {
            monn = "0" + mon;
        }else{
         monn=mon+"";
        }
        if (day < 10) {
            fdate = cal.get(Calendar.YEAR) + "-" + monn + "-0" + cal.get(Calendar.DAY_OF_MONTH);

        } else {
            fdate = cal.get(Calendar.YEAR) + "-" + monn + "-" + cal.get(Calendar.DAY_OF_MONTH);

        }
       Instutition ns=Instutition.getInstutitionFromID(request.getParameter("id"));
    Visit vv=Visit.getVisitFromID_Date(v.getCitizen_id()+"", fdate, ns.getInstutition_id()+"");
     System.out.println(" Visitor id:"+v.getCitizen_id()+" Entity id:"+" "+ns.getInstutition_id()+" Date:"+fdate);
    if(vv==null){
       vv=new Visit();
       vv.setEntity_id(ns.getInstutition_id());
       vv.setVisitor_id(v.getCitizen_id());
       vv.insert();
    }
%>
<jsp:useBean id="c" scope="request" class="pack.Service_Request"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>visit rwanda</title>
        <link rel="shortcut icon" HREF="imgs/icon.png" />
        <link rel="stylesheet" href="styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <link rel="stylesheet" href="styless/fonts.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
          <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css">

    </head>
    <body style="background:url(imgs/10.jpg) repeat-y center top">
    <center>
        <div style="width: 960px;height: auto;background-color: white;border: 2px solid whitesmoke;box-shadow:0 0 36px #000;-moz-box-shadow:0 0 36px #000;-webkit-box-shadow:0 0 6px #000;">
            <div style="width: 960px;height: auto;background-color: white;margin-bottom: 4px;">
                <img src="imgs/top.png" width="960" height="100" alt="top"/>

            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <jsp:include page="Visitor_menus.jsp"/>
            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <img src="imgs/Copy of top.png" width="960" height="63" alt="Copy of top"/>

            </div>
            <div style="width: 960px;height: 420px;overflow-y: scroll;background-color: white;color:black;border-bottom: 4px solid #99FF00">

                <center> 
                                          
                                            <%
                                               String n=request.getParameter("ix");
                                               Service sr=Service.getPublic_ServiceFromID(n);
                                               Instutition in=Instutition.getInstutitionFromID(sr.getEntity_id()+"");
                                               
                                             %>
                                               <h2>Request Entity Services</h2>
                                            <h3>${c.msg}</h3>
                                            <form action="Request_Processing.jsp" method="GET">
                                                <table border="0">

                                                    <tbody>
                                                      
                                                        <tr>
                                                            <td>Requested Service</td>
                                                            <td><input style="background-color: #3d3d3d;color: white" type="text" name="name" value="<%=sr.getName() %>" readonly=""/></td>
                                                            <td><input type="hidden" name="service_id" value="<%=sr.getService_id() %>" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Service Delivered by</td>
                                                            <td><input style="background-color: #99FF00" type="text" name="name" value="<%=in.getName() %>" readonly=""/></td>
                                                            <td></td>
                                                        </tr>
                                                         <tr>
                                                            <td>Service Cost</td>
                                                            <td><input style="background-color: yellow" type="text" name="name" value="<%=sr.getCost()+"" %>" readonly=""/></td>
                                                            
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Requesting Date</td>
                                                            <td><input type="text" name="request_datev" value="" id="date"/></td>
                                                            <td></td>
                                                        </tr>
                                                         <tr>
                                                            <td>Details</td>
                                                            <td><textarea name="details" rows="4" cols="20">
                                                                </textarea></td>
                                                            <td></td>
                                                        </tr>


                                                        <tr>
                                                            <td></td>
                                                            <td><input type="submit" value="Submit" class="btn btn-success"/></td>
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
                        <br>
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
  <script src="development-bundle/jquery-1.4.4.js"></script>
        <script src="development-bundle/ui/jquery.ui.core.js"></script>
        <script src="development-bundle/ui/jquery.ui.datepicker.js"></script>
        <script>
			(function($){
				var pickerOpts = {
					changeMonth: true,
					changeYear: true,
					yearRange: "-25:+25"
				};
				
				$("#date").datepicker(pickerOpts);
			})(jQuery);
		</script>
</html>
