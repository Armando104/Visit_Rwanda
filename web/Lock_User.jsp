
<%@page import="pack.User"%>
<jsp:useBean id="st" scope="request" class="pack.User"/>
<%
    String op=request.getParameter("op");
     String un=request.getParameter("un");
    
    User u=User.getUser(un);
    u.setUser_status(op);
    st.setMsg("<h2>Information Successfully Submitted</h2>");
    u.UnlockUser(op);
    
 %>
 <jsp:forward page="Users_List.jsp"/>
 