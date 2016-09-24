
<%
    int frw=(Integer)session.getAttribute("amafrw");
    frw +=Integer.parseInt(request.getParameter("frw"));
    
    System.out.println("FRW:"+frw);
    session.setAttribute("amafrw", frw);
    %>
    <jsp:forward page="Request_List.jsp"/>