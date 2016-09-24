 

<%@page import="pack.User"%>
<%@page import="pack.Visitor"%>
<jsp:useBean id="c" scope="request" class="pack.Visitor">
    <jsp:setProperty name="c" property="*"/>
</jsp:useBean>

<%
    {
                  Visitor in=Visitor.getVisitor_email(c.getEmail());
                  if(in!=null){
                  c.setMsg("<h3 style=color:red>Visitor Already Registered</h3>");
                     }else{
                     User u = User.getUser(c.getUsername());
                     if(u!=null){
                       c.setMsg("<h3 style=color:red>Username Already Taken</h3>");
                     }else{
                          c.setUser_id(User.getMaxID());
                           if(c.insert()){
                              c.setMsg("<h3 style=color:white>Visitor Successfully Registered</h3>");
                               u=new User();
                               u.setLog("initial");
                               u.setNames(c.getNames());
                               u.setPassword(c.getPassword());
                               u.setUsername(c.getUsername());
                               u.setUser_status("unlocked");
                               u.setRole("visitor");
                               u.insert();
                           }else{
                              c.setMsg("<h3 style=color:red>System Failure! Try Again</h3>");
                           }
                     }
                  }

         
    }
%>
<jsp:forward page="Visitor_Form.jsp"/>