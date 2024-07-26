package com.database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DbConnection {
	public static Connection takeConnection(){
		   Connection con=null;
		   try {
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/batch1", "root", "bhopal");  
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return con;  
	   }
	 public static boolean checklogin(String name,String password,String role) 
	 {
	     boolean status=false;
	   try {
	    	 Connection con=takeConnection();
	    	 String query="select * from loginfo where name=? and password=? and role=?";
	    	 PreparedStatement ps=con.prepareStatement(query);
	    	 ps.setString(1,name);
	    	 ps.setString(2,password);
	    	 ps.setString(3,role);
	    	 ResultSet rs=ps.executeQuery();
	    	 while(rs.next())
	    	 {
	    		 status=true;
	    		 break;
	    	 }
	    	 
	    	 con.close();
	     }
	   catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   return status;
   }
	 public static int insertManagement(String title,String description,String date,String department)
	 {   
		 int managementstatus=0;
		 if(department==null)
			 return managementstatus;
		
		 try {
	    	 Connection con=takeConnection();
	    	 String query="insert into department(title,description,request_date,request_dept,approval_person,approval_date,status)values(?,?,?,?,?,?,?)";
	    	 PreparedStatement ps=con.prepareStatement(query);
	    	 ps.setString(1,title);
	    	 ps.setString(2,description);
	    	 ps.setString(3,date);
	    	 ps.setString(4,department);
	    	 ps.setString(5,"pending");
	    	 ps.setString(6,"pending");
	    	 ps.setString(7,"pending");
	    	 managementstatus=ps.executeUpdate();
	    	 con.close();
		 }
	     catch(Exception e)
	    	 {
	    	 e.printStackTrace();
	    	 }
	    return managementstatus;			 
	 }
    public static int insertLegal(String title,String description,String date)
    {
    	int legalstatus=0;
    	try {
    		Connection con=takeConnection();
    		String query1="insert into legal(title,description,request_date,request_by,approval_person,approval_date,status)values(?,?,?,?,?,?,?)";
    		PreparedStatement ps=con.prepareStatement(query1);
	    	 ps.setString(1,title);
	    	 ps.setString(2,description);
	    	 ps.setString(3,date);
	    	 ps.setString(4,"pending");
	    	 ps.setString(5,"pending");
	    	 ps.setString(6,"pending");
	    	 ps.setString(7,"pending");
	    	 legalstatus=ps.executeUpdate();
	    	 con.close();
    	}
    	 catch(Exception e)
   	 {
   	 e.printStackTrace();
   	 }
   return legalstatus;	
    	
    }
    public static int insertFinance(String title,String description,String date)
    {
    	int financestatus=0;
    	try {
    		Connection con=takeConnection();
    		String query="insert into finance(title,description,request_date,request_by,approval_person,approval_date,status)values(?,?,?,?,?,?,?)";
    		PreparedStatement ps=con.prepareStatement(query);
	    	 ps.setString(1,title);
	    	 ps.setString(2,description);
	    	 ps.setString(3,date);
	    	 ps.setString(4,"pending");
	    	 ps.setString(5,"pending");
	    	 ps.setString(6,"pending");
	    	 ps.setString(7,"pending");
	    	 financestatus=ps.executeUpdate();
	    	 con.close();
    	}
     catch(Exception e)
   	 {
   	    e.printStackTrace();
   	 }
   return financestatus;	
    	 }
    
    public static int updateFinanceRecord(String date,String approver,String status,int id,String title)
    {   
    	int i=0,j=0,temp=0;
    	try
    	{
    		Connection con=takeConnection();
    		String query1="update finance set approval_date=?,approval_person=?,status=? where id=?";
    		PreparedStatement ps1=con.prepareStatement(query1);
	    	 ps1.setString(1,date);
	    	 ps1.setString(2,approver);
	    	 ps1.setString(3,status);
	    	 ps1.setInt(4,id);
	    	 i=ps1.executeUpdate();
	    	 String query2="update department set approval_date=?,approval_person=?,status=? where title=?";
	    	 PreparedStatement ps2=con.prepareStatement(query2);
		     ps2.setString(1,date);
		     ps2.setString(2,approver);
	    	 ps2.setString(3,status);
	    	 ps2.setString(4,title);
		     j=ps2.executeUpdate();
	    	 con.close();
    		
    	}
    	catch(Exception e)
      	 {
      	 e.printStackTrace();
      	 }
    	if(i!=0&&j!=0)
    		temp=1;
    	return temp;
    	
    }
    public static int updateLegalRecord(String date,String approver,String status,int id,String title)
    {   
    	int i=0,j=0,temp=0;
    	try
    	{
    		Connection con=takeConnection();
    		String query1="update legal set approval_date=?,approval_person=?,status=? where id=?";
    		PreparedStatement ps1=con.prepareStatement(query1);
	    	 ps1.setString(1,date);
	    	 ps1.setString(2,approver);
	    	 ps1.setString(3,status);
	    	 ps1.setInt(4,id);
	    	 i=ps1.executeUpdate();
	    	 String query2="update department set approval_date=?,approval_person=?,status=? where title=?";
	    	 PreparedStatement ps2=con.prepareStatement(query2);
		     ps2.setString(1,date);
		     ps2.setString(2,approver);
	    	 ps2.setString(3,status);
	    	 ps2.setString(4,title);
		     j=ps2.executeUpdate();
	    	 con.close();
    		
    	}
    	catch(Exception e)
      	 {
      	 e.printStackTrace();
      	 }
    	if(i!=0&&j!=0)
    		temp=1;
    	return temp;
    	
    }
}


