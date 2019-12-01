<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.notice"%>
<%@ page import="board.noticeDAO"%>
<%@ page import="javax.servlet.*" %>

<!-- 세션 유지를 위해  -->
<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>공지사항 글 수정</title>
</head>

<style type="text/css">
<%@include file ="/view/CSS/mainUI.css"%>
</style>

<body>
 <p style="text-align: center;">
		<img src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px;padding-top: 18px;">
	</p>

	<%
		int noticeId = 0;

		if (request.getParameter("noticeId") != null) {
			noticeId = Integer.parseInt(request.getParameter("noticeId"));
			System.out.println("update.jsp noticeId : "+noticeId);
		}
		
		notice notice= new noticeDAO().getNotice(noticeId);
	
	%>

	<!-- 게시판 -->
	<div align="center">
      <nav id="topMenu" style="padding-top:26px;">
         <ul><% if(userid!=null) {%>
            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
            <%}else{ %>
            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
            <%} %>
            <li>|</li>

            <li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>
            <li>|</li>

            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
            </a></li>

            <li>|</li>

            <li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
         </ul>
      </nav>
   </div>
   
   <div class="myloginarea">
      <%=userid%> <%=name%> 님, 환영합니다. | <a href="/iSpace/view/logout.jsp"
         style="text-decoration: none; color: gray;"> 로그아웃 </a>
   </div>

	<div class="container" style="padding-left:108px; padding-top:100px;">
		<div class="row" style = "width:980px">
			<form method="post" action="updateAction.jsp?noticeID=<%= noticeId%> ">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					
					<thead>
						<tr>
							<th colspan="2" style="background-color: white; text-align: center; font-size:25px;">
							공지사항
							</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>

							<td><input type="text" class="form-control"
								placeholder="글 제목" name="noticeTitle" maxlength="50"
								value="<%= notice.getNoticeTitle() %>"></td>
						</tr>
						
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="noticeContent" maxlength="2048" style="height: 200px; width: 980px;"><%= notice.getNoticeContent() %></textarea></td>
						</tr>
					</tbody>
				</table>

				<button type="submit" class="btn btn-primary pull-right">글수정</button>
			</form>
		  <a href="notice.jsp" class="btn btn-primary pull-right">목록</a> 
			
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>


