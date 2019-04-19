package com.yourcompany.struts.form;

import org.apache.struts.action.ActionForm;

public class InstoreInfo extends ActionForm{
	private String freeVolume;

	private String goodsClassId;

	private String goodVolumeMin;

	private String districtVolume;

	private String goodVolumeMax;

	private String districtName;

	private String districtId;

	public String getFreeVolume() {
		return freeVolume;
	}

	public void setFreeVolume(String freeVolume) {
		this.freeVolume = freeVolume;
	}

	public String getGoodsClassId() {
		return goodsClassId;
	}

	public void setGoodsClassId(String goodsClassId) {
		this.goodsClassId = goodsClassId;
	}

	public String getGoodVolumeMin() {
		return goodVolumeMin;
	}

	public void setGoodVolumeMin(String goodVolumeMin) {
		this.goodVolumeMin = goodVolumeMin;
	}

	public String getDistrictVolume() {
		return districtVolume;
	}

	public void setDistrictVolume(String districtVolume) {
		this.districtVolume = districtVolume;
	}

	public String getGoodVolumeMax() {
		return goodVolumeMax;
	}

	public void setGoodVolumeMax(String goodVolumeMax) {
		this.goodVolumeMax = goodVolumeMax;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

}
