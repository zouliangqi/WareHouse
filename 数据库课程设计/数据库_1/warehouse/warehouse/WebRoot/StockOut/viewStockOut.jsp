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
    <th scope="col">��ⵥID</th>
    <th scope="col">��ƷID</th>
    <th scope="col">��Ӧ��ID</th>
    <th scope="col">ְԱID</th>
    <th scope="col">�����Ʒ����</th>
    <th scope="col">��ⵥ������ʱ��</th>
    <th scope="col">����Ա����ʱ��</th>
    <th scope="col">��ⵥ��״̬</th>
    <th scope="col">�Զ����</th>
   </tr>
  <logic:present name="list">
  <logic:iterate id="userInfo" name="list">
  <tr>
  	<td ><div align="center"><bean:write name="userInfo"  property="stockoutId" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="goodsId" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="suppliersId" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="employeeId" /></div></td>
        <td><div align="center"><bean:write name="userInfo"   property="num" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="sdocmadetime" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="stockintime" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="state" /></div></td>
    <td><div align="center"><bean:write name="userInfo"   property="id" /></div></td>

   </tr>
 </logic:iterate>
  </logic:present>
</table>
	</form>
	<h2><a href="success2.jsp">������һ��ҳ��</a></h2>
	</center>
  </body>
</html>