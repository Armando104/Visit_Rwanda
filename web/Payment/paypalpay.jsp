 
<%@page import="pack.*"%>
<html>

<head>
<title></title>
</head>
<%
    String id=request.getParameter("xo");
    session.setAttribute("ji", id);
    Service_Request bk=Service_Request.getService_Request_ID(id);
    Visitor ob=Visitor.getVisitor_ID(bk.getVisit_id()+"");
    Service s=Service.getPublic_ServiceFromID(bk.getService_id()+"");
    int n=Service.getPublic_ServiceFromID(bk.getService_id()+"").getCost();
    Instutition in=Instutition.getInstutitionFromID(Service.getPublic_ServiceFromID(bk.getService_id()+"").getEntity_id()+"");
    System.out.println("AMOUNT TO BE PAID:"+n);
    System.out.println("REQUEST ID:"+id);
    %>
<body onload="document.forms['paypalForm'].submit();">
<form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST">
 <input type="hidden" name="cmd" value="_xclick" />
 <input type="hidden" name="business" value="onlineservicesp-facilitator@gmail.com" />
 <input type="hidden" name="password" value="4086611132" />
 <input type="hidden" name="custom" value="1123" />
 <input type="hidden" name="item_name" value="<%="Payment Of The Requested Service ["+s.getName()+"] Delivered By:,"+in.getName()+"" %>" />
 <input type="hidden" name="amount" value="<%=n %>"/>
 <input type="hidden" name="rm" value="1" />
 <input type="hidden" name="return" value="http://localhost:8084/VisitRwanda2015/Payment/paypalResponse.jsp" />
 <input type="hidden" name="cancel_return" value="http://localhost:8084/VisitRwanda2015/Payment/paypalResponseCancel.jsp" />
 <input type="hidden" name="cert_id" value="AFcWxV21C7fd0v3bYYYRCpSSRl31AFmVb3WBEd8arAej3DjdIpkN4p2R" />
</form>
</body>
</html>