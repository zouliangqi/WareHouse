<%@ include file="/Taglibs.jsp"%>
<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>
<%@ page import="com.yourcompany.struts.bean.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title>goodstype.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  <center>
    <form action="" method="post" name="goodsType">
     <display:table name="al" id="goods" class="mars" pagesize="10"
     requestURI="/goodstype.do?method=allgoodstype">
			
				<display:column property="goodsClassId" title="商品分类ID" />
				<display:column property="goodsClassName" title="商品分类" />
			
	
	
				<display:column title="操作">
					<a href="/warehouse/goodstype.do?method=delgoodstype&goodsClassId='${goods.goodsClassId }'">
					<img src="../images/del.gif" width="16" height="16" />删除</a>
				</display:column>
				</display:table>
</form>
	</center>
  </body>
</html:html>

