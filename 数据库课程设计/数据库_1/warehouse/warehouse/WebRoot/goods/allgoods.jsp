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
				<display:column property="goodsName" title="����" />
				<display:column property="goodsClassId" title="����" />
				<display:column property="suppliersId" title="��Ӧ��" />
				<display:column property="goodsProductPlace" title="����" />
				<display:column property="goodsPrice" title="�۸�" />
				<display:column property="modelOfGoods" title="�ͺ�" />
				<display:column property="volumeOfGoods" title="���" />
				<display:column title="����">
					<a href="/warehouse/goods.do?method=delgoods&goodsId='${goods.goodsId }'">
					<img src="../images/del.gif" width="16" height="16" />ɾ��</a>
				</display:column>
			</display:table>
		</form>
	</center>
</body>
</html:html>

