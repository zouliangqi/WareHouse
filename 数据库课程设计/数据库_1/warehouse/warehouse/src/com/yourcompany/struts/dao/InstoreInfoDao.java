package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.bean.InstoreInfotable;


public class InstoreInfoDao {
	
	Conn getcon=new Conn();
	Connection con=getcon.initConnection();
	public ArrayList all(){
		
		String sql = "select * from instoreinfotable";
		ArrayList al=new ArrayList();
		try{
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			InstoreInfotable good =new InstoreInfotable();
			good.setDistrictId(rs.getString(1));
			good.setDistrictName(rs.getString(2));
			good.setGoodsClassId(rs.getString(3));
			good.setDistrictVolume(rs.getDouble(4));
			good.setGoodVolumeMax(rs.getDouble(5));
			good.setGoodVolumeMin(rs.getDouble(6));
			good.setFreeVolume(rs.getDouble(7));
			
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
			String sql = "delete from instoreinfotable where DistrictId = " + goodsId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
	public InstoreInfotable getId(String id)throws Exception
	{	
		Statement st = con.createStatement();
		
		String sql = "select * from InstoreInfotable where DistrictId = " + id ;
		
		System.out.println(sql + "***********");
		
		ResultSet rs = st.executeQuery(sql);
		
		InstoreInfotable good =new InstoreInfotable();
				
		if (rs.next())
		{
			good.setDistrictId(rs.getString(1));
			good.setDistrictName(rs.getString(2));
			good.setGoodsClassId(rs.getString(3));
			good.setDistrictVolume(rs.getDouble(4));
			good.setGoodVolumeMax(rs.getDouble(5));
			good.setGoodVolumeMin(rs.getDouble(6));
			good.setFreeVolume(rs.getDouble(7));
			return good;
		}
		else
		{
			return null;
		}
		
	}
	public boolean updUser(String id,String userName,String password,String address)throws Exception
	{
				
		Statement st = con.createStatement();
		
		String sql ="update instoreinfotable set DistrictVolume='"+userName+"',GoodVolumeMax='"+password+"',GoodVolumeMin='"+address+"'where DistrictId=" + id;
		
		System.out.println(sql + "***********");
		
		return st.execute(sql);
			

	}
	public double getfreeVolume(String districtName)
	{
		double freeVolume=0.0;
		try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("select FreeVolume from instoreinfotable  where DistrictId='"+districtName+"'");
			if(rs.next())
			{
				freeVolume= rs.getInt("FreeVolume");
			}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return freeVolume;
	}
	public String updategoodsNum(double freeVolume,String districtName)
	{
		String DistrictName=null;
		try{
			PreparedStatement ps = con.prepareStatement("update instoreinfotable set FreeVolume='"+freeVolume+"' where DistrictId='"+districtName+"'");
			ps.executeUpdate();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return DistrictName;
	}
}
