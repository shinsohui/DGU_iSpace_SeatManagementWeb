<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.suggest"%>
<%@ page import="board.suggestDAO"%>
<%@ page import = "java.util.ArrayList"%> 		

<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String ifmanager = (String) session.getAttribute("ifmanager"); 
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
<title></title>
</head>
<style type="text/css">
<%@include file ="/view/CSS/board.css"%>
</style>


<body>
<div id='top'>
		<p style="text-align: left; margin-top: 10px; margin-left: 20%;">
			<img src="/iSpace/view/Image/mainlogo.png" style="width: 300px;">
		</p>

		<div align="center" >
			<nav id="topMenu">
				<ul>
				<li style="width: 20%">&nbsp;</li>
			<% if(userid!=null) {%>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
				<%}else{ %>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
				<%} %>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>

				
				<li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>
				

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
						<li style="width: 20%;">&nbsp;</li>
			</ul>
			</nav>
		</div>
	</div>
	
	<%

		int suggestId = 0; //지워진 글인지 판단하기위해

		if (request.getParameter("suggestId") != null) {
			suggestId = Integer.parseInt(request.getParameter("suggestId"));
			System.out.println("viewSuggest.jsp suggestId: "+suggestId);
		}

		if (suggestId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'suggest.jsp'");
			script.println("</script>");

		}
		 session.setAttribute("suggestId",request.getParameter("suggestId"));

		suggest suggest = new suggestDAO().getSuggest(suggestId);
		
	%>
<%
      
      if (userid != null && !userid.equals(suggest.getUserId()) && ifmanager.equals("0")) {
   %>

   <script>
      alert('본인 글만 읽을 수 있습니다.');
      location.href = 'suggest.jsp';
   </script>

   <%
      }
   %>
	<div id='containn'>
		<div id='box-left'>'</div>

		<div id='box-center'>
			<!-- 게시판 -->
			<div class="container" style="padding-top: 50px; width: 100%;">
				<div class="row">

					<table class="table table-bordered" style="border: 1px solid #eeeeee">

						<thead>
							<tr>
								<th colspan="2" style="background-color: white; text-align: center; font-size: 25px;">건의 게시판</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td style="width: 20%; text-align: center">글 제목</td>
								<td colspan="2"><%=suggest.getSuggestTitle()%></td>
							</tr>

							<tr>
								<td style="text-align: center">작성자</td>
								<td colspan="2"><%=suggest.getUserId()%></td>

							</tr>

							<tr>
								<td style="text-align: center">작성일</td>
								<td colspan="2"><%=suggest.getSuggestDate().substring(0, 11)%></td>

							</tr>
							<tr>

								<td style="text-align: center">내용</td>
								<td colspan="2" style="min-height: 200px; text-align: left;"><%=suggest.getSuggestContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
							</tr>
						</tbody>
					</table>

					<a href="suggest.jsp" class="btn btn-primary pull-right">목록</a>


					<%
				//글작성자 본인일시 수정 삭제 가능 
				if (userid != null && userid.equals(suggest.getUserId())) {
			%>

					<a href="UpdateSuggest.jsp?suggestId=<%=suggestId%>" class="btn btn-primary pull-right">수정</a> <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteSuggestAction.jsp?bbsID=<%=suggestId%>" class="btn btn-primary pull-right">삭제</a>

					<%
						}
					%>
				</div>
			</div>

		</div>
		<div id='box-right'>
			<div class="myloginarea">
				<%
				if(userid != null)
				{
				%>
				<%=userid %> <%=name %>님, 환영합니다. | <a href="/iSpace/view/logout.jsp" style="text-decoration: none; color: gray;"> 로그아웃 </a>		
				<% }%>				</div>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>



