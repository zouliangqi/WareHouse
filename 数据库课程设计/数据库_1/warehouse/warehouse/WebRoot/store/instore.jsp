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

  <img src="../images/quweifenleiguanli.png"/>
    <form action="" method="post" name="InstoreInfo">
     <display:table name="al" id="goods" class="mars" pagesize="10"
     requestURI="/instore.do?method=allinstore">
			
				<display:column property="districtId" title="��λID" />
				<display:column property="districtName" title="��λ����" />
				<display:column property="goodsClassId" title="��Ʒ����" />
				<display:column property="districtVolume" title="��λ���" />
				<display:column property="freeVolume" title="�������" />
	
				<display:column title="����">
					<a href="/warehouse/instore.do?method=delinstore&districtId='${goods.districtId }'">
					<img src="../images/del.gif" width="16" height="16" />ɾ��</a>
				</display:column>
			</display:table>

	</form>
	</center>
  </body>
</html:html>