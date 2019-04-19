package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.yourcompany.struts.bean.OperatereCordtable;
import com.yourcompany.struts.bean.OperatereCordtable1;
import com.yourcompany.struts.bean.Temp2;

public class OperaterecordDao {
	Conn getcon = new Conn();
	Connection con=getcon.initConnection();
	public boolean addpd(String employeeId,String type,String time,String goodsName,String num){
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("insert into operaterecordtable(EmployeeId,OperateType,OperateTime,OperateInfo,AddInfo) " +
					"values(?,?,?,?,?)");
			ps.setString(1, employeeId);
			ps.setString(2, type);
			ps.setString(3, time);
			ps.setString(4, goodsName);
			ps.setString(5, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
			
	}
	public ArrayList viewpd(){
		ArrayList list = new ArrayList(2);
		OperatereCordtable ort=null;
		String type="盘点";
		try {
			Connection conn=getcon.initConnection();
			PreparedStatement ps = conn.prepareStatement("select * from operaterecordtable where OperateType ='" + type +"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("=========chenchaohui");
				ort.setEmplyeeId(rs.getString(2));
				System.out.println(ort.getEmplyeeId());
				ort.setTime(rs.getString(4));
				ort.setGoodsName(rs.getString(5));
				ort.setNum(rs.getString(6));
				list.add(ort);
			 }
		   } catch (SQLException e) {
			  e.printStackTrace();
			  return null;
		 }
		return list;
	}
public ArrayList all(){
	    Connection con=getcon.initConnection();
		String sql = "select * from operaterecordtable where OperateType ='盘点'";
		ArrayList al=new ArrayList();
		try{
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			OperatereCordtable1 good =new OperatereCordtable1();
			good.setOperateId(rs.getString(1));
			good.setEmployeeId(rs.getString(2));
			good.setOperateType(rs.getString(3));
			good.setOperateTime(rs.getString(4));
			good.setOperateInfo(rs.getString(5));
			good.setAddInfo(rs.getString(6));
			good.setApproval(rs.getString(7));
			al.add(good);
		}}catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}

public ArrayList allop(){
	
	String sql = "select * from operaterecordtable";
	ArrayList al=new ArrayList();
	try{
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
		OperatereCordtable1 good =new OperatereCordtable1();
		good.setOperateId(rs.getString(1));
		good.setEmployeeId(rs.getString(2));
		good.setOperateType(rs.getString(3));
		good.setOperateTime(rs.getString(4));
		good.setOperateInfo(rs.getString(5));
		good.setApproval(rs.getString(6));
		good.setAddInfo(rs.getString(7));
		al.add(good);
	}}catch(Exception e)
	{
		e.printStackTrace();
	}
	return al;
}

public ArrayList allexception(){
	
	String sql = "select * from operaterecordtable,goodsstocktable where operaterecordtable.Approval='已审批' and operaterecordtable.OperateInfo=goodsstocktable.GoodsId";
	ArrayList al=new ArrayList();
	try{
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
		Temp2 ord = new Temp2();
		ord.setGoodsId(rs.getString("OperateInfo"));
		ord.setGoodsNum(rs.getInt("GoodsNum"));
		ord.setAddInfo(rs.getString("AddInfo"));
		al.add(ord);
	}}catch(Exception e)
	{
		e.printStackTrace();
	}
	return al;
}






}
