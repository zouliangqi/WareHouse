<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h2 align="center">添加入库单界面</h2>
    <form action="../stockIo.do?method=addStockIo" method="post" name="regForm">
		<table width="400" border="0" align="center">
		<tr>
    <td align="right">&nbsp;入库单ID</td>
    <td><input name="stockInId" type="text" size="20"></td>
  </tr>
    <tr>
    <td align="right">&nbsp;货物名称</td>
    <td>
     <select name="select" id="select">
		    <option value="飞利浦220x1sw"  selected="selected">飞利浦220x1sw</option>
		    <option value="飞利浦220SW9" >飞利浦220SW9</option>
		    <option value="华硕VK266H" >华硕VK266H</option>
		    <option value="华硕LS221H" >华硕LS221H</option>
            <option value="飞利浦190CW9" >飞利浦190CW9</option>
            <option value="华硕VW193D" >华硕VW193D</option>
            <option value="三星T220P" >三星T220P</option>
            <option value="长城M2231" >长城M2231</option>
            <option value="长城M932" >长城M932</option>
            <option value="联想超薄三代500G" >联想超薄三代500G</option>
            <option value="希捷500GB 7200.12 16M(串口/散)" >希捷500GB 7200.12 16M(串口/散)</option>
            <option value="希捷1TB 7200.12 32M(串口/散)" >希捷1TB 7200.12 32M(串口/散)</option>
            <option value="日立1TB 7200转 7K1000(HDT721010SLA360)" >日立1TB 7200转 7K1000(HDT721010SLA360)</option>
            <option value="WD 808.8GB 32MB(绿版)" >WD 808.8GB 32MB(绿版)</option>
            <option value="希捷Barracuda LP系列(ST32000542AS/2TB)" >希捷Barracuda LP系列(ST32000542AS/2TB)</option>
            <option value="希捷160GB 7200.11 8MB（串口/散）" >希捷160GB 7200.11 8MB（串口/散）</option>
            <option value="七彩虹 键鼠光电套装" >七彩虹 键鼠光电套装</option>
            <option value="罗技无影手Pro 2400无线" >罗技无影手Pro 2400无线</option>
            <option value="雷柏8900・Air纤薄.悬浮按键多媒体激光键鼠套装" >雷柏8900・Air纤薄.悬浮按键多媒体激光键鼠套装</option>
            <option value="双飞燕零延迟无线光电套7100" >双飞燕零延迟无线光电套7100</option>
            <option value="新贵倾城之恋＠尚品KM-108" >新贵倾城之恋＠尚品KM-108</option>
            <option value="Razer Aurantia橘仓金蛛" >Razer Aurantia橘仓金蛛</option>
            <option value="雅马哈YAMAHA NS-SW700重低音音响" >雅马哈YAMAHA NS-SW700重低音音响</option>
            <option value="腾达 1024S 24口千兆交换机" >腾达 1024S 24口千兆交换机</option>
            <option value="梅捷 A790GM3+ 主板" >梅捷 A790GM3+ 主板</option>
            <option value="华硕 ASUS P5QL/EPU 主板" >华硕 ASUS P5QL/EPU 主板</option>
            <option value="Intel 酷睿2双核 E7400 (盒)" >Intel 酷睿2双核 E7400 (盒)</option>
            <option value="酷冷至尊毁灭者RC-K100" >酷冷至尊毁灭者RC-K100</option>
            <option value="航嘉多核DH6" >航嘉多核DH6</option>     
     </select>
    </td>
  </tr>
  <tr>
    <td align="right">&nbsp;货物数量</td>
    <td><input name="goodsNum" type="text" size="20"></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="regSub" type="submit" value= "确定"></td>
    </tr>
</table>

	</form>
  </body>
</html>
