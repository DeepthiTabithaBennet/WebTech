<%-- INDEX.JSP --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
if (request.getParameter("submit") != null) {
String name = request.getParameter("sname");
String course = request.getParameter("course");
String fee = request.getParameter("fee");
Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system",
"manager");
pst = con.prepareStatement("insert into records(s_name,courses,fees)values(?,?,?)");
pst.setString(1, name);
pst.setString(2, course);
pst.setString(3, fee);
pst.executeUpdate();
}
%>
<!DOCTYPE html>
<html>
<head> </head>
<body>
<h1>Student Management System</h1>
<br>
<form method="POST" action="#" >
Student Name <br>
<input type="text" placeholder="Student Name" name="sname" id="sname"
required >
<br>
Course <br>
<input type="text" placeholder="Course" name="course" id="course" required >
<br>
Fee <br>
<input type="text" placeholder="Fee" name="fee" id="fee" required >

<br> <br>
<input type="submit" id="submit" value="submit" name="submit">
<input type="reset" id="reset" value="reset" name="reset">
</form>
<br> <br> <br>
<table id="tbl-student" width="100%">
<tr>
<th>Id</th>
<th>Student Name</th>
<th>Course</th>
<th>Fee</th>
<th>Edit</th>
<th>Delete</th>
</tr>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
"system", "manager");
String query = "select * from records";
Statement st = con.createStatement();
rs = st.executeQuery(query);
while (rs.next()) {
String id = rs.getString("id");
%>
<tr>
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("s_name")%></td>
<td><%=rs.getString("courses")%></td>
<td><%=rs.getString("fees")%></td>
<td><a href="update.jsp?id=<%=id%>">Edit</a></td>
<td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
</tr>
<% } %>
</table>
</body>
</html>