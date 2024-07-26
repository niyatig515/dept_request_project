<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ include file="bstrap.jsp" %>
<%@ page import="com.database.DbConnection, java.util.Date" %>
</head>
<body>
   <%
     String legalid=request.getParameter("legalid");
     String legaltitle=request.getParameter("legaltitle");
     String legalapprover=request.getParameter("legalapprover");
     String legalstatus=request.getParameter("legalstatus");
     int lid=Integer.parseInt(legalid);
     Date d2=new Date();
 	 String lapprovedate=d2.toString();
     int temp2=DbConnection.updateLegalRecord(lapprovedate,legalapprover,legalstatus,lid,legaltitle);
     if(temp2!=0)
     response.sendRedirect("legal.jsp"); 
   
   %>
</body>
</html>