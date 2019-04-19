<%@ include file="/Taglibs.jsp"%>
<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>

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
	
	
  </head>
  
  <body>
  <center>
    <form action="" method="post" name="goodstock">
     <display:table name="al" id="goods" class="mars" pagesize="10"
         requestURI="/goodsstock.do?method=allgoodsstock">
				<display:column property="goodsId" title="商品ID" />
				<display:column property="goodsNum" title="商品数量" />
				<display:column property="districtId" title="区域" />
				<display:column title="操作">
					<a href="/warehouse/goodsstock.do?method=delgoodsstock&goodsId='${goods.goodsId }'">
					<img src="../images/del.gif" width="16" height="16" />删除</a>
				</display:column>
			</display:table>
    </form>
	</center>
  </body>
</html:html>

