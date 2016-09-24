
<%
    int frw=(Integer)session.getAttribute("amafrw");
    if(frw>=Integer.parseInt(request.getParameter("frw"))){
     frw -=Integer.parseInt(request.getParameter("frw"));
      session.setAttribute("amafrw", frw);
    }else{
     session.setAttribute("amafrw", 0);
    }
   
   
    System.out.println("FRW:"+frw);
    
    %>
    <jsp:forward page="Request_List.jsp"/>