
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
    </head>
    <body>
    <center>
        <%

                  Service_Request bk = Service_Request.getService_Request_ID(session.getAttribute("ji").toString());
            Visitor cl = Visitor.getVisitor_ID(bk.getVisit_id() + "");
            Service s = Service.getPublic_ServiceFromID(bk.getService_id() + "");
            int n = Service.getPublic_ServiceFromID(bk.getService_id() + "").getCost();
            Instutition in = Instutition.getInstutitionFromID(Service.getPublic_ServiceFromID(bk.getService_id() + "").getEntity_id() + "");


            Service_Request_Payment p = new Service_Request_Payment();
            p.setAmount(n);
            p.setRequestId(bk.getRequest_id());
            p.setPaymentDate(new Date());
            System.out.println("PAYMENT INSERT:" + p.insert());
            System.out.println("PAYMENT UPDATE:" + bk.Update_Status("paid", bk.getRequest_id() + ""));


        %>
        <div id="s">
            <div id="ds" style="width: 800px;height: auto;background-color: #009966;color: white;border: 1px #000 solid;box-shadow: rgba(0, 0, 0,  25) 0px 0px 20px;">
                <h1>Visit Rwanda Ltd</h1>
                <h2>Service Request Payment Receipt</h2>
                <hr>

                <h3><%="Dear," + cl.getNames() + " Your Payment Has Been Accepted Successfully"%></h3>
                <b><h3>REQUESTED SERVICE INFORMATION</h3></b>
                <h3><%="Service Title:" +s.getName()  %></h3>
                <h3><%="Service Cost:$" + s.getCost()+""%></h3>
                <h3><%="Service Description:" + s.getDescription()%></h3>
                <h3><%="Service Duration" + s.getDuration()%></h3>
                 <h3><%="Delivered By:" +in.getName()  %></h3>
                <hr>
                <b> <h3>YOUR REQUEST INFORMATION</h3></b>
                <h3><%="Requesting Date:" + bk.getRequest_date()+ ""%></h3>
                <h3><%="Submittion Date:" + bk.getSending_date()%></h3>
                <h3><%="Other Details:" +bk.getDetails()  %></h3>
                <h3><%="Service Request Status:" +bk.getRequest_status()%></h3>
                <hr>
                <b> <h3>PAYMENT INFORMATION</h3>
                    <h3><%="Amount Paid: $" + p.getAmount() + ""%></h3>
                 </div>
        </div>
        <table border="0">

            <tbody>
                <tr>

                    <td><input type="button" value="Print" onclick="javascript:printDiv('s')" class="btn btn-warning" style="width: 800px;"/></td>
                </tr>
            </tbody>
        </table>  
    </center>
</body>
</html>
