package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.bean.GoodsTypetable;

public class GoodsTypeDao {
		Conn getcon=new Conn();
		Connection con=getcon.initConnection();
		public ArrayList all(){
			
			String sql = "select * from goodstypetable";
			ArrayList al=new ArrayList();
			try{
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				GoodsTypetable good =new GoodsTypetable();
				good.setGoodsClassId(rs.getString(1));
				good.setGoodsClassName(rs.getString(2));
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
				String sql = "delete from goodstypetable where GoodsClassId = " + goodsId;
			
				PreparedStatement ps = con.prepareStatement(sql);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;	
			}
		
			return true;
		}
}
