<%-- 
    Document   : index
    Created on : May 26, 2015, 2:14:31 PM
    Author     : Mugenzi
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.reservation"%>
<%@page import="model.customer"%>
<%@page import="model.seats"%>
<%@page import="model.movies"%>
<%@page import="model.Schedules"%>
<%
    String Name = "";
    String category = "";
    String title = "";
    String date = "";
    String Payment_Amount = "";
    session.setAttribute("Payment_Amount", Payment_Amount);

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    //Date date = new Date();
    SimpleDateFormat simpleDateformat = new SimpleDateFormat("dd/MM/yyyy");
    //String Date = simpleDateformat.format(date);
    reservation r = (reservation) session.getAttribute("reservation");
    if (r == null) {
        r = new reservation();
%>
<jsp:forward page="schedule_list.jsp"/>
<%
    } else {
        customer c = customer.getCust(r.getCustomer_id());
        if (c == null) {
            c = new customer();
        }
        seats s = seats.getSt(r.getSeat_id());
        if (s == null) {
            s = new seats();
        }
        Schedules sc = Schedules.getsc(r.getSchedule_id());
        if (sc == null) {
            sc = new Schedules();
        }
        movies m = movies.getMovie(sc.getMovie_id());
        if (m == null) {
            m = new movies();
        }

        Name = c.getFirstName() + " " + c.getLastName();
        category = s.getCategory();
        title = m.getTitle();
        date = simpleDateformat.format(sc.getDate()) + " @ " + sc.getHour();

        if (s.getSeat_id().equalsIgnoreCase("SEAT003")) {
            Payment_Amount = "7";
        }
        if (s.getSeat_id().equalsIgnoreCase("SEAT002")) {
            Payment_Amount = "10";
        }
        if (s.getSeat_id().equalsIgnoreCase("SEAT001")) {
            Payment_Amount = "15";
        }
        session.setAttribute("Payment_Amount", Payment_Amount);
    }
%>        
<html>
    <head>
        <title>Online Movie Store</title>
        <link href="../style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="wrapper">
            <div id="inner">
                <div id="header">
                    <h1><img src="../images/logo.gif" width="519" height="63" alt="Online Movie Store" /></h1>
                    <div id="nav"> 
                        <a href="#">HOME</a> | <a href="#">view cart</a> | <a href="#">help</a> </div>
                    <!-- end nav -->
                    <a href="#">
                        <img src="../images/header_1.jpg" width="744" height="145" alt="Harry Potter cd" />
                    </a> 
                    <a href="#">
                        <img src="../images/header_2.jpg" width="745" height="48" alt="" />
                    </a> 
                </div>
                <!-- end header -->
                <dl id="browse">
                    <dt>Full Category Lists</dt>
                    <dd class="first"><a href="#">Action &amp; Adventure</a></dd>
                    <dd><a href="#">Anime &amp; Manga</a></dd>
                    <dd><a href="#">Art House &amp; International</a></dd>
                    <dd><a href="#">Classics</a></dd>
                    <dd><a href="#">Comedy</a></dd>
                    <dd><a href="#">Cult Movies</a></dd>
                    <dd><a href="#">Drama</a></dd>
                    <dd><a href="#">New &amp; Future Releases</a></dd>
                    <dd><a href="#">Horror</a></dd>
                    <dd><a href="#">Musicals</a></dd>
                    <dd><a href="#">Mystery &amp; Suspense</a></dd>
                    <dd><a href="#">Science Fiction &amp; Fantasy</a></dd>
                    <dd class="last"><a href="#">Westerns</a></dd>
                    <dt>Search Your Favourite Movie</dt>
                    <dd class="searchform">
                        <form action="#" method="get">
                            <div>
                                <select name="cat">
                                    <option value="-" selected="selected">CATEGORIES</option>
                                    <option value="-">------------</option>
                                </select>
                            </div>
                            <div>
                                <input name="q" type="text" value="DVD TITLE" class="text" />
                            </div>
                            <div class="softright">
                                <input type="image" src="../images/btn_search.gif" />
                            </div>
                        </form>
                    </dd>
                </dl>
                <div id="body" style="background: #0099cc">
                    <p style="text-align: center; color: #e5e5e5; font-size: 15px">
                        Customer home | Welcome <%out.print("");%>
                    </p>
                </div>
                <div id="body">
                    <jsp:include page="../customer_menu.jsp"/>
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
                                    <td style="font-size: 15px"><u>Customer Name</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=Name%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Seat category</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=category%></td>
                                </tr>
                                <tr>
                                    <td style="font-size: 15px"><u>Movie Title</u>:</td>
                                <td></td>
                                <td style="font-size: 15px"><%=title%></td>
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
                <div id="footer"> Design by <a href="#">Mwema Ruth</a> &nbsp;
                    <div id="footnav"> <a href="#">Legal</a> | <a href="#">Home</a> </div>
                    <!-- end footnav -->
                </div>
                <!-- end footer -->
            </div>
            <!-- end inner -->
        </div>
        <!-- end wrapper -->
        <div align=center><a href='#'></a></div></body>
</html>


