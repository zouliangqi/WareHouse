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
			
				<display:column property="suppliersId" title="��Ӧ��ID" />
				<display:column property="suppliersName" title="��Ӧ����" />
				<display:column property="suppliersChargePerson" title="��ϵ��" />
				<display:column property="suppliersLocation" title="��Ӧ�̵�ַ" />
				<display:column property="suppliersTel" title="��Ӧ�̵绰" />
				<display:column property="suppliersEmail" title="��Ӧ��Emaile" />
	
				<display:column title="����">
					<a href="/warehouse/supplier.do?method=delSupplier&suppliersId='${userInfo.suppliersId }'">
					<img src="../images/del.gif" width="16" height="16" />ɾ��</a>
				</display:column>
			</display:table>
</form>
</center>
</body>
</html:html>
