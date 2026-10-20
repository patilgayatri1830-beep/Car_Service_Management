<%@ page import="java.sql.*" %>
<%@ include file="../includes/dbConnection.jsp" %>

<%
String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String fullname=request.getParameter("full_name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String city=request.getParameter("city");
    String address=request.getParameter("address");
    String password=request.getParameter("password");
    String confirm=request.getParameter("confirm");

    if(password.equals(confirm))
    {
        try
        {
            PreparedStatement check=con.prepareStatement("SELECT * FROM customer WHERE email=?");
            check.setString(1,email);

            ResultSet rs=check.executeQuery();

            if(rs.next())
            {
                msg="<span style='color:red;'>Email Already Registered!</span>";
            }
            else
            {
                PreparedStatement ps=con.prepareStatement("INSERT INTO customer(full_name,email,mobile,city,address,password) VALUES(?,?,?,?,?,?)");

                ps.setString(1,fullname);
                ps.setString(2,email);
                ps.setString(3,mobile);
                ps.setString(4,city);
                ps.setString(5,address);
                ps.setString(6,password);


                int i=ps.executeUpdate();

                if(i>0)
                {
                    msg="<span style='color:lime;'>Registration Successful</span>";
                }
                else
                {
                    msg="<span style='color:red;'>Registration Failed</span>";
                }
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
    else
    {
        msg="<span style='color:red;'>Password & Confirm Password do not match.</span>";
    }
}
%>
<html>
<head>
<title>Customer Registration | AutoElite</title>

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/register.css">

</head>

<body>

<div class="register-container">

    <div class="register-box">

        <a href="../index.jsp" class="back-btn"> Back to Home</a>

        <h1>Create Account</h1>

        <p>Join AutoElite and enjoy premium car services.</p>

        <form method="post" onsubmit="return validateRegister();">

            <div class="input-group">

                <input type="text" id="name" name="full_name" placeholder="Full Name" required>

                <input type="email" id="email" name="email" placeholder="Email Address" required>

            </div>

            <div class="input-group">

                <input type="text" id="mobile" name="mobile" placeholder="Mobile Number" required>

                <input type="text" id="city" name="city" placeholder="City" required>
            </div>

            <textarea id="address" name="address" placeholder="Address" required></textarea>

            <div class="input-group">

                <input type="password" id="password" name="password" placeholder="Password" required>

               <input type="password" id="confirm" name="confirm" placeholder="Confirm Password" required>

            </div>
            <button type="submit">Create Account</button>
        </form>
        <div style="margin-top:15px; text-align:center; font-weight:bold;"><%=msg%></div>

        <div class="login-link">

            Already have an account?
            
            <a href="login.jsp">Login Here</a>
        </div>
    </div>
</div>
<script src="../js/validation.js"></script>
<script src="../js/script.js"></script>
</body>
</html>