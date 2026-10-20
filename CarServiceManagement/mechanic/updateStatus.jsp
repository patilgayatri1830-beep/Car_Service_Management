<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("mechanic_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String id=request.getParameter("id");

if(id==null)
{
    response.sendRedirect("jobs.jsp");
    return;
}

String vehicle="";
String model="";
String service="";
String problem="";
String status="";

/* ---------------- UPDATE STATUS ---------------- */

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String bookingId=request.getParameter("booking_id");
    String newStatus=request.getParameter("status");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "UPDATE booking SET status=? WHERE booking_id=? AND mechanic_id=?");

        ps.setString(1,newStatus);
        ps.setInt(2,Integer.parseInt(bookingId));
        ps.setInt(3,(Integer)session.getAttribute("mechanic_id"));

        int i=ps.executeUpdate();

        if(i>0)
        {
            response.sendRedirect("jobs.jsp");
            return;
        }
        else
        {
            out.println("<h3 style='color:red;text-align:center;'>Unauthorized Access!</h3>");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
}

/* ---------------- FETCH BOOKING ---------------- */

try
{
    PreparedStatement ps=con.prepareStatement(
    "SELECT * FROM booking WHERE booking_id=? AND mechanic_id=?");

    ps.setInt(1,Integer.parseInt(id));
    ps.setInt(2,(Integer)session.getAttribute("mechanic_id"));

    ResultSet rs=ps.executeQuery();

    if(rs.next())
    {
        vehicle=rs.getString("vehicle_number");
        model=rs.getString("vehicle_model");
        service=rs.getString("service_name");
        problem=rs.getString("problem");
        status=rs.getString("status");
    }
    else
    {
        out.println("<h3 style='color:red;text-align:center;'>Job Not Found!</h3>");
        return;
    }
}
catch(Exception e)
{
    out.println(e);
}
%>

<html>

<head>

<title>Update Job Status</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/dashboard.css">


</head>

<body>

<div class="update-container">

<div class="update-box">

<h1>Update Service Status</h1>

<form method="post">

<input
type="hidden"
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

<label>Service Name</label>

<input
type="text"
value="<%=service%>"
readonly>

<label>Problem</label>

<textarea readonly><%=problem%></textarea>

<label>Status</label>

<select name="status">

<option value="Pending"
<%=status.equals("Pending")?"selected":""%>>
Pending
</option>

<option value="In Progress"
<%=status.equals("In Progress")?"selected":""%>>
In Progress
</option>

<option value="Completed"
<%=status.equals("Completed")?"selected":""%>>
Completed
</option>

</select>

<br><br>

<button type="submit">

Update Status

</button>

</form>

<br>

<a href="jobs.jsp" class="back-btn">

 Back

</a>

</div>

</div>

</body>

</html>