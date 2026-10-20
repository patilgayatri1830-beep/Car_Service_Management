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

<title>Manage Services</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Service Management</h1>

<table>

<tr>

<th>Service ID</th>

<th>Service Name</th>

<th>Estimated Price</th>

<th>Estimated Time</th>

<th>Status</th>

</tr>

<tr>

<td>1</td>

<td>Oil Change</td>

<td>Rs.800</td>

<td>1 Hour</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>2</td>

<td>Brake Service</td>

<td>Rs.1500</td>

<td>2 Hours</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>3</td>

<td>AC Service</td>

<td>Rs.2000</td>

<td>3 Hours</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>4</td>

<td>Engine Repair</td>

<td>Rs.5000</td>

<td>1 Day</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>5</td>

<td>Battery Check</td>

<td>Rs.500</td>

<td>30 Minutes</td>

<td><span class="completed">Available</span></td>

</tr>

<tr>

<td>6</td>

<td>Car Wash</td>

<td>Rs.600</td>

<td>45 Minutes</td>

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