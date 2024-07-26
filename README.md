# dept_request_project
## Description
This project is a web application designed to manage user authentication and requests. It utilizes a MySQL database for storing user information, JSP (JavaServer Pages) for server-side logic, and Bootstrap for frontend styling. The main functionalities include user login validation, displaying requests with status icons, and managing user data.

## Features
- *User Authentication*: Validates user credentials (name, password, and department) against the MySQL database.
- *Request Submission*: Users can submit requests to the legal or financial departments through the management department.
- *Request Processing*: Workers from the respective department (legal or financial) can either approve or deny the requests.
- *Status Tracking*: The status of each request (pending, approved, denied) is displayed to both the requester and the management department. The management department can view the status but cannot change it.
- *Responsive Design*: Utilizes Bootstrap to ensure the application is responsive and user-friendly on different devices.


## Technologies Used
- *MySQL*: Database management system to store user data.
- *JSP (JavaServer Pages)*: Server-side technology to handle business logic and database interactions.
- *Bootstrap*: Frontend framework for responsive design and styling.
- *Font Awesome*: Icon library for displaying status icons.

##  Configure the database connection**:
    - Update the database connection parameters in the JSP files (login.jsp, signup.jsp):
      java
      String url = "jdbc:mysql://localhost:3306/your_database_name";
      String username = "your_username";
      String password = "your_password";
      

## Deploy the application**:
    - Use a servlet container like Apache Tomcat to deploy the JSP files.

## Usage
1. *Login*: Users can log in with their name, password, and department. Only valid users with matching credentials in the database can log in.
2. *Submit Request*: Users submit requests to the management department specifying the target department (legal or financial).
3. *Process Request*: Workers from the respective department can view and either approve or deny the requests.
4. *View Status*: The status of the requests is shown to both the requester and the management department. The management department can only view the status and cannot change it.
