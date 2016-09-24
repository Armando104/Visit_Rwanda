
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="pack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Receipt</title>
        <link rel="stylesheet" href="../styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
	
        <script language="javascript" type="text/javascript">
            function printDiv(divID) {
                //Get the HTML of div
                var divElements = document.getElementById(divID).innerHTML;
                //Get the HTML of whole page
                var oldPage = document.body.innerHTML;

                //Reset the page's HTML with div's HTML only
                document.body.innerHTML =
                        "<html><head><title></title></head><body><center>" +
                        divElements + "</center></body>";

                //Print Page
                window.print();

                //Restore orignal HTML
                document.body.innerHTML = oldPage;


            }
        </script>
        <style>
            p{
                text-align: left;
            }
        </style>
    </head>
    <body>
    <center>
        <%

             Service_Request bk = Service_Request.getService_Request_ID(request.getParameter("ji").toString());
            Visitor cl = Visitor.getVisitor_ID(bk.getVisit_id() + "");
            Service s = Service.getPublic_ServiceFromID(bk.getService_id() + "");
            int n = Service.getPublic_ServiceFromID(bk.getService_id() + "").getCost();
            Instutition in = Instutition.getInstutitionFromID(Service.getPublic_ServiceFromID(bk.getService_id() + "").getEntity_id() + "");


            Service_Request_Payment p = new Service_Request_Payment();
            p.setAmount(n);
            p.setRequestId(bk.getRequest_id());
            p.setPaymentDate(new Date());
            //System.out.println("PAYMENT INSERT:" + p.insert());
            System.out.println("PAYMENT UPDATE:" + bk.Update_Status("paid", bk.getRequest_id() + ""));


        %>
        <div id="s">
            <div id="ds" style="width: 230px;height: auto;background-color: #009966;color: white;border: 0px #000 solid;box-shadow: rgba(0, 0, 0,  25) 0px 0px 20px;float: left">
                <u><h3>Visit Rwanda Ltd</h3></u>
                <h6>Service Request Payment Receipt</h6>
                <hr>

                <p><%="Dear," + cl.getNames() + " Your Payment Has Been Accepted Successfully"%></p>
                <hr>
                <b><p>SERVICE INFORMATION</p></b>
                <p><%="Service Title:" +s.getName()  %></p>
                <p><%="Service Cost:$" + s.getCost()+""%></p>
                <p><%="Service Description:" + s.getDescription()%></p>
                <p><%="Service Duration" + s.getDuration()%></p>
                 <p><%="Delivered By:" +in.getName()  %></p>
                <hr>
                <b> <p>YOUR REQUEST INFORMATION</p></b>
                <p><%="Requesting Date:" + bk.getRequest_date()+ ""%></p>
                <p><%="Submittion Date:" + bk.getSending_date()%></p>
                <p><%="Other Details:" +bk.getDetails()  %></h3>
                <p><%="Service Request Status:" +bk.getRequest_status()%></p>
                <hr>
                <b> <p>PAYMENT INFORMATION</p>
                    <p><%="Amount Paid: $" + p.getAmount() + ""%></p>
                 </div>
        </div>
                 <br><br>
        <table border="0">

            <tbody>
                <tr>

                    <td><input type="button" value="Print" onclick="javascript:printDiv('s')" class="btn btn-success" style=""/></td>
                </tr>
            </tbody>
        </table>  
    </center>
</body>
</html>
