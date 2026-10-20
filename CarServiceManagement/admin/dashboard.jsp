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
int totalMechanics=0;

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

    rs=st.executeQuery("SELECT COUNT(*) FROM mechanic");
    if(rs.next())
        totalMechanics=rs.getInt(1);

}
catch(Exception e)
{
    out.println(e);
}
%>


<html>
<head>
<title>Admin Dashboard</title>


<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-dashboard">

<div class="sidebar">

<h2>AutoCare Pro</h2>

<ul>

<li><a href="dashboard.jsp">Dashboard</a></li>

<li><a href="customers.jsp">Customers</a></li>

<li><a href="booking.jsp">Bookings</a></li>

<li><a href="services.jsp">Services</a></li>

<li><a href="mechanics.jsp">Mechanics</a></li>

<li><a href="payments.jsp">Payments</a></li>

<li><a href="feedback.jsp">Feedback</a></li>

<li><a href="reports.jsp">Reports</a></li>

<li><a href="bills.jsp">Bills</a></li>

<li><a href="logout.jsp">Logout</a></li>

</ul>

</div>

<div class="main-content">

<div class="cards">

<div class="card">
    <a href="customers.jsp">
        <h2><%=totalCustomers%></h2>
        <p>Total Customers</p>
    </a>
</div>

<div class="card">
    <a href="booking.jsp">
        <h2><%=totalBookings%></h2>
        <p>Total Bookings</p>
    </a>
</div>

<div class="card">
    <a href="booking.jsp">
        <h2><%=pendingBookings%></h2>
        <p>Pending Services</p>
    </a>
</div>

<div class="card">
    <a href="booking.jsp">
        <h2><%=completedBookings%></h2>
        <p>Completed Services</p>
    </a>
</div>

<div class="card">
    <a href="mechanics.jsp">
        <h2><%=totalMechanics%></h2>
        <p>Total Mechanics</p>
    </a>
</div>

<div class="card">
    <a href="payments.jsp">
        <h2>Payments</h2>
        <p>View Customer Payments</p>
    </a>
</div>
<div class="card">
    <a href="feedback.jsp">
        <h2>Feedback</h2>
        <p>Customer Reviews</p>
    </a>
</div>

<div class="card">
    <a href="contact.jsp">
        <h2>Contact</h2>
        <p>Customer Messages</p>
    </a>
</div>
</div>

</div>

</div>

</body>

</html>