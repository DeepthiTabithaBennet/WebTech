<%-- 
    Document   : calc
    Created on : 16 Sep, 2022, 3:34:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="cyan" >
        <br>
    <center>
        <FONT color="red" size="7"> WELCOME TO BIG BAZAR BILL PAGE
        <br><br><br>
        YOUR BILL IS,
        <%
            String pn = request.getParameter("t1");
            String qnty = request.getParameter("t2");
            String pr = request.getParameter("t3");
            int q = Integer.parseInt(qnty);
            int price = Integer.parseInt(pr);
            int bill = price * q;
            if (bill > 1000) {
        %>
        <jsp:forward page="discount.jsp">
            <jsp:param name="bill" value="<%=bill%>"/>
        </jsp:forward>
        <%
            } else {
                out.println(bill);
            }
        %>
        </html>
