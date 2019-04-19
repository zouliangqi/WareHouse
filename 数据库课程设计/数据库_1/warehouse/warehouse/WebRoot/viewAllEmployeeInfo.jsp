<%@ include file="/Taglibs.jsp"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
        <base href="<%=basePath%>">
    
    <title>View.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
  <center>
  <img src="../images/yonghuguanli.png"/>
    <form action="" method="post" name="viewForm">
      <display:table name="al" id="userInfo" class="mars" pagesize="10"
     requestURI="/employee.do?method=viewAllEmployeeInfo">
			
				<display:column property="employeeId" title="用户ID" />
				<display:column property="employeeName" title="用户名字" />
				<display:column property="department" title="用户部门" />
				<display:column property="employeeTel" title="用户电话" />
				<display:column property="employeeEmail" title="用户Emaile" />
				<display:column property="loginPower" title="用户权限" />
		
			
	
			</display:table>
	</form>
	
	</center>
  </body>
</html:html>
