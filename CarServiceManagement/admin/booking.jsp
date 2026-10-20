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

<title>Manage Bookings</title>

<link rel="stylesheet" href="../css/style.css">

<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Customer Service Bookings</h1>

<table>

<tr>

<th>ID</th>

<th>Customer</th>

<th>Vehicle No</th>

<th>Model</th>

<th>Service</th>

<th>Date</th>

<th>Problem</th>

<th>Status</th>

<th>Action</th>

<th>Assign Mechanic</th>

</tr>

<%

try{

PreparedStatement ps=con.prepareStatement(

"SELECT * FROM booking ORDER BY booking_id DESC");

ResultSet rs=ps.executeQuery();

while(rs.next())
{

String status=rs.getString("status");

%>

<tr>

<td>#<%=rs.getInt("booking_id")%></td>

<td><%=rs.getInt("customer_id")%></td>

<td><%=rs.getString("vehicle_number")%></td>

<td><%=rs.getString("vehicle_model")%></td>

<td><%=rs.getString("service_name")%></td>

<td><%=rs.getString("booking_date")%></td>

<td><%=rs.getString("problem")%></td>

<td>

<form action="assignMechanic.jsp" method="post">

<input type="hidden"
name="booking_id"
value="<%=rs.getInt("booking_id")%>">

<select name="mechanic_id">

<%
PreparedStatement ps2=con.prepareStatement(
"SELECT mechanic_id,full_name FROM mechanic");

ResultSet rs2=ps2.executeQuery();

while(rs2.next())
{
%>

<option value="<%=rs2.getInt("mechanic_id")%>">

<%=rs2.getString("full_name")%>

</option>

<%
}
%>

</select>

<button type="submit">

Assign

</button>

</form>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending"))
{

%>

<span class="pending">Pending</span>

<%

}

else if(status.equalsIgnoreCase("Completed"))

{

%>

<span class="completed">Completed</span>

<%

}

else

{

%>

<span class="progress"><%=status%></span>

<%

}

%>

</td>

<td>

<a href="updateBooking.jsp?id=<%=rs.getInt("booking_id")%>" class="btn-update">

Update

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