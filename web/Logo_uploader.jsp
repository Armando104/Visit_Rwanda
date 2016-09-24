


<%@page import="pack.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<jsp:useBean id="c" scope="request" class="pack.Instutition"/>


<%

    Instutition cr = (Instutition) session.getAttribute("c");
    System.out.println("Instutition:" + cr);

    Instutition ins = Instutition.getInstutitionFromName(cr.getName());
    if (ins != null) {
        c.setMsg("<h3 style=color:red;>Your Entity already has registered</h3>");
    } else {
        User u = User.getUser(c.getUsername());
        if (u != null) {
            c.setMsg("<h3 style=color:red;>Username already taken</h3>");
        } else {
            String contentType = request.getContentType();
            System.out.println("Content type is :: " + contentType);
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();

                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }

                String file = new String(dataBytes);
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

//User u=(User)session.getAttribute("x");
//products pp=(products)session.getAttribute("product");

//pp.setImage(saveFile);
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
//out.println(boundary);
                int pos;
                pos = file.indexOf("filename=\"");

                pos = file.indexOf("\n", pos) + 1;

                pos = file.indexOf("\n", pos) + 1;

                pos = file.indexOf("\n", pos) + 1;


                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

//FileOutputStreamfileOut = new FileOutputStream(saveFile);


                File fdest = new File("C:\\Users\\ARMAND\\Desktop\\Armand - Copy\\VisitRwanda2015\\web\\Files");
                if (fdest.exists()) {
                } else {
                    fdest.mkdir();
                }





                FileOutputStream fileOut1 = new FileOutputStream(fdest + "\\" + cr.getInstutition_id() + "!" + saveFile);

//fileOut.write(dataBytes);
                fileOut1.write(dataBytes, startPos, (endPos - startPos));
                fileOut1.flush();
                fileOut1.close();
                cr.setLogo(cr.getInstutition_id() + "!" + saveFile);
                System.out.println(">>>>>Instutition FILE:>>> " + cr.getInstutition_id());
                session.setAttribute("c", cr);
                cr.setUser_id(User.getMaxID());
                if (cr.insert()) {
                    c.setMsg("<h3 style=color:white;>Thank!Your Entity has been successfully registered</h3>");
                    u=new User();
                    u.setLog("initial");
                    u.setNames(cr.getName());
                    u.setUser_status("unlocked");
                    u.setRole("entity");
                    u.setUsername(cr.getUsername());
                    u.setPassword(cr.getPassword());
                    u.insert();
                } else {

                    c.setMsg("<h3 style=color:red;>Your Entity has not registered</h3>");

                }

            }
        }
    }




%>
<jsp:forward page="Entity_Form.jsp"/>


