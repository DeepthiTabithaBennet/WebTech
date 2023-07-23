<%-- UPDATE.JSP --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
if (request.getParameter("submit") != null) {
String id = request.getParameter("id");
String name = request.getParameter("sname");
String course = request.getParameter("course");
String fee = request.getParameter("fee");
Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system",
"manager");
pst = con.prepareStatement("update records set s_name = ?,courses =?,fees= ?where id = ?");
pst.setString(1, name);
pst.setString(2, course);
pst.setString(3, fee);
pst.setString(4, id);
pst.executeUpdate();
%>
<script>
alert("Record Updated Successfully!");
</script>
<% } %>
<!DOCTYPE html>
<html>
<head> </head>
<body>
<h1>Student Update</h1>
<form method="POST" action="#" >
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
"system", "manager");
String id = request.getParameter("id");
pst = con.prepareStatement("select * from records where id = ?");

pst.setString(1, id);
rs = pst.executeQuery();
while (rs.next()) {
%>
Student Name <br>
<input type="text" placeholder="Student Name" value="<%=rs.getString("s_name")%>" name="sname" id="sname" required >

<br>
Course <br>
<input type="text" placeholder="Course" name="course" value="<%=rs.getString("courses")%>" id="course" required >

<br>
Fee <br>
<input type="text" placeholder="Fee" name="fee" id="fee" value="<%=rs.getString("fees")%>" required >

<br>
<% } %>
<br> <br>
<input type="submit" id="submit" value="submit" name="submit">
<input type="reset" id="reset" value="reset" name="reset">
<p><a href="index.jsp">Click Back</a></p>
</form>
</body>
</html>