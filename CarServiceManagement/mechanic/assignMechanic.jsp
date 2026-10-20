<%@ page import="java.sql.*"%>
<%@ include file="../includes/dbConnection.jsp"%>

<%
int booking=Integer.parseInt(request.getParameter("booking_id"));
int mechanic=Integer.parseInt(request.getParameter("mechanic_id"));

PreparedStatement ps=con.prepareStatement(
"UPDATE booking SET mechanic_id=? WHERE booking_id=?");

ps.setInt(1,mechanic);
ps.setInt(2,booking);

ps.executeUpdate();

response.sendRedirect("booking.jsp");
%>
