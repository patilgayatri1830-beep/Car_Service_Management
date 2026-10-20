<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("mechanic_id") == null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Completed Services</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Completed Service Jobs</h1>

<table border="1" cellpadding="10">

<tr>

    <th>Booking ID</th>
    <th>Vehicle No</th>
    <th>Vehicle Model</th>
    <th>Service</th>
    <th>Booking Date</th>
    <th>Problem</th>
    <th>Status</th>

</tr>

<%
try
{
    int mechanicId = (Integer)session.getAttribute("mechanic_id");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM booking " +
        "WHERE mechanic_id=? AND status='Completed' " +
        "ORDER BY booking_id DESC"
    );

    ps.setInt(1, mechanicId);

    ResultSet rs = ps.executeQuery();

    boolean found = false;

    while(rs.next())
    {
        found = true;
%>

<tr>

    <td>#<%=rs.getInt("booking_id")%></td>

    <td><%=rs.getString("vehicle_number")%></td>

    <td><%=rs.getString("vehicle_model")%></td>

    <td><%=rs.getString("service_name")%></td>

    <td><%=rs.getDate("booking_date")%></td>

    <td><%=rs.getString("problem")%></td>

    <td>
        <span class="completed">
            Completed
        </span>
    </td>

</tr>

<%
    }

    if(!found)
    {
%>

<tr>

<td colspan="7"
    style="text-align:center;color:red;font-weight:bold;">

    No Completed Jobs Found

</td>

</tr>

<%
    }

    rs.close();
    ps.close();
    con.close();

}
catch(Exception e)
{
%>

<tr>

<td colspan="7"
    style="color:red;text-align:center;">

    <%=e.getMessage()%>

</td>

</tr>

<%
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