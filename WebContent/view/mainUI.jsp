<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainUI(before login)</title>
</head>
<body>

	This is the main page for iSpace seat management system~~~~~
	<%-- <p>
		<a href="/iSpace/Home?action=login"> go to login page</a>
	</p>--%>
	<p>
	<form action=/iSpace/DoLogin method="post">
	<table>
		<tr>
			<td><input type="text" name="id" placeholder="ID" autocomplete="on"></td>
			<td rowspan=2><input type="submit" value="LOGIN"></td>
		
		</tr>
		
		<tr><td><input type="password" name="pw" placeholder="PW" autocomplete="off"></td></tr>
	</table>
	</form>
</body>
</html>

<%--ssh todo : project - properties -java - runtime - apache 9.0 check--%>