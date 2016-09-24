 
<%@page import="pack.*"%>
<jsp:useBean id="dd" scope="request" class="pack.User">
    <jsp:setProperty name="dd" property="*" />
</jsp:useBean>

<%
    User u = User.getUser(dd.getUsername());
    if (u == null) {
        dd.setUsernamemsg("<h3 style=color:red>Invalid Username</h3>");
    } else {
        if (u.getPassword().equals(dd.getPassword())) {

 
         if (u.getRole().equalsIgnoreCase("receptionist")) {
                if (u.getUser_status().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("r", u);

%>
<jsp:forward page="Customers_List_2.jsp"/>
<%
        } else {
            dd.setMsg("<h2 style=color:red>Sorry! You have No Access To The System</h2>");
        }

    }
            if (u.getRole().equalsIgnoreCase("visitor")) {
                if (u.getUser_status().equalsIgnoreCase("unlocked")) {
                    session.setAttribute("v", u);
                    session.setAttribute("amafrw", 0);

%>
<jsp:forward page="Domains_List_Visitor.jsp"/>
<%
        } else {
            dd.setMsg("<h2 style=color:red>Sorry! You have No Access To The System</h2>");
        }

    }
    if (u.getRole().equalsIgnoreCase("admin")) {
        if (u.getUser_status().equalsIgnoreCase("unlocked")) {
            session.setAttribute("a", u);

%>
<jsp:forward page="Domains_List.jsp"/>
<%
        } else {
            dd.setMsg("<h2 style=color:red>Sorry! You have No Access To The System</h2>");
        }

    }
    if (u.getRole().equalsIgnoreCase("entity")) {
        if (u.getUser_status().equalsIgnoreCase("unlocked")) {
            Instutition tr = Instutition.getInstutitionFrom_UserID(u.getUser_id() + "");
            {
                //u.updateOnline();
                session.setAttribute("e", tr);

%>
<jsp:forward page="Service_List.jsp"/>

<%   }
        } else {
            dd.setMsg("<h2 style=color:red>Sorry! You have No Access To The System</h2>");
        }

    }

%>

<%

%>

<%
        } else {
            dd.setPasswordmsg("<h2 style=color:red>Invalid Password</h2>");
        }
    }


%>

<jsp:forward page="LoginForm.jsp"/>
