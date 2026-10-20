<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("customer_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int customer_id=(Integer)session.getAttribute("customer_id");
out.println("Customer ID = " + customer_id + "<br>");
String name="";
String email="";
String mobile="";
String city="";
String address="";

try
{
    PreparedStatement ps=con.prepareStatement(
    "SELECT * FROM customer WHERE customer_id=?");

    ps.setInt(1,customer_id);

    ResultSet rs=ps.executeQuery();


  if(rs.next())
   {

    name=rs.getString("full_name");
    email=rs.getString("email");
    mobile=rs.getString("mobile");
    city=rs.getString("city");
    address=rs.getString("address");
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


<html>
<head>
<title>My Profile</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

</head>

<body>

<div class="profile-container">

<div class="profile-card">

<img src="../images/customers.webp" class="profile-img">

<h1>My Profile</h1>

<table>

<tr>
<td><b>Full Name</b></td>
<td><%=name%></td>
</tr>

<tr>
<td><b>Email</b></td>
<td><%=email%></td>
</tr>

<tr>
<td><b>Mobile</b></td>
<td><%=mobile%></td>
</tr>

<tr>
<td><b>City</b></td>
<td><%=city%></td>
</tr>

<tr>
<td><b>Address</b></td>
<td><%=address%></td>
</tr>

</table>

<a href="dashboard.jsp" class="back-btn">

Back Dashboard

</a>

</div>

</div>

</body>

</html>