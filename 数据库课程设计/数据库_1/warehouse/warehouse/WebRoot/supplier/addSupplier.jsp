<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk" contentType="text/html;charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <html:base />
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
  <center>
  <img src="../images/tianjiagongyingshang.png"/>
 
    <form action="/warehouse/supplier.do?method=addSupplier" method="post" name="regForm">
		<table width="400" border="0" align="center">
  <tr>
    <td width="133" align="right">&nbsp;供应商ID</td>
    <td width="257"><input name="suppliersId" type="text" size="20"></td>
  </tr>
  <tr>
    <td align="right">&nbsp;供应商名称</td>
    <td><input name="suppliersName" type="text" size="20"></td>
  </tr>
   <tr>
    <td align="right">&nbsp;供应商联系人</td>
    <td><input name="suppliersChargePerson" type="text" size="20"></td>
  </tr>
  <tr>
    <td align="right">&nbsp;供应商地址</td>
    <td><input name="suppliersLocation" type="text" size="20"></td>
  </tr>
  <tr>
    <td align="right">&nbsp;供应商联系电话</td>
    <td><input name="suppliersTel" type="text" size="20"></td>
  </tr>
  <tr>
    <td align="right">&nbsp;供应商Email</td>
    <td><input name="suppliersEmail" type="text" size="20"></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="regSub" type="submit" value="添加"></td>
    </tr>
</table>

	</form>
  </body>
</html>
