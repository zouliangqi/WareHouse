package com.yourcompany.struts.form;

import org.apache.struts.action.ActionForm;

public class LoginForm extends ActionForm{
	
	private String password;
	private String employeeId;
	private String employeeName;
	private String department;
	private String employeeTel;
	private String employeeEmail;
	private int loginPower;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
