package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.yourcompany.struts.bean.SuppliersInfotable;

public class SuppliersInfoDao {
	Conn getcon=new Conn();
	private  SuppliersInfotable suppliersinfotable;
	
	public ArrayList queryUser(){
		ArrayList al = new ArrayList(2);
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from suppliersinfotable");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				suppliersinfotable = null;
				suppliersinfotable = new SuppliersInfotable(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
				al.add(suppliersinfotable);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	public boolean addSupplier(SuppliersInfotable user){
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("insert into suppliersinfotable(SuppliersId,SuppliersName,SuppliersChargePerson,SuppliersLocation,SuppliersTel,SuppliersEmail) " +
					"values(?,?,?,?,?,?)");
			ps.setString(1, user.getSuppliersId());
			ps.setString(2, user.getSuppliersName());
			ps.setString(3, user.getSuppliersChargePerson());
			ps.setString(4, user.getSuppliersLocation());
			ps.setString(5, user.getSuppliersTel());
			ps.setString(6, user.getSuppliersEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
			
	}
	public boolean del(String SuppliersId){
		try {
			Connection con= getcon.initConnection();	
			String sql = "delete from suppliersinfotable where SuppliersId= " + SuppliersId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
}
