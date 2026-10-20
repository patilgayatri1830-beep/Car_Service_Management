 <%
if(session.getAttribute("customer_id")==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>
<head>

<title>Customer Dashboard</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dashboard.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>

<div class="sidebar">

    <div class="logo">

        AUTOCARE

        <span>PRO</span>

    </div>

    <ul>

        <li>
            <a href="dashboard.jsp">
            <i class="fa-solid fa-house"></i>
            Dashboard
            </a>
        </li>

        <li>
            <a href="../customer/booking.jsp">
            <i class="fa-solid fa-car"></i>
            Book Service
            </a>
        </li>

        <li>
            <a href="history.jsp">
            <i class="fa-solid fa-clock-rotate-left"></i>
            Service History
            </a>
        </li>

        <li>
            <a href="profile.jsp">
            <i class="fa-solid fa-user"></i>
            My Profile
            </a>
        </li>

        <li>
            <a href="../contact.jsp">
            <i class="fa-solid fa-phone"></i>
            Contact
            </a>
        </li>

        <li>
            <a href="logout.jsp">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
            </a>
        </li>

    </ul>

</div>

<div class="main">

    <div class="topbar">

        <h2>Welcome,<%=session.getAttribute("customer_name")%></h2>

    </div>

<div class="cards">

    <div class="card">
        <a href="booking.jsp">
            <i class="fa-solid fa-car-side"></i>
            <h3>Book Service</h3>
            <p>Book your next service.</p>
        </a>
    </div>

    <div class="card">
        <a href="history.jsp">
            <i class="fa-solid fa-screwdriver-wrench"></i>
            <h3>Service Status</h3>
            <p>Track current service.</p>
        </a>
    </div>

    <div class="card">
        <a href="payment.jsp">
            <i class="fa-solid fa-file-invoice"></i>
            <h3>Payments</h3>
            <p>Pay service charges.</p>
        </a>
    </div>

    <div class="card">
        <a href="feedback.jsp">
            <i class="fa-solid fa-star"></i>
            <h3>Feedback</h3>
            <p>Rate our service.</p>
        </a>
    </div>

    <div class="card">
        <a href="profile.jsp">
            <i class="fa-solid fa-user-gear"></i>
            <h3>Profile</h3>
            <p>View your profile.</p>
        </a>
    </div>

    <div class="card">
        <a href="../contact.jsp">
            <i class="fa-solid fa-headset"></i>
            <h3>Support</h3>
            <p>Need Help?</p>
        </a>
    </div>

</div>

</div>

</body>
</html>