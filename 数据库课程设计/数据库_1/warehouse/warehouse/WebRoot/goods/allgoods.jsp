<%@ include file="/Taglibs.jsp"%>
<%@ page language="java" pageEncoding="gbk" contentType="text/html;charset=gbk"%>

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

</head>

<body>
	<center>
		<img src="../images/quanbushangpinxinxi.png" />
		<form action="" method="post" name="goodsForm">
			<display:table name="al" id="goods" class="mars" pagesize="10"
				requestURI="/goods.do?method=allgoods">
				<display:column property="goodsId" title="ID" />
				<display:column property="goodsName" title="名称" />
				<display:column property="goodsClassId" title="分类" />
				<display:column property="suppliersId" title="供应商" />
				<display:column property="goodsProductPlace" title="产地" />
				<display:column property="goodsPrice" title="价格" />
				<display:column property="modelOfGoods" title="型号" />
				<display:column property="volumeOfGoods" title="体积" />
				<display:column title="操作">
					<a href="/warehouse/goods.do?method=delgoods&goodsId='${goods.goodsId }'">
					<img src="../images/del.gif" width="16" height="16" />删除</a>
				</display:column>
			</display:table>
		</form>
	</center>
</body>
</html:html>

