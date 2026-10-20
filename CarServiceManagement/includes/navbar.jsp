<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" href="css/navbar.css">

</head>

<body>

<nav>

    <div class="logo">
       <img src="images/logo.png" alt="Logo">
          AUTOCARE<span>PRO</span>
    </div>

     <div class="menu-toggle" id="menu-toggle">
    &#9776;
</div>

   <ul id="navLinks">

        <li><a href="index.jsp">Home</a></li>

        <li><a href="about.jsp">About</a></li>

        <li><a href="services.jsp">Services</a></li>

        <li><a href="contact.jsp">Contact</a></li>

        <li class="dropdown">

            <a href="#">Login &#9662;</a>

            <ul class="dropdown-content">

                <li><a href="admin/login.jsp">Admin Login</a></li>

                <li><a href="customer/login.jsp">Customer Login</a></li>

                <li><a href="mechanic/login.jsp">Mechanic Login</a></li>

            </ul>

        </li>

    </ul>

</nav>
<script src="js/script.js"></script>
</body>
</html>