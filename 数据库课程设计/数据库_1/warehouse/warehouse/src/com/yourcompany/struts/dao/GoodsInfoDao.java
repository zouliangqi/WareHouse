package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.bean.GoodsInfotable;


public class GoodsInfoDao {
	Conn getcon=new Conn();
	Connection con=getcon.initConnection();
	public ArrayList all(){
		
		String sql = "select * from goodsinfotable";
		ArrayList al=new ArrayList();
		try{
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			GoodsInfotable good =new GoodsInfotable();
			good.setGoodsId(rs.getString("GoodsId"));
			good.setGoodsName(rs.getString("GoodsName"));
			good.setGoodsClassId(rs.getString("GoodsClassId"));
			good.setSuppliersId(rs.getString("SuppliersId"));
			good.setGoodsProductPlace(rs.getString("GoodsProductPlace"));
			good.setGoodsPrice(Double.parseDouble(rs.getString("GoodsPrice")));
			good.setModelOfGoods(rs.getString("ModelOfGoods"));
			good.setVolumeOfGoods(Double.parseDouble(rs.getString("VolumeOfGoods")));
			al.add(good);
		}}catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}
	public String getgoodsId(String goodsName)
	{
		String goodsId=null;
		try{
			PreparedStatement ps = con.prepareStatement("select GoodsId from goodsinfotable where GoodsName='"+goodsName+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				goodsId=rs.getString("GoodsId");
				System.out.println("goodsId============="+goodsId);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
			return goodsId;
	}
	public String getsupplierId(String goodsName)
	{
		String goodsId=null;
		
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select SuppliersId from goodsinfotable  where GoodsName='"+goodsName+"'");
			if(rs.next())
			{
				goodsId=rs.getString("SuppliersId");
			}
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
			return goodsId;
	}
	public String getclientId(String goodsName)
	{
		String goodsId=null;
		
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select ClientsId from clientsinfotable  where ClientsName='"+goodsName+"'");
			if(rs.next())
			{
				goodsId=rs.getString("ClientsId");
				System.out.println("client============="+goodsId);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
			return goodsId;
	}
	public double getvolumeofgoods(String goodsName)
	{
		double goodsId=0.0;	
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select VolumeOfGoods from goodsinfotable  where GoodsName='"+goodsName+"'");
			if(rs.next())
			{
				goodsId=rs.getDouble("VolumeOfGoods");
				System.out.println("============="+goodsId);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return goodsId;
	}
	
	public boolean add(GoodsInfotable goodsinfotable) throws SQLException{
		Connection con = getcon.initConnection();
		String goodsId=goodsinfotable.getGoodsId();
		String goodsName=goodsinfotable.getGoodsName();
		String goodsClassId=goodsinfotable.getGoodsClassId();
		String suppliersId=goodsinfotable.getSuppliersId();
		String goodsProductPlace=goodsinfotable.getGoodsProductPlace();
		double goodsPrice=goodsinfotable.getGoodsPrice();
		String modelOfGoods=goodsinfotable.getModelOfGoods();
		double volumeOfGoods=goodsinfotable.getVolumeOfGoods();
		String sql= "insert into goodsinfotable values('" + goodsId + "', '"
		+ goodsName + "','" + goodsClassId + "','" + suppliersId
		+ "','" + goodsProductPlace + "','" + goodsPrice + "','"
		+ modelOfGoods + "','" + volumeOfGoods + "')";
		System.out.println("++++++++++"+sql);
		Statement st=con.createStatement();
		return st.execute(sql);
	}
	public boolean del(String goodsId){
		try {
			Connection con= getcon.initConnection();	
			String sql = "delete from goodsinfotable where GoodsId = " + goodsId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
}
