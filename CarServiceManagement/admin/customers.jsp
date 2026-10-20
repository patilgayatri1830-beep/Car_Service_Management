<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

// Delete Customer
String delete=request.getParameter("delete");

if(delete!=null)
{
    try
    {
        PreparedStatement ps=con.prepareStatement("DELETE FROM customer WHERE customer_id=?");

        ps.setInt(1,Integer.parseInt(delete));

        ps.executeUpdate();

        response.sendRedirect("customers.jsp");
        return;
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>


<html>
<head>
<title>Customers Management</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="admin-container">

<div class="admin-table">

<h1>Registered Customers</h1>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Email</th>

<th>Mobile</th>

<th>City</th>

<th>Address</th>

<th>Action</th>

</tr>

<%
try
{
PreparedStatement ps=con.prepareStatement(
"SELECT * FROM customer ORDER BY customer_id DESC");

ResultSet rs=ps.executeQuery();

while(rs.next())
{
%>

<tr>

<td><%=rs.getInt("customer_id")%></td>

<td><%=rs.getString("full_name")%></td>

<td><%=rs.getString("email")%></td>

<td><%=rs.getString("mobile")%></td>

<td><%=rs.getString("city")%></td>

<td><%=rs.getString("address")%></td>

<td>

<a href="customers.jsp?delete=<%=rs.getInt("customer_id")%>"
class="delete-btn"
onclick="return confirm('Delete this customer?')">

Delete

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