<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>
<%
if(request.getMethod().equalsIgnoreCase("POST"))
{
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String password=request.getParameter("password");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "UPDATE customer SET password=? WHERE email=? AND mobile=?");

        ps.setString(1,password);
        ps.setString(2,email);
        ps.setString(3,mobile);

        int i=ps.executeUpdate();

        if(i>0)
        {
%>
<link rel="stylesheet" href="../css/forgot.css">
<script>
alert("Password Updated Successfully");
window.location="login.jsp";
</script>

<%
        }
        else
        {
            out.println("<p style='color:red;'>Invalid Email or Mobile Number</p>");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>
<link rel="stylesheet" href="../css/forgot.css">
<div class="forgot-container">

<h1>Forgot Password</h1>

<form method="post">

<label>Email</label>
<input type="email" name="email" required>

<label>Mobile Number</label>
<input type="text"
       name="mobile"
       maxlength="10"
       pattern="[0-9]{10}"
       required>
<label>New Password</label>
<input type="password" name="password" required>

<button type="submit">
Reset Password
</button>

</form>

<a href="login.jsp" class="back-link">
Back to Login
</a>

</div>