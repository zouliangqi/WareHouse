<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.yourcompany.struts.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%
  	InstoreInfotable user = (InstoreInfotable)request.getAttribute("goods");
   %>
  <body>
    <form action="instore.do?method=updstore" name="InstoreInfo" method="post">
    	<table border="1" align="center">
    		<tr>
    			<td>区域ID：</td>
    			<td><input type="text" name="districtId" value="'<%=user.getDistrictId() %>'"></td>
    		</tr>
    		<tr>
    			<td>区域体积：</td>
    			<td><input type="text" name="districtVolume" value="<%=user.getDistrictVolume() %>"></td>
    		</tr>
    		<tr>
    			<td>最大体积：</td>
    			<td><input type="text" name="goodVolumeMax" value="<%=user.getGoodVolumeMax() %>"></td>
    		</tr>
    		<tr>
    			<td>最小体积：</td>
    			<td><input type="text" name="goodVolumeMin" value="<%=user.getGoodVolumeMin() %>"></td>
    		</tr>
    		<tr>
    			<td><input type="submit" name="sub" value="修改"></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
