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
	<meta h00ttp-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
 <body>
  <center>
  <img src="../images/mimaxiugai.png"/>
    <form action="employee.do?method=update" method="post" name="regForm">
		<table  border="0" align="center">
		<tr><img src="../images/mimaweishubunengshaoyusan.png"/></tr>
  <tr>
    <td align="right">&nbsp;原密码:</td>
    <td ><input name="oldpassword" type="text" size="20"></td>
    <td class="STYLE2"><html:errors property="password_error" /></td>
  </tr>
  <tr><td align="right">新密码:</td>
    <td><input name="newpassword" type="text" size="20"></td>
    <td class="STYLE2"><html:errors property="password_notnull" /></td>
  </tr>
   <tr>
    <td align="right">&nbsp;确认新密码:</td>
    <td><input name="connewpassword" type="text" size="20"></td>
    <td class="STYLE2"><html:errors property="conform_error" /></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><input name="regSub" type="submit" value="确定"></td>
    </tr>
</table>

	</form>
	</center>
  </body> 
</html>
