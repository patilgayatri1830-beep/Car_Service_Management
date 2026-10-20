<%@ include file="includes/navbar.jsp" %>
<%@ page import="java.sql.*"%>
<%@ include file="includes/dbConnection.jsp"%>

<%
String msg="";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String message=request.getParameter("message");

    try
    {
        PreparedStatement ps=con.prepareStatement(
        "INSERT INTO contact(full_name,email,mobile,message) VALUES(?,?,?,?)");

        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,mobile);
        ps.setString(4,message);

        int i=ps.executeUpdate();

        if(i>0)
        {
            msg="<span style='color:lime;'>Message Sent Successfully.</span>";
        }
        else
        {
            msg="<span style='color:red;'>Failed to Send.</span>";
        }
    }
    catch(Exception e)
    {
        msg=e.getMessage();
    }
}
%>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/contact.css">
<link rel="stylesheet" href="css/footer.css">

<section class="contact-page">

    <div class="contact-title">
        <h4>CONTACT US</h4>
        <h1>Get In Touch With AutoElite</h1>
        <p>We're here to help you with all your car service needs.</p>
    </div>

    <div class="contact-container">

        <!-- Left Side -->
        <div class="contact-info">

            <div class="info-box">
                <h3> Address</h3>
                <p>R. C. Patel College Road,<br>Shirpur, Maharashtra</p>
            </div>

            <div class="info-box">
                <h3> Phone</h3>
                <p>+91 9284747451</p>
            </div>

            <div class="info-box">
                <h3> Email</h3>
                <p>support@autoelite.com</p>
            </div>

            <div class="info-box">
                <h3> Working Hours</h3>
                <p>Mon - Sat : 9:00 AM - 7:00 PM</p>
            </div>

        </div>

        <!-- Right Side -->
        <div class="contact-form">

            <form method="post">

<input type="text"
name="name"
placeholder="Full Name"
required>

<input type="email"
name="email"
placeholder="Email"
required>

<input type="text"
name="mobile"
placeholder="Mobile Number"
required>

<textarea
name="message"
placeholder="Write Your Message"
required></textarea>

<button type="submit">
Send Message
</button>

</form>

<br>

<div style="text-align:center;">
<%=msg%>
</div>

        </div>

    </div>

</section>

<!-- Google Map -->
<section class="map">

<iframe
src="https://www.google.com/maps?q=Shirpur,Maharashtra&output=embed"
allowfullscreen=""
loading="lazy">
</iframe>

</section>

<%@ include file="includes/footer.jsp" %>