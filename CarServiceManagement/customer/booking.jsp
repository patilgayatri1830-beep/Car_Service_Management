<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("customer_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    int customer_id=(Integer)session.getAttribute("customer_id");

    String vehicle=request.getParameter("vehicle");
    String model=request.getParameter("model");
    String service=request.getParameter("service");
    String date=request.getParameter("date");
    String problem=request.getParameter("problem");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "INSERT INTO booking(customer_id,vehicle_number,vehicle_model,service_name,booking_date,problem,status) VALUES(?,?,?,?,?,?,?)");

        ps.setInt(1,customer_id);
        ps.setString(2,vehicle);
        ps.setString(3,model);
        ps.setString(4,service);
        ps.setString(5,date);
        ps.setString(6,problem);
        ps.setString(7,"Pending");


        int i=ps.executeUpdate();

        if(i>0)
        {
            msg="<span style='color:lime;'>Service Booked Successfully!</span>";
        }
        else
        {
            msg="<span style='color:red;'>Booking Failed!</span>";
        }
    }
    catch(Exception e)
    {
        msg=e.getMessage();
    }
   
}
%>


<html>
<head>
<title>Book Service</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/book-service.css">

</head>

<body>

<div class="container">

<div class="service-box">

<h1>Book Car Service</h1>

<p>Fill the details below to schedule your vehicle service.</p>

<form method="post" onsubmit="return validateBooking();">

<input
type="text"
id="vehicle"
name="vehicle"
placeholder="Vehicle Number">

<input
type="text"
id="model"
name="model"
placeholder="Vehicle Model">

<select
id="service"
name="service">

<option value="">Select Service</option>

<option>Oil Change</option>

<option>Brake Service</option>

<option>AC Service</option>

<option>Engine Repair</option>

<option>Battery Check</option>

<option>Car Wash</option>

</select>

<input
type="date"
id="date"
name="date">

<textarea
id="problem"
name="problem"></textarea>

<button type="submit">

Book Service

</button>

</form>

<div class="msg">

<%=msg%>

</div>

<br>

<a href="dashboard.jsp" class="back">

Back to Dashboard

</a>
</div>
</div>
<script src="../js/booking.js"></script>
<script src="../js/validation.js"></script>
</body>
</html>