<%@ include file="/Taglibs.jsp"%>
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
	
		<style type="text/css">
	
	</style>
  </head>
  
   <body>
  <center>
    <form action="" method="post" name="InstoreInfo">
     <display:table name="al" id="goods" class="mars" pagesize="10"
     requestURI="/instore.do?method=allstore">
			
				<display:column property="districtId" title="区位ID" />
				<display:column property="districtVolume" title="区位体积" />
				<display:column property="goodVolumeMax" title="最大库存" />
				<display:column property="goodVolumeMin" title="最小库存" />
	
	
				<display:column title="操作">
					<a href="/warehouse/instore.do?method=getId&districtId='${goods.districtId }'">
					<img src="../images/del.gif" width="16" height="16" />修改</a>
				</display:column>
			</display:table></form>
	</center>
  </body>
</html:html>