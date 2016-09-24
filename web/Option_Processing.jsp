 
<%@page import="pack.*"%>
<jsp:useBean id="z" scope="request" class="pack.Service_Request"/>
<jsp:useBean id="c" scope="request" class="pack.Instutition"/>

<%

    String op = request.getParameter("op");
    String id = request.getParameter("idx");
    Service_Request ap = Service_Request.getService_Request_ID(id);
    if (ap.Update_Status(op, id)) {
        c.setMsg("<h3 style=color:green;>Request Successfully "+op+"</h3>");
    } else {
         c.setMsg("<h3 style=color:red;>Request Successfully "+op+"</h3>");
   
    }
    
%>
<jsp:forward page="Request_List_Entity.jsp"/>