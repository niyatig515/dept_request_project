<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Management Dashboard</title>
<style>
.request
{
            border: 1px solid #ccc;
            padding: 5px;
            border-radius: 5px;
            margin-top: 5px;
            
  }
  .body{
    background-color:#EEF7FF;
     }
  .login {
         text-align: center;
         margin: 0 auto; 
  }
  .summary{
          margin-top: 5px;
          text-align: center;
  }
  .submit{
         text-align: center;
  }
</style>
  <%@ include file="bstrap.jsp" %>
  <%@ page import="com.database.DbConnection,java.util.Date" %>
</head>
<body class="body">
   <div class="container">
   <div class="row">
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
   <div class="navbar-header">
  <p class="navbar-brand">Management Dashboard</p>
  </div>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  </div>
  <div class="col-md-6 request">
    <fieldset>
        <div class="login">
          <legend>Request Form</legend></div>
           <form  action="requestlogin.jsp">
               <label for="Request Title">Request Title</label>
               <input type="text" class="form-control" name="title" placeholder="Enter Title"  ><br/>
               <label for="Description">Request Description</label>
                <textarea class="form-control" name="description" rows="5" placeholder="Enter Description"></textarea><br/>
               <% String name=(String)session.getAttribute("name"); %>
               <input type="hidden" name="name"  value="<%=name%>" />
               <% Date d=new Date(); 
                  String date=d.toString();
               %>
               <input type="hidden" name="date"  value="<%=date%>" />
               <label for="Department">Department</label>
               <select class="form-control" name="department">
                     <option value="none" selected disabled>Select a department</option> 
                     <option value="Legal">Legal</option>
                     <option value="Finance">Finance</option>
               </select><br/>
               
               
             <div class="submit"><input type="submit" class="btn btn-primary " Value="Submit"/></div>
          </form>
     </fieldset>
  </div>
  
  </div>
  <br/>
  <div class="row">
  <div class="col-md-12">
   <%@ include file="display.jsp" %>
   </div>
  </div>
  </div>
</body>
</html>