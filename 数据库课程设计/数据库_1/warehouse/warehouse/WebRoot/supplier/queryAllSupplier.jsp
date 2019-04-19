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
 <img src="../images/gongyingshangxinxi.png">
<form action="" method="post" name="supplierForm">
<display:table name="al" id="goods" class="mars" pagesize="10"
     requestURI="/supplier.do?method=queryAllSupplier">
			
				<display:column property="suppliersId" title="供应商ID" />
				<display:column property="suppliersName" title="供应商名" />
				<display:column property="suppliersChargePerson" title="联系人" />
				<display:column property="suppliersLocation" title="供应商地址" />
				<display:column property="suppliersTel" title="供应商电话" />
				<display:column property="suppliersEmail" title="供应商Emaile" />
	
				<display:column title="操作">
					<a href="/warehouse/supplier.do?method=delSupplier&suppliersId='${userInfo.suppliersId }'">
					<img src="../images/del.gif" width="16" height="16" />删除</a>
				</display:column>
			</display:table>
</form>
</center>
</body>
</html:html>
