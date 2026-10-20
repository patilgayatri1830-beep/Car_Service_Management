<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
if(session.getAttribute("mechanic_id") == null)
{
    response.sendRedirect("login.jsp");
    return;
}

int mechanicId = (Integer)session.getAttribute("mechanic_id");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Assigned Jobs</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/dashboard.css">

<style>

body
{
    background:#08121f;
}

.admin-container
{
    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:40px;
}

.admin-table
{
    width:95%;

    background:white;

    padding:40px;

    border-radius:25px;

    box-shadow:0 15px 40px rgba(0,0,0,0.3);

    overflow-x:auto;
}

.admin-table h1
{
    text-align:center;

    color:#ffb703;

    margin-bottom:35px;

    font-size:40px;
}

.admin-table table
{
    width:100%;

    border-collapse:collapse;

    min-width:1000px;
}

.admin-table th
{
    background:#ffb703;

    color:#111;

    padding:18px 12px;

    text-align:center;

    font-size:17px;
}

.admin-table td
{
    padding:15px 10px;

    text-align:center;

    border-bottom:1px solid #ddd;

    font-size:16px;
}

.admin-table tr:hover
{
    background:#fff8e1;
}


/* ================= STATUS ================= */

.pending
{
    display:inline-block;

    padding:8px 18px;

    border-radius:25px;

    background:#ffb703;

    color:#111;

    font-weight:bold;
}

.progress
{
    display:inline-block;

    padding:8px 18px;

    border-radius:25px;

    background:#2196F3;

    color:white;

    font-weight:bold;
}

.completed
{
    display:inline-block;

    padding:8px 18px;

    border-radius:25px;

    background:#28a745;

    color:white;

    font-weight:bold;
}


/* ================= UPDATE BUTTON ================= */

.btn-update
{
    display:inline-block;

    padding:10px 22px;

    background:#08121f;

    color:white;

    text-decoration:none;

    border-radius:25px;

    font-weight:bold;

    transition:0.3s;
}

.btn-update:hover
{
    background:#ffb703;

    color:#111;

    transform:translateY(-2px);
}


/* ================= BACK BUTTON ================= */

.back-btn
{
    display:inline-block;

    margin-top:30px;

    padding:14px 28px;

    background:#08121f;

    color:white;

    text-decoration:none;

    border-radius:30px;

    font-weight:bold;

    transition:0.3s;
}

.back-btn:hover
{
    background:#ffb703;

    color:#111;
}


/* ================= NO JOBS ================= */

.no-jobs
{
    text-align:center;

    color:#777;

    font-weight:bold;

    padding:30px;
}


/* ================= MOBILE ================= */

@media(max-width:768px)
{
    .admin-container
    {
        padding:20px;
    }

    .admin-table
    {
        padding:25px 15px;
    }

    .admin-table h1
    {
        font-size:30px;
    }
}

</style>

</head>


<body>


<div class="admin-container">

<div class="admin-table">


<h1>Assigned Service Jobs</h1>


<table>

<tr>

<th>Booking ID</th>

<th>Vehicle No</th>

<th>Model</th>

<th>Service</th>

<th>Date</th>

<th>Problem</th>

<th>Status</th>

<th>Action</th>

</tr>


<%

try
{

    PreparedStatement ps = con.prepareStatement(

        "SELECT * FROM booking " +

        "WHERE mechanic_id=? " +

        "ORDER BY booking_id DESC"

    );


    ps.setInt(1, mechanicId);


    ResultSet rs = ps.executeQuery();


    boolean found = false;


    while(rs.next())
    {

        found = true;


        int bookingId =
            rs.getInt("booking_id");


        String status =
            rs.getString("status");


        if(status == null)
        {
            status = "Pending";
        }

%>


<tr>


<td>

#<%=bookingId%>

</td>


<td>

<%=rs.getString("vehicle_number")%>

</td>


<td>

<%=rs.getString("vehicle_model")%>

</td>


<td>

<%=rs.getString("service_name")%>

</td>


<td>

<%=rs.getDate("booking_date")%>

</td>


<td>

<%=rs.getString("problem")%>

</td>


<td>


<%

if(status.equalsIgnoreCase("Pending"))
{

%>

<span class="pending">

Pending

</span>

<%

}
else if(status.equalsIgnoreCase("In Progress"))
{

%>

<span class="progress">

In Progress

</span>

<%

}
else if(status.equalsIgnoreCase("Completed"))
{

%>

<span class="completed">

Completed

</span>

<%

}
else
{

%>

<span class="pending">

<%=status%>

</span>

<%

}

%>


</td>


<td>


<%

if(!status.equalsIgnoreCase("Completed"))
{

%>


<a href="updateStatus.jsp?id=<%=bookingId%>"
   class="btn-update">

Update

</a>


<%

}
else
{

%>


<span class="completed">

Completed

</span>


<%

}

%>


</td>


</tr>


<%

    }


    if(!found)
    {

%>


<tr>

<td colspan="8"
    class="no-jobs">

No Assigned Jobs Found

</td>

</tr>


<%

    }


    rs.close();

    ps.close();

    // con.close(); 
    // Connection JSP मध्ये दुसऱ्या pages साठी वापरली जाऊ शकते,
    // त्यामुळे सध्या close केलेले नाही.


}
catch(Exception e)
{

%>


<tr>

<td colspan="8"
    style="color:red;text-align:center;padding:20px;">

Error:
<%=e.getMessage()%>

</td>

</tr>


<%

}

%>


</table>


<a href="dashboard.jsp"
   class="back-btn">

Back Dashboard

</a>


</div>

</div>


</body>

</html>