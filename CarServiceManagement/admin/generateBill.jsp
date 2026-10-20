<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

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
   String date="";
   String problem="";
   int customerId=0;

   double serviceCharge=2500;
   double gst=serviceCharge*0.18;
   double total=serviceCharge+gst;

   try
   {
     PreparedStatement ps=con.prepareStatement(
     "SELECT * FROM booking WHERE booking_id=?");

     ps.setInt(1,Integer.parseInt(id));

     ResultSet rs=ps.executeQuery();

     if(rs.next())
     {
        customerId=rs.getInt("customer_id");
        vehicle=rs.getString("vehicle_number");
        model=rs.getString("vehicle_model");
        service=rs.getString("service_name");
        date=rs.getString("booking_date");
        problem=rs.getString("problem");
     }

    }
    catch(Exception e)
    {
     out.println(e);
    }
%>


<html>
<head>
<title>Invoice</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="invoice">
        <h1>AutoCare Pro</h1>
        <h3>Service Invoice</h3>

<hr>
<table>
    <tr>
        <td><b>Invoice No</b></td>
        <td>INV-<%=id%></td>
    </tr>

    <tr>

        <td><b>Customer ID</b></td>

        <td><%=customerId%></td>

    </tr>

    <tr>

        <td><b>Vehicle Number</b></td>

        <td><%=vehicle%></td>

    </tr>

    <tr>

        <td><b>Vehicle Model</b></td>

        <td><%=model%></td>

    </tr>

    <tr>

        <td><b>Service</b></td>

        <td><%=service%></td>

    </tr>

    <tr>

        <td><b>Booking Date</b></td>

        <td><%=date%></td>

    </tr>

    <tr>

        <td><b>Problem</b></td>

        <td><%=problem%></td>

    </tr>

    <tr>

        <td><b>Service Charge</b></td>

        <td>Rs. <%=serviceCharge%></td>

    </tr>

    <tr>

<td><b>GST (18%)</b></td>

<td>Rs. <%=gst%></td>

</tr>

<tr>

<td><b>Total Amount</b></td>

<td><b>Rs. <%=total%></b></td>

</tr>

</table>

<br>

<button onclick="window.print()">

<li> Print Bill </li>

</button>

<a href="bills.jsp" class="back-btn">

Back

</a>

</div>

</body>

</html>