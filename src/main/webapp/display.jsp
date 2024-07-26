<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="bstrap.jsp" %>
<%@ page import="java.sql.*, com.database.DbConnection" %>
<style type="text/css">
  table {
    table-layout: fixed;
    margin-left:18px;
     }
   td, th {
    word-wrap: break-word; 
   }


</style>
</head>
<body>
   <div class="row">
  <table class="table table-hover table-striped">
  <tr>
  <td>S.No</td>
  <td>Title</td>
  <td>Description</td>
  <td>Request Date</td>
  <td>Request Department</td>
  <td>Approval Person</td>
  <td>Approved Date</td>
  <td>Status</td>
  </tr>
  <%
    try{
    	Connection conn=DbConnection.takeConnection();
    	String query="Select request_id,title,description,request_date,request_dept,approval_person,approval_date,status from department order by request_id desc ";
    	PreparedStatement ps=conn.prepareStatement(query);
    	ResultSet rs=ps.executeQuery();
    	while(rs.next())
    	{
    		out.println("<tr>");
    		out.println("<td>"+rs.getString(1)+"</td>");
    		out.println("<td>"+rs.getString(2)+"</td>");
    		out.println("<td>"+rs.getString(3)+"</td>");
    		out.println("<td>"+rs.getString(4)+"</td>");
    		out.println("<td>"+rs.getString(5)+"</td>");
    		out.println("<td>"+rs.getString(6)+"</td>");
    		out.println("<td>"+rs.getString(7)+"</td>");
    		out.println("<td>"+rs.getString(8)+"</td>");
    		out.println("</tr>");
    	}
    	
    }
    catch(Exception e)
  {
    	e.printStackTrace();
  }
  
  
  %>
  </table>
  </div>
</body>
</html>