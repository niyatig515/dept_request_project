<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   <%@ page import="com.database.DbConnection" %>
   <%@ include file="bstrap.jsp" %>
</head>
<body>
  
<%
	String username=request.getParameter("name");
	String password=request.getParameter("password");
	String role=request.getParameter("role");
	session.setAttribute("name",username);
	boolean status=DbConnection.checklogin(username,password,role);
	if(status){
	    if(role.equalsIgnoreCase("legal"))
	      response.sendRedirect("legal.jsp");
        if(role.equalsIgnoreCase("finance"))
        	 response.sendRedirect("finance.jsp");
	    if(role.equalsIgnoreCase("management"))
	     response.sendRedirect("management.jsp");
	}
	else
		response.sendRedirect("index.jsp?status=false");
%>
</body>
</html>