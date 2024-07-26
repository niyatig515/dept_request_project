<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@ page import="com.database.DbConnection, java.util.Date" %>
</head>
<body>

<%  
    int legalstatus=0;
    int financestatus=0;
    
	String title=request.getParameter("title");
	String description=request.getParameter("description");
	String date=request.getParameter("date");
	String department=request.getParameter("department");
	int managementstatus =DbConnection.insertManagement(title,description,date,department);
	 if (department != null) {
	if(department.equals("Legal"))
    legalstatus =DbConnection.insertLegal(title,description,date);
	if(department.equals("Finance"))
	 financestatus =DbConnection.insertFinance(title,description,date);	
	 }
	if(managementstatus==1 &&(legalstatus==1||financestatus==1))
		response.sendRedirect("management.jsp");
	%>
</body>
</html>