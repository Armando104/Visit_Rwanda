<%@page import="java.util.List"%>
<%@page import="pack.Domain"%>
<%@page import="pack.Instutition"%>
<!DOCTYPE html>
<%@page import="pack.*"%>
<%
    Instutition u = (Instutition) session.getAttribute("e");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        }
       
    
%>
<jsp:useBean id="c" scope="request" class="pack.Instutition"/>
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
                <jsp:include page="Entity_Menus.html"/>
            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <img src="imgs/Copy of top.png" width="960" height="63" alt="Copy of top"/>

            </div>
<!--            <div style="width: 960px;height: auto;background-color: #CCC;margin-top: 1px ;color: white;border-bottom: 2px solid black;">
               
            </div>-->
            <div style="width: 960px;height: 400px;overflow-x:  scroll;background-color: white;color:black;border-bottom: 4px solid #99FF00">

                <center>  ${in.msg} 
                    <h3>Clients Services Requests Payments</h3>
                    <table border="1" class="" id="" style="width: 1700px">
                        <thead>
                            <tr>
                                <td style="background-color: #3d3d3d;color: white">No</td>
                                <td style="background-color: #3d3d3d;color: white">Client</td>
                                <td style="background-color: red;color: white">Submitted On</td>
                                <td style="background-color: red;color: white">Request Date</td>
                                <td style="background-color: #3d3d3d;color: white">Service</td>
                                 <td style="background-color: #3d3d3d;color: white">Cost</td>
                                <td style="background-color: #3d3d3d;color: white">Delivered By</td>
                                <td style="background-color: #3d3d3d;color: white">Details</td>
                                
                                <td style="background-color: green;color: white">Payment Date</td>
                                <td style="background-color: green;color: white">Paid Amount</td>
                                <td style="background-color: green;color: white">Print</td>
                                    
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Service_Request_Payment> l = Service_Request_Payment.getList();
                                int no = 1;
                                for (int i = 0; i < l.size(); i++) {
                                    Service_Request r=Service_Request.getService_Request_ID(l.get(i).getRequestId()+"");
                                    Service sr = Service.getPublic_ServiceFromID(r.getService_id() + "");
                                    Visitor vs=Visitor.getVisitor_ID(r.getVisit_id()+"");
                                    if(sr.getEntity_id()==u.getInstutition_id()){
                                    Instutition in = Instutition.getInstutitionFromID(sr.getEntity_id() + "");
                            %>
                            <tr>
                                <td><%=no%></td>
                                <td><%=vs.getNames() %></td>
                                <td><%=r.getSending_date()%></td> 
                                <td><%=r.getRequest_date()%></td>
                                  
                                <td><%=sr.getName()%></td>
                                <td><%="$"+sr.getCost()%></td>
                                <td><%=in.getName()%></td>
                                <td><%=r.getDetails()%></td>
                                 <td><%=l.get(i).getPaymentDate()%></td>
                                  <td><%="$"+l.get(i).getAmount()+""%></td>
                                  <td>
                                      <button class="btn btn-success">
                                          <a target="_blank" href="Payment/paypalResponse_1.jsp?ji=<%="" + l.get(i).getRequestId()+ ""%>" style="color: white">Print Receipt</a></td>
                                    
                                      </button>
                                     
                                        <%
                                      no++;  }
                                        
                                        %>
                                <%
//                                     }
//                                    }
                                     //no++;
                                    }
                                    %>
                                
                            </tr>
                            <%
                                   
                                %>
                        </tbody>
                    </table>
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
<script src="Dyanmic-data-table/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="Dyanmic-data-table/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="Dyanmic-data-table/js/DT_bootstrap.js"></script>
<script src="Dyanmic-data-table/js/dynamic-table.js"></script>
</html>
