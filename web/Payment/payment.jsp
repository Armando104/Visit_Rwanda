 
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
 
<%@page import="pack.*"%>
<%@page import="pack.Service_Request"%>
<%@page import="pack.Service"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="pack.*"%>
 <%@page import="pack.*"%>
<%    
    User u = (User) session.getAttribute("v");
    if (u == null) {
%>
<jsp:forward page="index.jsp"/>
<%        }
    Visitor vs=Visitor.getVisitor_USER_ID(u.getUser_id()+"");
    System.out.println("Visitor ID:"+vs.getCitizen_id());
    
%>
<%
    String Name = vs.getNames();
    String tel = vs.getTel();
    String email = vs.getEmail();
    String date = new Date().toLocaleString();
    String Payment_Amount = "2";//session.getAttribute("amafrw").toString();
    session.setAttribute("Payment_Amount", Payment_Amount);

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    //Date date = new Date();
    SimpleDateFormat simpleDateformat = new SimpleDateFormat("dd/MM/yyyy");
 
//%>
 
 
      
<html>
    <head>
        <title>Service Online Payment </title>
        <link href="../style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="wrapper">
            <div id="inner">
                
                <!-- end header -->
                
              
                <div id="body">
                   
                    <div class="inner">
                        <form action='expresscheckout.jsp' METHOD='POST'>
                            <table align="center" style="color: #0099cc">
                                <tbody>
                                    <tr>
                                        <td colspan="3" style="text-align: center; font-size: 20px"><u>Payment Details</u></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center; font-size: 15px">
                                        ---------------------
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Visitor Name</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=Name%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Telephone</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=tel%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Email</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=email%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Movie Date</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=date%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Payment Amount</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=Payment_Amount + " USD"%></td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center; font-size: 15px">
                                        Paypal  <input type="radio" name="Visa" value="Visa" /> |
                                        Visa  <input type="radio" name="Paypal" value="Paypal" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center; font-size: 15px">---------------</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: center">
                                        <input type='image' name='submit' src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif' border='0' align='top' alt='Check out with PayPal'/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form><br><br><br><br>
                    </div>
                    <!-- end .inner -->
                </div>
                <!-- end body -->
                <div class="clear"></div>
               
                <!-- end footer -->
            </div>
            <!-- end inner -->
        </div>
        <!-- end wrapper -->
        <div align=center><a href='#'></a></div></body>
</html>


