<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainUI(before login)</title>
</head>
<body>
	<p style="text-align:center;"><img src="/iSpace/view/mainlogo.png" style="width:400px; height:100px;"></p>
	<table border="1" style="width:100%; text-align:center;">
	<tr>
	<td><a href="/iSpace/view/home.jsp">좌석현황 </a></td>
	<td>공지사항 </td>
	<td>건의사항 </td>
	<td>분실물센터 </td>
	<td>MY PAGE </td>
	</tr>
	</table>
	<%-- <p>
		<a href="/iSpace/Home?action=login"> go to login page</a>
	</p>--%>
	<p>
	<form action=/iSpace/DoLogin method="post">
	<div style="width:120px; float:left;">
	<table>
		<tr><td><input type="text" name="id" placeholder="ID" autocomplete="on"></td></tr>	
		<tr><td><input type="password" name="pw" placeholder="PW" autocomplete="off"></td></tr>
	</table>
	</div>
	<div style="width:50px; float:left;">
	<table style="height:50px;">
		<tr>
		<td rowspan="2"><input type="submit" value="LOGIN"></td>
		</tr>
		<tr> </tr>
	</div>
	</table>

	</form>
</body>
</html>