<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment Management</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Payment Management</h1>

<table>

<tr>

<th>Payment ID</th>

<th>Booking ID</th>

<th>Amount (Rs.)</th>

<th>Payment Mode</th>

<th>Payment Date</th>

</tr>

<%

try
{
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery("select * from payment order by payment_id desc");

    while(rs.next())
    {
%>

<tr>

<td><%=rs.getInt("payment_id")%></td>

<td><%=rs.getInt("booking_id")%></td>

<td><%=rs.getDouble("amount")%></td>

<td><%=rs.getString("payment_mode")%></td>

<td><%=rs.getString("payment_date")%></td>

</tr>

<%
    }
}
catch(Exception e)
{
    out.println("<tr><td colspan='5'>"+e.getMessage()+"</td></tr>");
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