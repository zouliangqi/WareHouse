package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yourcompany.struts.bean.InvoiceInfotable;
import com.yourcompany.struts.bean.StockinInfotable;

public class StockIninDao {
	Conn getcon = new Conn();
	public ArrayList viewStockIo(){
		ArrayList list = new ArrayList(2);
		StockinInfotable sit=null;
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from stockininfotable");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sit=new StockinInfotable(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9));
			
				list.add(sit);
			 }
		   } catch (SQLException e) {
			  e.printStackTrace();
			  return null;
		 }
		return list;
	}
	public ArrayList viewStockOut(){
		ArrayList list = new ArrayList(2);
		InvoiceInfotable sit= new InvoiceInfotable();
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from invoiceinfotable");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sit=new InvoiceInfotable(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8));
			
				list.add(sit);
			 }
		   } catch (SQLException e) {
			  e.printStackTrace();
			  return null;
		 }
		return list;
	}
	public boolean addStockIo(String stockinId,String goodsId,String supplier,String employeeId,int num,String sdocmadetime){
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("insert into stockininfotable(StockInId,GoodsId,SuppliersId,EmployeeId,SGoodsNum,SDocMadeTime) " +
					"values(?,?,?,?,?,?)");
			ps.setString(1, stockinId);
			ps.setString(2, goodsId);
			ps.setString(3, supplier);
			ps.setString(4, employeeId);
			ps.setInt(5, num);
			ps.setString(6, sdocmadetime);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
			
	}
	public boolean addStockOut(InvoiceInfotable iit){
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("insert into invoiceinfotable(InvoiceId,GoodsId,ClientsId,EmployeeId,IGoodsNum,IDocMadeTime,EmployeeApprovalTime,IState) " +
					"values(?,?,?,?,?,?,?,?)");
			System.out.println("asjkdhakdskhdasjkhdkjsa======");
			ps.setString(1,iit.getStockoutId());
			ps.setString(2, iit.getGoodsId());
			ps.setString(3, iit.getSuppliersId());
			ps.setString(4, iit.getEmployeeId());
			ps.setInt(5,iit.getNum());
			ps.setString(6, iit.getSdocmadetime());
			ps.setString(7, iit.getStockintime());
			ps.setString(8, iit.getState());
			ps.executeUpdate();
			System.out.println("asjkdhakdskhdasjkhdkjsa======");
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
			
	}
	public ArrayList viewin(){
		ArrayList list = new ArrayList(2);
		StockinInfotable sit=new StockinInfotable();
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from stockininfotable where SState = '未处理'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sit=new StockinInfotable(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9));
			
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
			String sql = "update stockininfotable set SState='已处理' where ID = " + goodsId;
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;	
		}
	
		return true;
	}
}
