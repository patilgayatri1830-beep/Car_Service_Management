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
    try
    {
        int bookingId=Integer.parseInt(request.getParameter("booking_id"));
        double amount=Double.parseDouble(request.getParameter("amount"));
        String paymentMode=request.getParameter("payment_mode");
        String paymentDate=request.getParameter("payment_date");

        PreparedStatement ps=con.prepareStatement(
        "INSERT INTO payment(booking_id,amount,payment_mode,payment_date) VALUES(?,?,?,?)");

        ps.setInt(1,bookingId);
        ps.setDouble(2,amount);
        ps.setString(3,paymentMode);
        ps.setString(4,paymentDate);


        int i=ps.executeUpdate();

        if(i>0)
        {
            msg="<span style='color:green;'>Payment Successful.</span>";
        }
        else
        {
            msg="<span style='color:red;'>Payment Failed.</span>";
        }
    }
    catch(Exception e)
    {
        msg="<span style='color:red;'>"+e.getMessage()+"</span>";
    }
    con.close();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment | AutoElite</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/book-service.css">

</head>

<body>

<div class="booking-container">

<div class="booking-box">

<h1>Payment</h1>

<form method="post">

<label>Booking ID</label>

<input type="number"
name="booking_id"
required>

<label>Amount</label>

<input type="number"
name="amount"
step="0.01"
required>

<label>Payment Mode</label>

<select name="payment_mode" required>

<option value="">Select Payment Mode</option>

<option>Cash</option>

<option>UPI</option>

<option>Credit Card</option>

<option>Debit Card</option>

</select>

<label>Payment Date</label>

<input type="date"
name="payment_date"
required>

<button type="submit">

Pay Now

</button>

</form>

<br>

<div style="text-align:center;">
<%=msg%>
</div>

<br>

<div style="text-align:center;">

<a href="dashboard.jsp" class="btn">

Back Dashboard

</a>

</div>

</div>

</div>

</body>

</html>