<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  .body{
    background-color:#EEF7FF; 
  }
  .col-md-6{
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            margin-top: 50px; 
  }
  .login {
         text-align: center;
  }
  .submit{
         text-align: center;
  }
  
</style>
<%@ include file="bstrap.jsp" %>
</head>
<body class="body">
  <div class="container">
    <div class="col-md-3"> </div>
    <div class="col-md-6"> 
    <br/>
    <fieldset>
        <div class="login">
        <legend>Login Form</legend>
        </div>
          <form method="post" action="insertlogin.jsp">
          <label for="name">Name</label>
          <input type="text" class="form-control" name="name" placeholder="Enter your name" required><br/>
          <label for="password">Password</label>
          <input type="password"  class="form-control" name="password" placeholder="Enter password" required><br/>
           <label for="role">Role</label>
          <select class="form-control" id="role" name="role" required>
                     <option value="none" selected disabled>Select a department</option> 
                     <option value="management">Management</option>
                     <option value="legal">Legal</option>
                     <option value="finance">Finance</option>
          </select><br/>
          <div class="submit"><input type="submit" class="btn btn-primary " Value="Submit"/></div>
          </form>
    </fieldset>
    </div>
   <div class="col-md-3"> </div>
  </div>
</body>
</html>
