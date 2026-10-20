<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String employee_id=request.getParameter("employee_id");
    String password=request.getParameter("password");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "SELECT * FROM mechanic WHERE employee_id=? AND password=?");

        ps.setString(1,employee_id);
        ps.setString(2,password);

        ResultSet rs=ps.executeQuery();

        if(rs.next())
        {
            session.setAttribute("mechanic_id", rs.getInt("mechanic_id"));
            session.setAttribute("mechanic_name", rs.getString("full_name"));

            response.sendRedirect("dashboard.jsp");
        }
        else
        {
            msg="Invalid Employee ID or Password";
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
<title>Mechanic Login | AutoCare Pro</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/mechanic.css">

</head>

<body>

<div class="mechanic-container">

    <div class="mechanic-box">

        <a href="../index.jsp" class="back-btn">
            Back to Home
        </a>
         <br>
         <div>
        <img src="../images/profile.jpg" class="mechanic-logo">
        </div>
        <h1>Mechanic Login</h1>

        <p>
            Login to manage assigned jobs and update service status.
        </p>

        <form method="post" onsubmit="return validateMechanic();">

            <input type="text" id="employee_id" name="employee_id" placeholder="Employee Id">

            <input type="password" id="password" name="password" placeholder="Password">

            <div class="remember">

                <input type="checkbox" id="remember">

                <label for="remember">
                    Remember Me
                </label>

                <a href="forgotPassword.jsp">Forgot Password?</a>

            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>
<p style="color:red;text-align:center;">
    <%=msg%>
</p>
        <div class="bottom-text">

            © 2026 AutoCare Pro

            <br>

            <span>Mechanic Portal v1.0</span>

        </div>

    </div>

</div>
<script src="../js/validation.js"></script>
<script src="../js/script.js"></script>
</body>
</html>