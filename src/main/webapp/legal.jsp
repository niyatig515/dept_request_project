<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Legal Department</title>
<%@ include file="bstrap.jsp" %>
<%@ page import="java.sql.*, com.database.DbConnection" %>
<style type="text/css">
body{
    background-color:#EEF7FF;
     }
     
 .table{
            border: 1px solid #ccc;
            padding: 5px;
 }
 .button-container button {
    display: inline-block;
    margin-right: 10px;
  }
 
</style>
  
</head>
</head>
<body>
    <div class="container">
    <div class="row">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   <div class="navbar-header">
  <p class="navbar-brand">Legal Dashboard</p>
  </div>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  </div>
    <div class="row">
       <div class="col-md-12">
          <table class="table table-hover">
           	<h4>Request Status</h4>
           	<tr>
           	  <th>Request Id</th>
           	  <th>Request Time</th>
           	  <th>Description</th>
           	  <th>Request Date</th>
           	  <th>Approval Person</th>
           	  <th>Approval Date</th>
           	  <th>Status</th>
           	</tr>
      <%
      String approverName=(String)session.getAttribute("name") ;
      String accept="Accept";
   	  String denied="Denied";
    try{
    	Connection conn=DbConnection.takeConnection();
    	String query="Select id,title,description,request_date,approval_person,approval_date,status from legal order by id desc"; 
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
    		String legalid=rs.getString(1);
    		String legaltitle=rs.getString(2);
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
    			out.print("<form action='updatelegal.jsp' method='post'>");
    			out.println("<input type='hidden' name='legalid' value='"+legalid+"'>");
    			out.println("<input type='hidden' name='legaltitle' value='"+legaltitle+"'>");
    			out.println("<input type='hidden' name='legalapprover' value='"+approverName+"'>");
    			out.print("<button type='submit' class='btn btn-success' name='legalstatus' value='"+accept+"'>Accept</button>" );
    			out.println("</form>");
    			out.println("</td>");
    			 out.println("<td>");
    			out.print("<form action='updatelegal.jsp' method='post'>");
    			out.println("<input type='hidden' name='legalid' value='"+legalid+"'>");
    			out.println("<input type='hidden' name='legaltitle' value='"+legaltitle+"'>");
    			out.println("<input type='hidden' name='legalapprover' value='"+approverName+"'>");
    			out.print("<button type='submit'class='btn btn-danger' name='legalstatus' value='"+denied+"'>Denied</button>");
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
    </div>
</body>
</html>