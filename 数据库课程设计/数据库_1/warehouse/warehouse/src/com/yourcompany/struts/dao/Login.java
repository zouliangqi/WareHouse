package com.yourcompany.struts.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.yourcompany.struts.Exception.AppException;
import com.yourcompany.struts.bean.EmployeeInfotable;

public class Login {
	Conn getcon=new Conn();
	Connection conn=getcon.initConnection();
	public EmployeeInfotable login(String employeeId,String password){
		EmployeeInfotable em = new EmployeeInfotable();
		String sql="select * from employeeinfotable where EmployeeId = '"
			+ employeeId + "'and Password ='" + password + "'";
		 System.out.println("sql========" +sql);
		 try{
		  Statement st = conn.createStatement();
		  ResultSet rs =st.executeQuery(sql);
		  rs.next();
	      em.setEmployeeId(rs.getString("EmployeeId"));
	      em.setEmployeeName("EmployeeName");
	      em.setPassword("Password");
	      em.setDepartment(rs.getString("Department"));
	      em.setEmployeeTel("EmployeeTel");
	      em.setEmployeeEmail("EmployeeEmail");
		  em.setLoginPower(rs.getInt("LoginPower"));
		 }catch(Exception e){
			 e.printStackTrace();
			 throw new AppException("Login_error");
		 }
		  return em;
		}
					
}