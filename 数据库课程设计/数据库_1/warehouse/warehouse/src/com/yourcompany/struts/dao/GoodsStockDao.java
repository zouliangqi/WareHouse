package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.bean.GoodsStocktable;

public class GoodsStockDao {
	Conn getcon=new Conn();
	Connection con=getcon.initConnection();
	public ArrayList all(){
		
		String sql = "select * from goodsstocktable";
		ArrayList al=new ArrayList();
		try{
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			GoodsStocktable good =new GoodsStocktable();
			good.setGoodsId(rs.getString(1));
			good.setGoodsNum(rs.getInt(2));
			good.setDistrictId(rs.getString(3));
			al.add(good);
		}}catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}
	
	
	public boolean del(String goodsId){
		try {
			Connection con= getcon.initConnection();	
			String sql = "delete from goodsstocktable where GoodsId = " + goodsId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
	public String getdistrictName(String goodsId)
	{
		String sql = "select DistrictName from goodsstocktable  where GoodsId="+goodsId;
		String districtName=null;
		
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				districtName=rs.getString(1);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
			return districtName;
	}
	public int getgoodsNum(String goodsId)
	{
		String sql = "select GoodsNum from goodsstocktable  where GoodsId="+goodsId;
		int goodsNum=0;
		
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				goodsNum= rs.getInt(1);
			}
			}catch(Exception e)
			{
				e.printStackTrace();
				return 0;
			}
			return goodsNum;
	}
	public String updategoodsNum(String goodsId,int goodsNum)
	{
		String DistrictName=null;
		
		try{
			PreparedStatement ps = con.prepareStatement("update goodsstocktable set GoodsNum='"+goodsNum+"' where GoodsId='"+goodsId+"'");
			ps.executeUpdate();
			System.out.println("================chenchaohui");
			}catch(Exception e)
			{
				e.printStackTrace();
				return null;
			}
			return DistrictName;
	}
}
