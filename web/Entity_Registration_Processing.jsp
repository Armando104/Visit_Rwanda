 

<%@page import="pack.User"%>
<%@page import="pack.Instutition"%>
<jsp:useBean id="c" scope="request" class="pack.Instutition">
    <jsp:setProperty name="c" property="*"/>
</jsp:useBean>

<%
    {
                  Instutition in=Instutition.getInstutitionFromName(c.getName());
                  if(in!=null){
                  c.setMsg("<h3 style=color:red>Institution Already Registered</h3>");
                     }else{
                     User u = User.getUser(c.getUsername());
                     if(u!=null){
                       c.setMsg("<h3 style=color:red>Username Already Taken</h3>");
                     }else{
                          session.setAttribute("c",c);
                          %>
                          <jsp:forward page="Logo_upload_Form.jsp"/>
                          <%
                     }
                  }

         
    }
%>
<jsp:forward page="Entity_Form.jsp"/>