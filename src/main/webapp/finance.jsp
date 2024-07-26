<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Finance Department</title>
<%@ include file="bstrap.jsp" %>
<%@ page import="java.sql.*, com.database.DbConnection" %>
<style type="text/css">
      
   
  body{
    background-color:#EEF7FF;
     }
  
 .table{
            border: 1px solid #ccc;
            padding: 3px;
            width: 80%;
 
 }
 .button-container button {
    display: inline-block;
    margin-right: 10px;
  }
  
  
  
</style>
</head>
<body>
    <div class="container">
     <div class="row">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   <div class="navbar-header">
  <p class="navbar-brand">Finance Dashboard</p>
  </div>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  </div>
       <div class="col-md-12">
          <table class="table table-hover" style="width: 80%;">
           	<h4>Request Status</h4>
           	<tr>
           	  <th>Request Id</th>
           	  <th>Request Title</th>
           	  <th>Description</th>
           	  <th>Request Date</th>
           	  <th>Approval Person</th>
           	  <th>Approval Date</th>
           	  <th>Status</th>
           	</tr>
           	  <%
           	String approverName=(String)session.getAttribute("name");
           	  String accept="Accept";
           	  String denied="Denied";
           	  
    try{
    	Connection conn=DbConnection.takeConnection();
    	String query="Select id,title,description,request_date,approval_person,approval_date,status from finance  order by id desc"; 
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
    		String financeid=rs.getString(1);
    		String financetitle=rs.getString(2);
    		String status=rs.getString(7);
    		if(!status.equalsIgnoreCase("pending"))
    		out.println("<td>"+rs.getString(7)+"</td>");	
    		else
    		{   
    			out.print("<td>");
    			out.println("<div class='button-container'>");
    			out.println("<table>"); 
    			out.println("<tr>"); 
    			out.println("<td>");
    			out.print("<form action='updatefinance.jsp' method='post'>");
    			out.println("<input type='hidden' name='financeid' value='"+financeid+"'>");
    			out.println("<input type='hidden' name='financetitle' value='"+financetitle+"'>");
    			out.println("<input type='hidden' name='financeapprover' value='"+approverName+"'>");
    			out.print("<button type='submit' class='btn btn-success' name='financestatus' value='"+accept+"'>Accept</button>" );
    			out.println("</form>");
    			out.println("</td>");
    			 out.println("<td>");
    			out.print("<form action='updatefinance.jsp' method='post'>");
    			out.println("<input type='hidden' name='financeid' value='"+financeid+"'>");
    			out.println("<input type='hidden' name='financetitle' value='"+financetitle+"'>");
    			out.println("<input type='hidden' name='financeapprover' value='"+approverName+"'>");
    			out.print("<button type='submit'class='btn btn-danger' name='financestatus' value='"+denied+"'>Denied</button>");
    			out.println("</form>");
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("</table>");
    			out.println("</div>");
    			out.print("</td>");
    			}
    		out.println("</tr>");
    	}
    	conn.close();
    }
    catch(Exception e)
  {
    	e.printStackTrace();
  } 
  %>
    	</table>
      </div>
    
    </div>
</body>
</html>