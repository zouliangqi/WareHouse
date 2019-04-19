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
   <img src="../images/wodexinxi.png">
    <form action="" method="post" name="viewForm">
   <%
      EmployeeInfotable  eit =(EmployeeInfotable)request.getAttribute("eit");
   %>
	<table width="500" border="1" align="center">
  <tr>
     <td width="159" scope="col" align="center">用户ID</td>
     <td ><div align="center"><%=eit.getEmployeeId() %></div></td>
  </tr>
  <tr>
     <td width="159" scope="col" align="center">用户名字</td>
     <td ><div align="center"><%=eit.getEmployeeName() %></div></td>
  </tr>
  <tr>
     <td width="159" scope="col" align="center">用户部门</td>
     <td ><div align="center"><%=eit.getDepartment() %></div></td>
  </tr>
  <tr>
     <td width="159" scope="col" align="center">用户电话</td>
     <td ><div align="center"><%=eit.getEmployeeTel() %></div></td>
   </tr>
   <tr>
     <td width="159" scope="col" align="center">用户Email</td>
     <td ><div align="center"><%=eit.getEmployeeEmail() %></div></td>
   </tr>
</table>
	</form>	
	</center>
  </body>
</html:html>
