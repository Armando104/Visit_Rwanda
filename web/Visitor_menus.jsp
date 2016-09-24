<%@page import="pack.Service_Request"%>
<%@page import="pack.Service"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="pack.*"%>
 <%@page import="pack.*"%>
<%    
    User u = (User) session.getAttribute("v");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        }
    Visitor vs=Visitor.getVisitor_USER_ID(u.getUser_id()+"");
    System.out.println("Visitor ID:"+vs.getCitizen_id());
   int n=(Integer)session.getAttribute("amafrw");
   {
   //n=0;
   }
%>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	 
		<!-- Start css3menu.com HEAD section -->
	<link rel="stylesheet" href="Visitor_Menus_files/css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
	<!-- End css3menu.com HEAD section -->

	
</head>
<body style="background-color:#EBEBEB">
<!-- Start css3menu.com BODY section -->
<ul id="css3menu1" class="topmenu" style="background-color: #CCC">
    <li class="topmenu"><a href="Domains_List_Visitor.jsp" style="height:34px;line-height:34px;"><img src="Visitor_Menus_files/css3menu1/blue-globe1.png" alt=""/>Visit Different Entities</a></li>
<!--    <li class="topmenu"><a href="Visit_List_Visitor.jsp" style="height:34px;line-height:34px;"><img src="Visitor_Menus_files/css3menu1/blue-folder2.png" alt=""/>Your Visits</a></li>-->
        <li class="topmenu"><a href="Request_List.jsp" style="height:34px;line-height:34px;">Your Services Request</a></li>
        <li class="toplast"><a href="Client_Paid_Requests.jsp" style="height:34px;line-height:34px;">Your Payments</a></li>
        <li class="toplast"><a href="Logout.jsp" style="height:34px;line-height:34px;"><img src="Visitor_Menus_files/css3menu1/blue-standby.png" alt=""/>Logout</a></li>
</ul> 
</body>
</html>
