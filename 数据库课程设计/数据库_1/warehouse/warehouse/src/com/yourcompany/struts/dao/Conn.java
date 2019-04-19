package com.yourcompany.struts.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;


public class Conn {

	private Connection conn = null;

	public Connection initConnection() {// 初始化数据库连接
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/ewarehouse";
			String user = "root";
			String password = "123";
			conn = (Connection) DriverManager
					.getConnection(url, user, password);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	public ResultSet query(String sql) {
		ResultSet rs = null;
		try{
		this.initConnection();
		rs =conn.createStatement().executeQuery(sql);
		}catch(Exception e)
		{
		 e.printStackTrace();
		}
		return rs;
	}

	public void update(String sql) {
		try {
			this.initConnection();
			conn.createStatement().executeUpdate(sql);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.closeConnection();
		}
	}

	public void closeConnection() {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
