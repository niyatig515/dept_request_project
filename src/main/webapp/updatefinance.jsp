<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>updatefinance</title>
<%@ include file="bstrap.jsp" %>
<%@ page import="com.database.DbConnection, java.util.Date" %>
</head>
<body>
   <%
   String financeid=request.getParameter("financeid");
   String financetitle=request.getParameter("financetitle");
   String financeapprover=request.getParameter("financeapprover");
   String financestatus=request.getParameter("financestatus");
   int fid=Integer.parseInt(financeid);
   Date d1=new Date();
   String approvedate=d1.toString();
   int temp1=DbConnection.updateFinanceRecord(approvedate,financeapprover,financestatus,fid,financetitle);
    if(temp1!=0)
	 response.sendRedirect("finance.jsp");  
   %>
     
</body>
</html>