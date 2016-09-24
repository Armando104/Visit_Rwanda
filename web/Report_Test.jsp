

<%@page import="pack.*"%>
<%@page import="java.util.List"%>
 
<%@page import="pack.DBClassConnector"%>
<%@page import="java.sql.*"%>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>
 
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>visit rwanda</title>
        <link rel="shortcut icon" HREF="imgs/icon.png" />
        <link rel="stylesheet" href="styless/bootstrap.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
        <link rel="stylesheet" href="styless/fonts.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
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
        <link href="Mycss/survey.css" rel="stylesheet" type="text/css" />

    </head>
    <div class="menu_nav">
        <ul>


            <!--     <li><a href="print.jsp"><span>print</span></a></li>-->

        </ul>
    </div>
    <body style="background:url(imgs/10.jpg) repeat-y center top">
        
    
    <%
      
        String quesname = ""; 
        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
       List<Instutition>l=Instutition.getList();
         
        for(int i=0;i<l.size();i++){
        {

            dataSet.setValue(Visit.getCount(l.get(i).getInstutition_id()+""),l.get(i).getName()+"", "");

            quesname = null;


        }
        }
        JFreeChart chart = null;
        BarRenderer renderer3D = null;
        CategoryPlot plot = null;


        final CategoryAxis3D categoryAxis = new CategoryAxis3D("Entity");
        final ValueAxis valueAxis = new NumberAxis3D("visits");
        renderer3D = new BarRenderer3D();

        plot = new CategoryPlot(dataSet, categoryAxis, valueAxis, renderer3D);
        plot.setOrientation(PlotOrientation.VERTICAL);
        chart = new JFreeChart(quesname, JFreeChart.DEFAULT_TITLE_FONT, plot, true);

        chart.setBackgroundPaint(new Color(255, 255, 255));

        try {
            final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
            // final File file1 = new File("3dbarchart.png");
            final File file1 = new File(config.getServletContext().getRealPath("/") + "chart\\1.png");
            ChartUtilities.saveChartAsPNG(file1, chart, 700, 600, info);

        } catch (Exception e) {
            out.println(e);
        }

    %>
    <center>
         <div id="s">
        <div id="ds" style="width: 1200px;height: auto;background-color: white;color: black;border: 1px #000 solid;box-shadow: rgba(0, 0, 0,  25) 0px 0px 20px;">
            <h3>How Entities has been visited</h3>
           
    <IMG SRC="chart/1.png" WIDTH="1000"  BORDER="0" USEMAP="#chart" style="height: 500px;width: 600px"/>
        </div>
         </div>
   
           <table border="0">

                        <tbody>
                            <tr>
                                 
                                <td><input type="button" value="Print" onclick="javascript:printDiv('s')" class="btn btn-warning" style="width: 1200px;"/></td>
                            </tr>
                        </tbody>
                    </table>   
 </center>
</body>
</html>