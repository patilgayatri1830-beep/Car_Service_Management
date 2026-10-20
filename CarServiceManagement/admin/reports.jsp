<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int totalCustomers=0;
int totalBookings=0;
int pendingBookings=0;
int completedBookings=0;

try
{
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM customer");
    if(rs.next())
        totalCustomers=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM booking");
    if(rs.next())
        totalBookings=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM booking WHERE status='Pending'");
    if(rs.next())
        pendingBookings=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM booking WHERE status='Completed'");
    if(rs.next())
        completedBookings=rs.getInt(1);

}
catch(Exception e)
{
    out.println(e);
}
%>
<html>
<head>
<title>Reports</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-dashboard">

<div class="main-content">

<h1>System Reports</h1>

<div class="cards">

<div class="card">

<h2><%=totalCustomers%></h2>

<p>Total Customers</p>

</div>

<div class="card">

<h2><%=totalBookings%></h2>

<p>Total Bookings</p>

</div>

<div class="card">

<h2><%=pendingBookings%></h2>

<p>Pending Services</p>

</div>

<div class="card">

<h2><%=completedBookings%></h2>

<p>Completed Services</p>

</div>

</div>

<br><br>

<table class="history-table">

<tr>

<th>Report Name</th>

<th>Value</th>

</tr>

<tr>

<td>Total Registered Customers</td>

<td><%=totalCustomers%></td>

</tr>

<tr>

<td>Total Bookings</td>

<td><%=totalBookings%></td>

</tr>

<tr>

<td>Pending Bookings</td>

<td><%=pendingBookings%></td>

</tr>

<tr>

<td>Completed Bookings</td>

<td><%=completedBookings%></td>

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