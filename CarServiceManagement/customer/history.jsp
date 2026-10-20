<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("customer_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int customer_id=Integer.parseInt(session.getAttribute("customer_id").toString());
%>

<html>
<head>
<title>Booking History</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
<font color="black">
<div class="history-container">

<div class="history-box">

<h1>My Booking History</h1>

<table>

<tr>

<th>ID</th>

<th>Vehicle</th>

<th>Model</th>

<th>Service</th>

<th>Date</th>

<th>Status</th>

</tr>

<%

try
{
PreparedStatement ps=con.prepareStatement(

"SELECT * FROM booking WHERE customer_id=? ORDER BY booking_id DESC");

ps.setInt(1,customer_id);

ResultSet rs=ps.executeQuery();

while(rs.next())
{
%>

<tr>

<td><%=rs.getInt("booking_id")%></td>

<td><%=rs.getString("vehicle_number")%></td>

<td><%=rs.getString("vehicle_model")%></td>

<td><%=rs.getString("service_name")%></td>

<td><%=rs.getString("booking_date")%></td>

<td>

<%

String status=rs.getString("status");

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

</tr>

<%
}

}
catch(Exception e)
{
out.println(e);
}
finally
{
    if(con!=null)
        con.close();
}

%>

</table>

<br>

<a href="dashboard.jsp" class="back-btn">

 Back To Dashboard

</a>

</div>

</div>
</font>
</body>

</html>