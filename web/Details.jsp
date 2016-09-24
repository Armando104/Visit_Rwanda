<%@page import="java.util.List"%>
<%@page import="pack.Domain"%>
<%@page import="pack.Instutition"%>
        <link rel="shortcut icon" HREF="imgs/icon.png" />
        <link rel="stylesheet" href="styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <link rel="stylesheet" href="styless/fonts.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <body style="background:url(imgs/10.jpg) repeat-y center top">
            <center>
            <div style="width: 90%;border: 3px solid #000">
                 ${in.msg}
                    <%
                        Instutition in=Instutition.getInstutitionFromID(request.getParameter("id"));
                        %>
                        <h3><%="Entity Name:"+in.getName() %></h3>
                         <%
                                     if(in.getLogo()==null){
                                     %>
                                     <td><img src="Files/profile.png" width="100" height="70" alt="profile" style="margin-bottom: 5px;"/>
                                     </td>
                                     <%
                                     }else{
                                      %>
                                     <td><img src="Files/<%=in.getLogo()%>" width="100" height="70" alt="profile" style="margin-bottom: 5px;"/>
                                     </td>
                                     <%
                                     }
                                     
                                     %>
                                     <br>
                         <table border="1" class="table table-striped" id="sample_1" style="width: 100%">
                        <thead>
                             <tr>
                                 <th>No</th>
                                 <th>Acronym</th>
                                  <th>Domain</th>
                                 <th>Address</th>
                                 <th>Tel</th>
                                  <th>Email</th>
                                 <th>Reg,Date</th>
                             </tr>
                         </thead>
                         <tbody>
                             <%
                                 List<Instutition>l=Instutition.getList();
                                 int no=1;
                                 for(int i=0;i<l.size();i++){
                                     if(in.getInstutition_id()==l.get(i).getInstutition_id()){
                                     
                                     
                                 %>
                             <tr>
                                 <td><%=no %></td>
                                
                                  
                               
                                 <td><%=l.get(i).getAccronym()%></td>
                                 <td><%=Domain.getDomainFromID(l.get(i).getDomain_id()+"").getName()   %></td>
                                  <td><%=l.get(i).getAddress()%></td>
                                   <td><%=l.get(i).getTel()%></td>
                                    <td><%=l.get(i).getEmail()%></td>
                                     <td><%=l.get(i).getReg_date()%></td>
                             </tr>
                                 <% 
  no++;     
                                     }
}%>
                         </tbody>
                     </table>
    
            </div>
                       </center>
</body>
            