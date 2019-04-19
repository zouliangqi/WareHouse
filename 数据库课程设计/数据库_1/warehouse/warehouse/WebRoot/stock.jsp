
<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>
<%@ page import="com.yourcompany.struts.bean.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title>all.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.STYLE1 {font-size: 12px}
	.STYLE3 {font-size: 12px; font-weight: bold; }
	.STYLE4 {
		color: #03515d;
		font-size: 12px;
	}
	-->
	</style>
  </head>
  
  <body>
  <center>
    <form action="" method="post" name="goodstock">
	<table>
  <tr>
    <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品ID</span></div></td>
    <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品数量</span></div></td>
    <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">区域</span></div></td>
  	<td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">基本操作</span></div></td>
  </tr>
  <logic:present name="al">
  <logic:iterate id="goods" name="al">
  <tr>
  	<td class="STYLE1"><div align="center"><bean:write name="goods" property="goodsId"/></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="goods" property="goodsNum"/></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="goods" property="districtId"/></div></td>
    <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="../images/del.gif" width="16" height="16"/><a href="/warehouse/goodsstock.do?method=delgoodsstock&goodsId='${goods.goodsId }'">删除</a></span></div></td>
 </tr>
 </logic:iterate>
  </logic:present>
</table>
	</form>
	</center>
  </body>
</html:html>

