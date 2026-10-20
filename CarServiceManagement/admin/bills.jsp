<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>
<head>
<title>Manage Bills</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Service Bills</h1>

<table>

<tr>

<th>Bill ID</th>

<th>Customer ID</th>

<th>Vehicle Number</th>

<th>Service</th>

<th>Booking Date</th>

<th>Status</th>

<th>Bill Amount</th>

<th>Action</th>

</tr>

<%

try
{
PreparedStatement ps=con.prepareStatement(
"SELECT * FROM booking WHERE status='Completed' ORDER BY booking_id DESC");

ResultSet rs=ps.executeQuery();

while(rs.next())
{
%>

<tr>

<td>BILL-<%=rs.getInt("booking_id")%></td>

<td><%=rs.getInt("customer_id")%></td>

<td><%=rs.getString("vehicle_number")%></td>

<td><%=rs.getString("service_name")%></td>

<td><%=rs.getString("booking_date")%></td>

<td>

<span class="completed">
Completed
</span>

</td>

<td>

Rs.2500

</td>

<td>

<a href="generateBill.jsp?id=<%=rs.getInt("booking_id")%>" class="btn-update">

View Bill

</a>

</td>

</tr>

<%
}
}
catch(Exception e)
{
out.println(e);
}
%>

</table>

<br>

<a href="dashboard.jsp" class="back-btn">

Back Dashboard

</a>

</div>

</div>

</body>

</html>