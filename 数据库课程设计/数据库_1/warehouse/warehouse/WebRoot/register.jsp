
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
 <head>
<title>个人用户注册页面</title>
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE3 {font-size: 14px}
.STYLE4 {color: #FF0000}
.STYLE5 {font-size: 14px; color: #FF0000; }
-->
</style>
</head>

<body>
  
  
  <body>
    <form action="register.do" name="myForm" method="post">
    	<table align="center">

    		<tr> 用户ID：</tr><tr><input type="text" name="employeeId"></tr>
    	    <tr> 用户名：</tr><tr><input type="text" name="employeeName"></tr>
    		<tr> 密码：</tr><tr><input type="password" name="password"></tr>
    		<tr> 部门：</tr><tr><input type="text" name="department"></tr>
    		<tr> 电话：</tr><tr><input type="text" name="employeeTel"></tr>
    		<tr> 邮箱：</tr><tr><input type="text" name="employeeEmail"></tr>
    		
    		<tr><input type="submit" value="提交" ></tr>
  
    	</table>
    </form>
  </body>
</html>