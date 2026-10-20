<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

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

<title>Customer Feedback</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Customer Feedback</h1>

<table>

<tr>

<th>ID</th>

<th>Customer</th>

<th>Message</th>

<th>Rating</th>

</tr>

<%

try
{
    Statement st=con.createStatement();

    ResultSet rs=st.executeQuery("select * from feedback order by feedback_id desc");

    while(rs.next())
    {
%>

<tr>

<td><%=rs.getInt("feedback_id")%></td>

<td><%=rs.getString("customer_name")%></td>

<td><%=rs.getString("message")%></td>

<td>

<%
int r=rs.getInt("rating");

for(int i=1;i<=r;i++)
{
    out.print("⭐");
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