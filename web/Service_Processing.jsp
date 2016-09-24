 

<%@page import="pack.User"%>
<%@page import="pack.*"%>
<%@page import="pack.*"%>
<%
    Instutition u = (Instutition) session.getAttribute("e");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        }
       
    
%>
<jsp:useBean id="c" scope="request" class="pack.Service">
    <jsp:setProperty name="c" property="*"/>
</jsp:useBean>

<%
    Service dm=Service.getPublic_ServiceFromName(c.getName());
    if(dm==null)
      {
 
        c.setEntity_id(u.getInstutition_id());
        if(c.insert()){
            c.setMsg("<h3 style=color:green>New Entity's Service  Successfully Added</h3>");
            
        }else{
        c.setMsg("<h3 style=color:red>Service Not Added</h3>");
            
        } 
    }else{
     c.setMsg("<h3 style=color:red>Service Already Added</h3>");
       
    } 
%>
<jsp:forward page="Service_Form.jsp"/>