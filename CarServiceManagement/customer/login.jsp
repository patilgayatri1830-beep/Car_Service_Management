<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String email=request.getParameter("email");
    String password=request.getParameter("password");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "SELECT * FROM customer WHERE email=? AND password=?");

        ps.setString(1,email);
        ps.setString(2,password);

        ResultSet rs=ps.executeQuery();

        if(rs.next())
        {
            session.setAttribute("customer_id",rs.getInt("customer_id"));
            session.setAttribute("customer_name",rs.getString("full_name"));
            session.setAttribute("customer_email",rs.getString("email"));

            response.sendRedirect("dashboard.jsp");
        }
        else
        {
            msg="<span style='color:red;'>Invalid Email or Password</span>";
        }

    }
    catch(Exception e)
    {
        msg=e.getMessage();
    }
    finally
    {
      if(con!=null)
        con.close();
    }
}
%>
<html>
<head>
    <title>Customer Login | AutoElite</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/admin.css">

</head>
<body>
<div class="login-container">

    <div class="login-box">
        <a href="../index.jsp" class="back-btn">
 Back to Home
</a>
<br>
<div>
    <img src="../images/profile.jpg" class="admin-logo">
</div>

        <h1>Customer Login</h1>

        <p>Welcome Back! Login to continue.</p>

<form method="post" onsubmit="return validateLogin();">

<input type="email"
id="email"
name="email"
placeholder="Email"
required>

<input type="password"
id="password"
name="password"
placeholder="Password"
required>

<div class="options">

<label>

<input type="checkbox" name="remember">

Remember Me

</label>

<a href="forgotPassword.jsp">Forgot Password?</a>

</div>

<button type="submit">

Login

</button>

<div class="register-link">

Don't have an account?

<a href="register.jsp">

Register

</a>

</div>

</form>
     <div style="margin-top:15px;text-align:center;"><%=msg%></div>
    </div>

</div>
<script src="../js/validation.js"></script>
<script src="../js/script.js"></script>
</body>
</html>