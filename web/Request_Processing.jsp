 

<%@page import="pack.User"%>
<%@page import="pack.*"%>
<%@page import="pack.*"%>
<%    
    User u = (User) session.getAttribute("v");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        
    }
    Visitor vs=Visitor.getVisitor_USER_ID(u.getUser_id()+"");
%>
<jsp:useBean id="c" scope="request" class="pack.Service_Request">
    <jsp:setProperty name="c" property="*"/>
</jsp:useBean>

<%
    
          String p[]=c.getRequest_datev().split("/");
          c.setRequest_datev(p[2]+"-"+p[0]+"-"+p[1]);
        c.setVisit_id(vs.getCitizen_id());
        if(c.insert()){
            c.setMsg("<h3 style=color:green>Your Request has Successfully Submitted</h3>");
            
        }else{
        c.setMsg("<h3 style=color:red>Request Not Submitted</h3>");
            
        } 
    
  
%>
<jsp:forward page="Msg.jsp"/>