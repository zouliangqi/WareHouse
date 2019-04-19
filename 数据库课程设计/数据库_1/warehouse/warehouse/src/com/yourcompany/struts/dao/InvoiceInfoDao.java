package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yourcompany.struts.bean.InvoiceInfotable;

public class InvoiceInfoDao {
	Conn getcon = new Conn();
	
	public ArrayList view(){
		ArrayList list = new ArrayList(2);
		InvoiceInfotable sit=new InvoiceInfotable();
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from invoiceinfotable where IState = '未处理'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sit=new InvoiceInfotable(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9));
			
				list.add(sit);
			 }
		   } catch (SQLException e) {
			  e.printStackTrace();
			  return null;
		 }
		return list;
	}
	
	public boolean upd(String goodsId){
		try {
			Connection con= getcon.initConnection();	
			String sql = "update invoiceinfotable set IState='已处理' where ID = " + goodsId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
}
