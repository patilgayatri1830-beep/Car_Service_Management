<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>

<head>

<title>Manage Mechanics</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Mechanics Management</h1>

<table>

<tr>

<th>ID</th>

<th>Mechanic Name</th>

<th>Specialization</th>

<th>Experience</th>

<th>Mobile</th>

<th>Status</th>

</tr>

<tr>

<td>1</td>

<td>Rahul Patil</td>

<td>Engine Specialist</td>

<td>5 Years</td>

<td>9876543210</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>2</td>

<td>Amit Sharma</td>

<td>Brake Specialist</td>

<td>4 Years</td>

<td>9876543201</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>3</td>

<td>Rohit More</td>

<td>AC Specialist</td>

<td>6 Years</td>

<td>9876543222</td>

<td><span class="pending">Busy</span></td>

</tr>

<tr>

<td>4</td>

<td>Vijay Pawar</td>

<td>Electrical Work</td>

<td>3 Years</td>

<td>9876543233</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>5</td>

<td>Sachin Jadhav</td>

<td>Car Washing</td>

<td>2 Years</td>

<td>9876543244</td>

<td><span class="completed">Available</span></td>

</tr>

</table>

<br>

<a href="dashboard.jsp" class="back-btn">

Back Dashboard

</a>

</div>

</div>

</body>

</html>