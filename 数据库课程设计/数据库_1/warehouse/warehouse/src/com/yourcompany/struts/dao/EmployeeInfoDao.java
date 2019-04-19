package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.Exception.AppException;
import com.yourcompany.struts.bean.EmployeeInfotable;

public class EmployeeInfoDao {
	Conn getCon = new Conn();
	public boolean register(EmployeeInfotable employee)
	{
		try{
	
		Connection con = getCon.initConnection();
		String sql="insert into employeeinfotable(EmployeeId,EmployeeName,Password,Department,EmployeeTel,EmployeeEmail)"+"values(?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, employee.getEmployeeId());
		ps.setString(2,employee.getEmployeeName());
		ps.setString(5, employee.getPassword());
		ps.setString(3, employee.getDepartment());
		ps.setString(4, employee.getEmployeeTel());		
		ps.setString(6, employee.getEmployeeEmail());
		
		ps.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
		return false;
	}
	return true;

	}
	public String password(String employeeId){
		Connection conn=getCon.initConnection();
		String password=null;
		String sql="select Password from employeeinfotable where EmployeeId = '"
			+ employeeId + "'";
		 try{
			 Statement st = conn.createStatement();
			    ResultSet rs =st.executeQuery(sql);
		    rs.next();
		    password = rs.getString(1);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		  return password;
		}
	public EmployeeInfotable viewEmployeeInfo(String employeeId){
		Connection conn=getCon.initConnection();
		EmployeeInfotable eit=new EmployeeInfotable();
		String sql="select * from employeeinfotable where EmployeeId = '"
			+ employeeId + "'";
		 try{
		    Statement st = conn.createStatement();
		    ResultSet rs =st.executeQuery(sql);
		    rs.next();
		    eit.setEmployeeId(rs.getString("EmployeeId"));
		    eit.setEmployeeName(rs.getString("EmployeeName"));
		    eit.setDepartment(rs.getString("Department"));
		    eit.setEmployeeTel(rs.getString("EmployeeTel"));
		    eit.setEmployeeEmail(rs.getString("EmployeeEmail"));
		    	return eit;
		     }catch(Exception e){
			 e.printStackTrace();
			 return null;
		 }
		}
	public boolean updateUser(String newpassword, String employeeId) {
		try {
			Connection conn = getCon.initConnection();
			String sql = "update employeeinfotable set Password = '"
					+ newpassword + "' where EmployeeId = '" + employeeId + "'";
			System.out.println("sql=============================" + sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new AppException("update_error");
		}
	      return true;
	}
	public ArrayList viewAllEmployeeInfo(){
		ArrayList al = new ArrayList();
		try {
			Connection conn=getCon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from employeeinfotable");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				EmployeeInfotable eit=new EmployeeInfotable();
				eit.setEmployeeId(rs.getString(1));
				eit.setEmployeeName(rs.getString(2));
				eit.setPassword(rs.getString(3));
				eit.setDepartment(rs.getString(4));
				eit.setEmployeeTel(rs.getString(5));
				eit.setEmployeeEmail(rs.getString(6));
				eit.setLoginPower(rs.getInt(7));
				
				al.add(eit);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
}

