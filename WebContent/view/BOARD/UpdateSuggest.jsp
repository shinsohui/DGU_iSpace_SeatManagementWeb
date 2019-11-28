<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.suggest"%>
<%@ page import="board.suggestDAO"%>
<%@ page import="javax.servlet.*" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<!-- 세션 유지를 위해  -->
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
/*    String noticeId = (String) request.getParameter("noticeId");
 */%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>

	<%
		int suggestId = 0;

		if (request.getParameter("suggestId") != null) {
			suggestId = Integer.parseInt(request.getParameter("suggestId"));
			System.out.println("UpdateSuggest.jsp suggestId : "+suggestId);
		}

		suggest suggest = new suggestDAO().getSuggest(suggestId);
		/* HttpSession session = request.getSession();
		 */		
	%>


	<!-- 네비게이션  -->

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>

		</div>

		<!-- <div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">
				<li><a href="mainUI.jsp">메인</a></li>
				<li class="active"><a href="notice.jsp">게시판</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div> -->
	</nav>

	<!-- 게시판 -->

	<div class="container">
		<div class="row">
			<form method="post" action="updateSuggestAction.jsp?suggestID=<%= suggestId%> ">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
					
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">
							글 수정
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>

							<td><input type="text" class="form-control"
								placeholder="글 제목" name="suggestTitle" maxlength="50"
								value="<%= suggest.getSuggestTitle() %>"></td>
						</tr>
						
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="suggestContent" maxlength="2048" style="height: 350px;"><%= suggest.getSuggestContent() %></textarea></td>
						</tr>
					</tbody>
				</table>

				<button type="submit" class="btn btn-primary pull-right">글수정</button>
			</form>
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>


