<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("mechanic_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int totalJobs=0;
int pendingJobs=0;
int completedJobs=0;

try
{
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM booking");
    if(rs.next())
        totalJobs=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM booking WHERE status='Pending'");
    if(rs.next())
        pendingJobs=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM booking WHERE status='Completed'");
    if(rs.next())
        completedJobs=rs.getInt(1);
}
catch(Exception e)
{
    out.println(e);
}
%>

<html>
<head>
<title>Mechanic Dashboard</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-dashboard">

<div class="sidebar">

<h2>Mechanic Panel</h2>

<ul>

<li><a href="dashboard.jsp">Dashboard</a></li>

<li><a href="jobs.jsp">Assigned Jobs</a></li>

<li><a href="completed.jsp">Completed Jobs</a></li>

<li><a href="newJob.jsp">New Service Entry</a></li>

<li><a href="logout.jsp">Logout</a></li>

</ul>

</div>

<div class="main-content">

<h1>Welcome Mechanic</h1>

<div class="cards">

<div class="card">
    <a href="jobs.jsp">
        <h2><%=totalJobs%></h2>
        <p>Total Jobs</p>
    </a>
</div>

<div class="card">
    <a href="jobs.jsp">
        <h2><%=pendingJobs%></h2>
        <p>Pending Jobs</p>
    </a>
</div>

<div class="card">
    <a href="completed.jsp">
        <h2><%=completedJobs%></h2>
        <p>Completed Jobs</p>
    </a>
</div>

<div class="card">
    <a href="newJob.jsp">
        <h2>+</h2>
        <p>New Service Entry</p>
    </a>
</div>

</div>

</div>

</div>

</body>

</html>