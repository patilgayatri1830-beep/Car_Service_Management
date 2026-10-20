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

<title>Customer Messages</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Customer Contact Messages</h1>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Mobile</th>
<th>Message</th>
<th>Date</th>

</tr>

<%
try
{
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery(
    "SELECT * FROM contact ORDER BY contact_id DESC");

    while(rs.next())
    {
%>

<tr>

<td><%=rs.getInt("contact_id")%></td>

<td><%=rs.getString("full_name")%></td>

<td><%=rs.getString("email")%></td>

<td><%=rs.getString("mobile")%></td>

<td><%=rs.getString("message")%></td>

<td><%=rs.getString("message_date")%></td>

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