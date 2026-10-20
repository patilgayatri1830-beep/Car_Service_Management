<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
if(session.getAttribute("mechanic_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

if(request.getMethod().equalsIgnoreCase("POST"))
{
    int customerId=Integer.parseInt(request.getParameter("customer_id"));

    String vehicle=request.getParameter("vehicle_number");
    String model=request.getParameter("vehicle_model");
    String service=request.getParameter("service_name");
    String date=request.getParameter("booking_date");
    String problem=request.getParameter("problem");

    int mechanicId=(Integer)session.getAttribute("mechanic_id");

    try
    {
        PreparedStatement ps=con.prepareStatement(

"INSERT INTO booking(customer_id,mechanic_id,booking_date,vehicle_number,status,vehicle_model,service_name,problem) VALUES(?,?,?,?,?,?,?,?)");

        ps.setInt(1,customerId);
        ps.setInt(2,mechanicId);
        ps.setString(3,date);
        ps.setString(4,vehicle);
        ps.setString(5,"Pending");
        ps.setString(6,model);
        ps.setString(7,service);
        ps.setString(8,problem);

        ps.executeUpdate();
%>

<script>
alert("New Service Job Added Successfully");
window.location="jobs.jsp";
</script>

<%
    }
    catch(Exception e)
    {
        out.println("<h3 style='color:red;'>"+e+"</h3>");
    }
}
%>

<html>

<head>

<title>New Service Entry</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/newjob.css">

</head>

<body>

<div class="job-container">

<div class="job-box">

<h1>Create New Service</h1>

<form method="post">

<label>Customer ID</label>

<input
type="number"
name="customer_id"
placeholder="customer Id"
required>

<label>Vehicle Number</label>

<input
type="text"
name="vehicle_number"
placeholder="vehicle number"
required>

<label>Vehicle Model</label>

<input
type="text"
name="vehicle_model"
placeholder="vehicle model"
required>

<label>Service Name</label>

<select name="service_name">

<option>Oil Change</option>
<option>Brake Service</option>
<option>Engine Repair</option>
<option>Battery Check</option>
<option>AC Service</option>
<option>Tyre Alignment</option>
<option>Car Washing</option>
<option>Full Car Service</option>

</select>

<label>Booking Date</label>

<input
type="date"
name="booking_date"
placeholder="booking date"
required>

<label>Problem</label>

<textarea
name="problem"
rows="4"
required></textarea>

<button type="submit">

Create Service

</button>

</form>

<br>

<a href="dashboard.jsp" class="back-btn">

Back Dashboard

</a>

</div>

</div>

</body>

</html>