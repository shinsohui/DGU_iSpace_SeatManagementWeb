<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.noticeDAO"%>
<%@ page import = "board.notice"%>
<%@ page import = "java.util.ArrayList"%> 		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판</title>
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   //String useridd= (String) session.setAttribute("userid");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");/* 
                           String selected=(String) session.getAttribute("selected"); */
%>
</head>

<style type="text/css">
<%@include file ="/view/CSS/mainUI.css"%>
<%@include file ="/view/CSS/home.css"%>
</style>


<body>
	<p style="text-align: center;">
		<a href="/iSpace/view/mainUI.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;"></a>
	</p>
	
	<!-- remove -->
	<a href="/iSpace/view/home.jsp">home.jsp</a>
	<a href="/iSpace/view/mainUI.jsp">mainUI.jsp</a>
	
      <h5 style="text-align: right;">
         <b><%=userid%> <%=name%> 님</b>, <img
            src="/iSpace/view/Image/reportimg.png"
            style="width: 20px; height: 20px;"> 신고<%=report%>회 
         <img src="/iSpace/view/Image/reportimg.png"
            style="width: 20px; height: 20px;">
      </h5>
      
      
	<div id="topMenu">
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
	</div>
	
	

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: red; text-align: center;">번호</th>
						<th style="background-color: red; text-align: center;">제목</th>
						<th style="background-color: red; text-align: center;">작성자</th>
						<th style="background-color: red; text-align: center;">작성일</th>
					</tr>
				</thead>
				
				
				<tbody>
					<%
						int pageNumber = 1; //기본 페이지 넘버
						//페이지넘버값이 있을때
						if (request.getParameter("pageNumber") != null) {
							pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						}
					%>

					<%
						noticeDAO notice = new noticeDAO();
						ArrayList<notice> list = notice.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getNoticeId()%></td>
						<td><a
							href="view.jsp?noticeId=<%=list.get(i).getNoticeId()%>">
							<%=list.get(i).getNoticeTitle()%></a></td>
						<td><%=list.get(i).getUserId()%></td>
						<td><%=list.get(i).getNoticeDate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>

			<%
				if (pageNumber != 1) {
			%>
			<a href="notice.jsp?pageNumber=<%=pageNumber - 1%>" class= "btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if (notice.nextPage(pageNumber + 1)) {
			%>
			<a href="notice.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>>
			<%
				}
			%>

		</div>
	</div>

		<!-- 회원만넘어가도록 -->
<%-- 				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null

					if (userid != null) {
					
				%>
				<a href="write.jsp" class="btn btn-primary pull-right"><%=userid %>글쓰기</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='mainUI.jsp';" type="button">글쓰기</button>
				<%
					}
				%> --%>
				
				
				
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				
				
				

	<!-- 검색 폼 영역 -->
	<li id='liSearchOption'>
		<div>
			<select id='selSearchOption'>
				<option value='A'>제목+내용</option>
				<option value='T'>제목</option>
				<option value='C'>내용</option>
			</select> <input id='txtKeyWord' /> <input type='button' value='검색' />
		</div>
	</li>
	</ul>
	</div>
</body>
</html>
