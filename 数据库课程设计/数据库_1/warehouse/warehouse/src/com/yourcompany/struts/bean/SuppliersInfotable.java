package com.yourcompany.struts.bean;

public class SuppliersInfotable {
	String suppliersId;
	String suppliersName;
	String suppliersChargePerson;
	String suppliersLocation;
	String suppliersTel;
	String suppliersEmail;
	public SuppliersInfotable()
	{}
	public SuppliersInfotable(String suppliersId,String suppliersName,String suppliersChargePerson,String suppliersLocation,String suppliersTel,String suppliersEmail)
	{
		this.suppliersId=suppliersId;
		this.suppliersName=suppliersName;
		this.suppliersChargePerson=suppliersChargePerson;
		this.suppliersLocation=suppliersLocation;
		this.suppliersTel=suppliersTel;
		this.suppliersEmail=suppliersEmail;
	}

	public String getSuppliersId() {
		return suppliersId;
	}

	public void setSuppliersId(String suppliersId) {
		this.suppliersId = suppliersId;
	}

	public String getSuppliersName() {
		return suppliersName;
	}

	public void setSuppliersName(String suppliersName) {
		this.suppliersName = suppliersName;
	}

	public String getSuppliersChargePerson() {
		return suppliersChargePerson;
	}

	public void setSuppliersChargePerson(String suppliersChargePerson) {
		this.suppliersChargePerson = suppliersChargePerson;
	}

	public String getSuppliersLocation() {
		return suppliersLocation;
	}

	public void setSuppliersLocation(String suppliersLocation) {
		this.suppliersLocation = suppliersLocation;
	}

	public String getSuppliersTel() {
		return suppliersTel;
	}

	public void setSuppliersTel(String suppliersTel) {
		this.suppliersTel = suppliersTel;
	}

	public String getSuppliersEmail() {
		return suppliersEmail;
	}

	public void setSuppliersEmail(String suppliersEmail) {
		this.suppliersEmail = suppliersEmail;
	}

}
