<%@ page language="java" contentType="text/html; charset=GB18030"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>错误信息</title>
		<style type="text/css">
			.STYLE1{
				font-size: 24px;
				font-weight: bold;
				color: #FF0000;
			}
		</style>
	</head>
	<body>
		<br>
		<br>
		<center>
			<table width="500">
				<tr>
					<td align="center">
						<p align="left">
							<span class="STYLE1">错误信息：</span>
					</td>
				</tr>
			</table>
			<hr>
			<table width="500">
				<tr>
					<td>
						<html:errors/>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>

