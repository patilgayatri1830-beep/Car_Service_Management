<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("customer_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String name=request.getParameter("customer_name");
    String message=request.getParameter("message");
    int rating=Integer.parseInt(request.getParameter("rating"));

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "insert into feedback(customer_name,message,rating) values(?,?,?)");

        ps.setString(1,name);
        ps.setString(2,message);
        ps.setInt(3,rating);

        ps.executeUpdate();

        msg="Feedback Submitted Successfully!";
    }
    catch(Exception e)
    {
        msg=e.getMessage();
    }
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Feedback</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/register.css">

</head>

<body>

<div class="register-container">

<div class="register-box">

<h1>Customer Feedback</h1><br><br>

<form method="post">

<input
type="text"
name="customer_name"
placeholder="Your Name"
required>
<br><br>
<textarea
name="message"
placeholder="Write Your Feedback"
required></textarea>

<select name="rating">

<option value="5">⭐⭐⭐⭐⭐ Excellent</option>

<option value="4">⭐⭐⭐⭐ Good</option>

<option value="3">⭐⭐⭐ Average</option>

<option value="2">⭐⭐ Poor</option>

<option value="1">⭐ Bad</option>

</select>

<br><br>

<button type="submit">

Submit Feedback

</button>

</form>

<br>

<h3 style="color:lime;"><%=msg%></h3>

<br>

<a href="dashboard.jsp" class="back-btn">

Back Dashboard

</a>

</div>

</div>

</body>

</html>