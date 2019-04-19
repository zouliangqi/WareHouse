package com.yourcompany.struts.bean;

public class EmployeeInfotable {
	String employeeId;
	String employeeName;
	String password;
	String department;
	String employeeTel;
	String employeeEmail;
	int loginPower;
	public EmployeeInfotable()
	{}
	public EmployeeInfotable(String suppliersId,String suppliersName,String suppliersChargePerson,String suppliersLocation,String suppliersTel,int suppliersEmail)
	{
		this.employeeId=suppliersId;
		this.employeeName=suppliersName;
		this.department=suppliersChargePerson;
		this.employeeTel=suppliersLocation;
		this.employeeEmail=suppliersTel;
		this.loginPower=suppliersEmail;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmployeeTel() {
		return employeeTel;
	}
	public void setEmployeeTel(String employeeTel) {
		this.employeeTel = employeeTel;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	public int getLoginPower() {
		return loginPower;
	}
	public void setLoginPower(int loginPower) {
		this.loginPower = loginPower;
	}
}
