 

<%@page import="pack.User"%>
<%@page import="pack.*"%>
<jsp:useBean id="c" scope="request" class="pack.Domain">
    <jsp:setProperty name="c" property="*"/>
</jsp:useBean>

<%
    Domain dm=Domain.getDomainFromName(c.getName());
    if(dm==null)
      {
 

        if(c.insert()){
            c.setMsg("<h3 style=color:green>New Entity Domain  Successfully Registered</h3>");
            
        }else{
        c.setMsg("<h3 style=color:red>Domain Not Registered</h3>");
            
        } 
    }else{
     c.setMsg("<h3 style=color:red>Domain Already Registered</h3>");
       
    } 
%>
<jsp:forward page="Domains_List.jsp"/>