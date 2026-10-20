<%@ include file="includes/dbConnection.jsp" %>

<%

if(con!=null)
{
    out.println("<h2 style='color:green'>Database Connected Successfully</h2>");
}
else
{
    out.println("<h2 style='color:red'>Database Connection Failed</h2>");
}

%>
