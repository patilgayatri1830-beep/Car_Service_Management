<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "SELECT * FROM admin WHERE username=? AND password=?");

        ps.setString(1,username);
        ps.setString(2,password);

        ResultSet rs=ps.executeQuery();

        if(rs.next())
        {
            session.setAttribute("admin", rs.getString("username"));
            session.setAttribute("admin_id", rs.getInt("admin_id"));

            response.sendRedirect("dashboard.jsp");
            return;
        }
        else
        {
            msg="<span style='color:red;'>Invalid Username or Password</span>";
        }
    }
    catch(Exception e)
    {
        msg="<span style='color:red;'>"+e.getMessage()+"</span>";
    }
}
%>

<html>
<head>
<title>Admin Login | AutoElite</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/admin.css">

</head>
<body>

<div class="admin-container">

<div class="admin-box">
<a href="../index.jsp" class="back-btn">
 Back to Home
</a>
<br>
<div>
    <img src="../images/profile.jpg" class="admin-logo">
</div>
<h1>Administrator Login</h1>
<p>Only authorized administrators can access this panel.</p>

<form method="post">
<input type="text" name="username" placeholder="Admin Username" required>

<input type="password" name="password" placeholder="Password" required>

<div class="remember">

<input type="checkbox" id="remember">

<label for="remember">
Remember Me
</label>
</div>
<button type="submit" class="login-btn">
Login
</button>
</form>
<div style="margin-top:15px;text-align:center;">
<%=msg%>
</div>
<div class="bottom-text">
@ 2026 AutoElite Technologies
</div>
</div>
</div>
<script src="../js/script.js"></script>
</body>
</html>