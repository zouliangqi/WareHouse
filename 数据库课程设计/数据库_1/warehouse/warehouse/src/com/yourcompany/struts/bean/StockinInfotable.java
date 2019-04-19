package com.yourcompany.struts.bean;

public class StockinInfotable {
	String stockInId;
	String goodsId;
	String suppliersId;
	String employeeId;
	int   num;
	String sdocmadetime;
	String stockintime;
	String state;
    int id;
    public StockinInfotable(){}
    public StockinInfotable(String stockInId,String goodsId,String suppliersId,String employeeId,int sGoodsNum,String sDocMadeTime,String stockInTime,String sState,int id)
	{
		this.stockInId=stockInId;
		this.goodsId=goodsId;
		this.suppliersId=suppliersId;
		this.employeeId=employeeId;
		this.num=sGoodsNum;
		this.sdocmadetime=sDocMadeTime;
		this.stockintime=stockInTime;
		this.state=sState;
		this.id=id;
	}
	public String getStockInId() {
		return stockInId;
	}
	public void setStockInId(String stockInId) {
		this.stockInId = stockInId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getSuppliersId() {
		return suppliersId;
	}
	public void setSuppliersId(String suppliersId) {
		this.suppliersId = suppliersId;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSdocmadetime() {
		return sdocmadetime;
	}
	public void setSdocmadetime(String sdocmadetime) {
		this.sdocmadetime = sdocmadetime;
	}
	public String getStockintime() {
		return stockintime;
	}
	public void setStockintime(String stockintime) {
		this.stockintime = stockintime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
}
