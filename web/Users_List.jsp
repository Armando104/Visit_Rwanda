<%@page import="pack.User"%>
<%@page import="java.util.List"%>
<%@page import="pack.Domain"%>
<%@page import="pack.Instutition"%>
<!DOCTYPE html>
<%@page import="pack.*"%>
<%
    User u = (User) session.getAttribute("a");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        }
       
    
%>
<jsp:useBean id="c" scope="request" class="pack.Instutition"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>visit rwanda</title>
        <link rel="shortcut icon" HREF="imgs/icon.png" />
        <link rel="stylesheet" href="styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <link rel="stylesheet" href="styless/fonts.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>

    </head>
    <body style="background:url(imgs/10.jpg) repeat-y center top">
    <center>
        <div style="width: 960px;height: auto;background-color: white;border: 2px solid whitesmoke;box-shadow:0 0 36px #000;-moz-box-shadow:0 0 36px #000;-webkit-box-shadow:0 0 6px #000;">
            <div style="width: 960px;height: auto;background-color: white;margin-bottom: 4px;">
                <img src="imgs/top.png" width="960" height="100" alt="top"/>

            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <jsp:include page="Admin_Menus.html"/>
            </div>
            <div style="width: 960px;height: auto;background-color: white;">
                <img src="imgs/Copy of top.png" width="960" height="63" alt="Copy of top"/>

            </div>
            <div style="width: 960px;height: 400px;overflow-y:  scroll;background-color: white;color:black;border-bottom: 4px solid #99FF00">

                <center>  ${in.msg} 
                    <b> <h3><a href="Visitors_List.jsp">Click Here To View Visitors List</a></h3></b>
                    <b> <h3>Users List</h3></b>
                         <table border="1" class="table table-hover" id="sample_1" style="">
                        <thead>
                             <tr>
                                 <td style="background-color: #3d3d3d;color: white">No</td>
                                  <td style="background-color: #3d3d3d;color: white">Names</td>
                                  <td style="background-color: #3d3d3d;color: white">Username</td>
                                
                                 <td style="background-color: #3d3d3d;color: white">Right</td>
                                   <td style="background-color: #3d3d3d;color: white">Status</td>
                              <td style="background-color: #3d3d3d;color: white">Option</td>
                            
                            
                             </tr>
                         </thead>
                         <tbody>
                             <%
                                 List<User>l=User.getUserList();
                                 int no=1;
                                 for(int i=0;i<l.size();i++){
                                      if(l.get(i).getRole().equalsIgnoreCase("entity")|| (l.get(i).getRole().equalsIgnoreCase("admin"))){
                                 if(l.get(i).getUser_status().equalsIgnoreCase("locked")){    
                             %>
                             <tr style="background-color: #ff6633;color: black">
                                 <td><%=no %></td>
                                 
                                 <td><%=l.get(i).getNames()%></td>
                                 <td><%=l.get(i).getUsername()%></td>
                                  <td><%=l.get(i).getRole()%></td>
                                  <%
                                     if(l.get(i).getRole().equalsIgnoreCase("visitor")){
                                         %>
                                         <td style="background-color: green;color: white"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %>
                                     <%
                                     if(l.get(i).getRole().equalsIgnoreCase("admin")){
                                         %>
                                         <td style="background-color: yellow;color: black"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %><%
                                     if(l.get(i).getRole().equalsIgnoreCase("entity")){
                                         %>
                                         <td style="background-color: #002118;color: white"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %>
                                      <td><a href="Lock_User.jsp?op=unlocked&un=<%=l.get(i).getUsername()%>" style="color: black">Unlock User</a></td>
                                 
                             </tr>
                                 <% 
       
                                 }else{
                                 
                                 %>
                             <tr style="background-color: #99CC00;color: black">
                                 <td><%=no %></td>
                                 
                                 <td><%=l.get(i).getNames()%></td>
                                 <td><%=l.get(i).getUsername()%></td>
                                  <td><%=l.get(i).getRole()%></td>
                                  <%
                                     if(l.get(i).getRole().equalsIgnoreCase("visitor")){
                                         %>
                                         <td style="background-color: green;color: white"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %>
                                     <%
                                     if(l.get(i).getRole().equalsIgnoreCase("admin")){
                                         %>
                                         <td style="background-color: yellow;color: black"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %><%
                                     if(l.get(i).getRole().equalsIgnoreCase("entity")){
                                         %>
                                         <td style="background-color: #002118;color: white"><%=l.get(i).getUser_status()%></td>
                                         
                                         <%
                                     }
                                     %>
                                  
                                  <td><a href="Lock_User.jsp?op=locked&un=<%=l.get(i).getUsername()%>" style="color: black">Lock User</a></td>
                                      
                             </tr>
                                 <% 
                                 }}
                                 no++;  
}%>
                         </tbody>
                     </table>
    </center>
            </div>

            <div style="width:100%; height:150px; background-color: #3d3d3d; border-top:3px #99FF00 solid;">

                <div style="float:left; border:0px #99CC00 solid; width:70%; height:150px; color:#fff;">

                    <div style="float:left; border:0px #99CC00 solid; width:39%; height:100px; margin:30px;" id="footerlink">
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="www.visitrwanda24.com">Home</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="company.html">About Us</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="#">Advertise with US</a></strong></p>
                        <p style="margin-bottom:5px; float:left; clear:both;color: white"><strong><a href="contact.html">Contact Us</a></strong></p>
                    </div>

                    <div style="float:right; border:0px #99CC00 solid; width:49%; height:150px;">
                        <br>
                        <p style="margin-bottom:10px; font-size:24px; border-bottom:2px dotted #99FF00;">CONTACT US</p>
                        <p style="margin-bottom:5px; float:left; clear:both;"><strong>Tel:</strong>-</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>P.O.Box :</strong> 1880 Kigali-Rwanda</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>Email:</strong> info@visitrwanda24.com</p>
                        <p style="margin-bottom:5px;float:left; clear:both;"><strong>Web:</strong><a href="wwww.visitrwanda24.com" style="color:#FFFFFF;"> www.visitrwanda24.com</a></p>
                    </div>

                </div>
                <div style="float:right; border:0px #99CC00 solid; width:29.5%; height:150px;"><a href="https://www.facebook.com/pages/visitrwanda24com/200722686802832?ref=hl"><img src="imgs/facebook_like_logo.gif" style="margin-top:25px; width:300px;" /></a>
                    <div style=" border:0px solid #990000; width:150px; height:20px; margin-top:13px; float:right; color:#FFFFCC; font-size:10px;" id="designer">Designed by Akili H.2015</div>
                </div>
            </div>
        </div>

    </center>
</body>
  <script src="Dyanmic-data-table/js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="Dyanmic-data-table/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="Dyanmic-data-table/js/DT_bootstrap.js"></script>
        <script src="Dyanmic-data-table/js/dynamic-table.js"></script>
</html>
