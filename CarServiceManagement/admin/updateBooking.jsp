<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("admin")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String id=request.getParameter("id");

String vehicle="";
String model="";
String service="";
String problem="";
String status="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String bookingId=request.getParameter("booking_id");
    String newStatus=request.getParameter("status");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "UPDATE booking SET status=? WHERE booking_id=?");

        ps.setString(1,newStatus);
        ps.setInt(2,Integer.parseInt(bookingId));

        ps.executeUpdate();

        response.sendRedirect("booking.jsp");
        return;
    }
    catch(Exception e)
    {
        out.println(e);
    }
}

try
{
    PreparedStatement ps=con.prepareStatement(
    "SELECT * FROM booking WHERE booking_id=?");

    ps.setInt(1,Integer.parseInt(id));

    ResultSet rs=ps.executeQuery();

    if(rs.next())
    {
        vehicle=rs.getString("vehicle_number");
        model=rs.getString("vehicle_model");
        service=rs.getString("service_name");
        problem=rs.getString("problem");
        status=rs.getString("status");
    }
}
catch(Exception e)
{
    out.println(e);
}
%>

<html>
<head>
<title>Update Booking</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<div class="update-container">

<div class="update-box">

<h1>Update Booking</h1>

<form method="post">

<input type="hidden"
name="booking_id"
value="<%=id%>">

<label>Vehicle Number</label>

<input
type="text"
value="<%=vehicle%>"
readonly>

<label>Vehicle Model</label>

<input
type="text"
value="<%=model%>"
readonly>

<label>Service</label>

<input
type="text"
value="<%=service%>"
readonly>

<label>Problem</label>

<textarea readonly><%=problem%></textarea>

<label>Status</label>

<select name="status">

<option <%=status.equals("Pending")?"selected":""%>>

Pending

</option>

<option <%=status.equals("In Progress")?"selected":""%>>

In Progress

</option>

<option <%=status.equals("Completed")?"selected":""%>>

Completed

</option>

<option <%=status.equals("Cancelled")?"selected":""%>>

Cancelled

</option>

</select>

<button type="submit">

Update Booking

</button>

</form>

<br>

<a href="booking.jsp" class="back-btn">

Back

</a>
</div>
</div>
</body>
</html>