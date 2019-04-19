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
   <form action="" method="post" name="viewForm">
   <table>
    <tr>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">入库单ID</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品ID</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">供应商ID</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">职员ID</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">入库商品数量</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">入库单据生成时间</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">操作员操作时间</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">入库单据状态</span></div></td>
     <td width="3%" height="22" background="../images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">自动编号</span></div></td>
   </tr>
  <logic:present name="list">
  <logic:iterate id="userInfo" name="list">
  <tr>
  	<td class="STYLE1"><div align="center"><bean:write name="userInfo"  property="stockInId" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="goodsId" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="suppliersId" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="employeeId" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="num" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="sdocmadetime" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="stockintime" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="state" /></div></td>
    <td class="STYLE1"><div align="center"><bean:write name="userInfo"   property="id" /></div></td>
   </logic:iterate>
  </logic:present>
</table>
</form>
	<h2><a href="success2.jsp">返回上一个页面</a></h2>
</center>
 </body>
</html>