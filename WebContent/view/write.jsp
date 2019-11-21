<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">
<style><%@include file="/view/CSS/home.css"%></style>
<style><%@include file="/view/CSS/mainUI.css"%></style>

<title>공지사항</title>

<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");/* 
                           String selected=(String) session.getAttribute("selected"); */
%>

</head>

<body>
	<p style="text-align: center;">
		<a href="/iSpace/view/mainUI.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;"></a>
	</p>
	<h5 style="text-align: right;">
		<b><%=userid%> <%=name%> 님</b>, <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;"> 신고<%=report%>회 <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;">
	</h5>


	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	/* 	String userID = null;
		if (session.getAttribute("userId") != null) {
			userID = (String) session.getAttribute("userId");
		} */
	%>

	<%
		int pageNumber = 1; //기본 페이지 넘버
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink">좌석현황</a>
				<ul class="submenu">
					<li><a href="about_.html" class="submenuLink"> </a></li>
				</ul></li>
			<li>|</li>

			<li class="topMenuLi"><a class="menuLink">공지사항</a></li>

			<li>|</li>

			<li class="topMenuLi"><a class="menuLink">건의사항</a>
				<ul class="submenu">

				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink">분실물센터</a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink">MY PAGE</a>
				<ul class="submenu">

				</ul></li>
		</ul>
	</nav>

<%-- 	<%
		//라긴안된경우
		if (userid == null) {
	%> --%>

<!-- 	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">접속하기<span class="caret"></span></a>

			<ul class="dropdown-menu">

				<li><a href="login.jsp">로그인</a></li>

				<li><a href="join.jsp">회원가입</a></li>

			</ul></li>

	</ul> -->

<%-- 	<%
		} else {
	%>
 --%>
<!-- 	<ul class="nav navbar-nav navbar-right">

		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">회원관리<span class="caret"></span></a>

			<ul class="dropdown-menu">

				<li><a href="logoutAction.jsp">로그아웃</a></li>

			</ul></li>

	</ul>
 -->
<%-- 	<%
		}
	%> --%>

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="writeAction.jsp">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">건의게시판</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="NoticeTitle" maxlength="50" /></td>
						</tr>
						
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="NoticeContent" maxlength="2048"
									style="height: 200px; width: 400px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

			</form>
		</div>
	</div>



	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>


</body>

</html>


