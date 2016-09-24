<%@page import="pack.Visit"%>
<%@page import="pack.Instutition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@page import="java.util.List"%>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%
             DefaultPieDataset data = new DefaultPieDataset();
             
          
            List<Instutition> l=Instutition.getList();
            for(int i=0;i<l.size();i++){
                System.out.println(Visit.getCount(l.get(i).getInstutition_id()+""));
                data.setValue(l.get(i).getName(), Visit.getCount(l.get(i).getInstutition_id()+""));
                //data.setValue(l.get(i).getName(), new Double(Visit.getCount(l.get(i).getInstutition_id()+""))); 
            }
            JFreeChart chart = ChartFactory.createPieChart("Pie Chart ", data, true, true, false);
            try {
                final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                ///final File file1 = new File("../");
                 final File file1 = new File(config.getServletContext().getRealPath("/") + "chart\\1.png");
               
                ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
                data=null;
            } catch (Exception e) {
                out.println(e);
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
             <IMG SRC="chart/1.png" WIDTH="600" HEIGHT="400"
         BORDER="0" USEMAP="#chart">
    </body>
</html> 