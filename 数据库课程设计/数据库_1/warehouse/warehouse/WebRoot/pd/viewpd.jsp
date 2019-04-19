<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
    
    <title>View.jsp</title>

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
    <form action="" method="post" name="viewForm">
	<table  border="1" align="center">
    <tr>
    <th scope="col">盘点人员ID</th>
    <th scope="col">盘点日期</th>
    <th scope="col">盘点货物名称</th>
    <th scope="col">盘点货物数量</th>
   </tr>
  <logic:present name="list">
  <logic:iterate id="userInfo" name="list">
  <tr>
  	<td ><div align="center"><bean:write name="userInfo"  property="emplyeeId" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="time" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="goodsName" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="num" /></div></td>
 </tr>
 </logic:iterate>
  </logic:present>
</table>
	</form>
	<h2><a href="success2.jsp">返回上一个页面</a></h2>
	</center>
  </body>
</html>
