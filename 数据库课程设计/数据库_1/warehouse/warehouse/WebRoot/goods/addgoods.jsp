<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <html:base />
    <base href="<%=basePath%>">
    
    <title>My JSP 'addgoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <center>
  <img src="../images/tianjiashangpin.png"/>
   <form action="/warehouse/goods.do?method=addgoods" method="post"name="goodsForm">
   <table align ="center">
   		<tr>
   			<td>商品ID</td>
   			<td><input type="text" name="goodsId"/></td>
   		</tr>
   		<tr>
   			<td>商品名称</td>
   			<td><input type="text" name="goodsName"/></td>
   		</tr>
    	<tr>
   			<td>商品分类ID</td>
   			<td><input type="text" name="goodsClassId"/></td>
   		</tr>
   		<tr>
   			<td>供应商ID</td>
   			<td><input type="text" name="suppliersId"/></td>
   		</tr>
    		<tr>
   			<td>商品产地</td>
   			<td><input type="text" name="goodsProductPlace"/></td>
   		</tr>
   		<tr>
   			<td>商品采购价</td>
   			<td><input type="text" name="goodsPrice"/></td>
   		</tr>
    	<tr>
   			<td>商品型号</td>
   			<td><input type="text" name="modelOfGoods"/></td>
   		</tr>
   		<tr>
   			<td>商品体积</td>
   			<td><input type="text" name="volumeOfGoods"/></td>
   		</tr>  		
   		<tr>
   			<td><input type="submit" name="submit" value="提交"/></td>
   		</tr>
   	</table>  		
   </form>
   
  </body>
</html>
