package com.yourcompany.struts.form;

import org.apache.struts.action.ActionForm;

public class goodsForm extends ActionForm{
	private String goodsId;
	private String goodsName;
	private String goodsClassId;
	private String suppliersId;
	private String goodsProductPlace;
	private double goodsPrice;
	private String modelOfGoods;
	private double volumeOfGoods;
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsClassId() {
		return goodsClassId;
	}
	public void setGoodsClassId(String goodsClassId) {
		this.goodsClassId = goodsClassId;
	}
	public String getSuppliersId() {
		return suppliersId;
	}
	public void setSuppliersId(String suppliersId) {
		this.suppliersId = suppliersId;
	}
	public String getGoodsProductPlace() {
		return goodsProductPlace;
	}
	public void setGoodsProductPlace(String goodsProductPlace) {
		this.goodsProductPlace = goodsProductPlace;
	}
	public double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getModelOfGoods() {
		return modelOfGoods;
	}
	public void setModelOfGoods(String modelOfGoods) {
		this.modelOfGoods = modelOfGoods;
	}
	public double getVolumeOfGoods() {
		return volumeOfGoods;
	}
	public void setVolumeOfGoods(double volumeOfGoods) {
		this.volumeOfGoods = volumeOfGoods;
	}
}