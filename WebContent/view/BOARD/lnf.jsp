<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "board.lnfDAO"%>
<%@ page import = "board.lnf"%>
<%@ page import = "java.util.ArrayList"%> 		

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
		<a href="/iSpace/view/home.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;"></a>
	</p>
	
      <h5 style="text-align: right;">
         <b><%=userid%> <%=name%> 님</b>
      </h5>
      
      
		<div align="center">
		<nav id="topMenu">
			<ul><% if(userid!=null) {%>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
				<%}else{ %>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
				<%} %>
				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
			</ul>
		</nav>
	</div>
	
	

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #eeeeee">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
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
						lnfDAO lnf = new lnfDAO();
						ArrayList<lnf> list = lnf.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getLnfId()%></td>
						<td><a
							href="viewLnf.jsp?lnfId=<%=list.get(i).getLnfId()%>">
							<%=list.get(i).getLnfTitle()%></a></td>
						<td><%=list.get(i).getUserId()%></td>
						<td><%=list.get(i).getLnfDate().substring(0, 11)%></td>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>

			<%
				if (pageNumber != 1) {
			%>
			<a href="lnf.jsp?pageNumber=<%=pageNumber - 1%>" class= "btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if (lnf.nextPage(pageNumber + 1)) {
			%>
			<a href="lnf.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>>
			<%
				}
			%>

		</div>
	</div>

		<!-- 회원만넘어가도록 -->
	<%
		//if logined userID라는 변수에 해당 아이디가 담기고 if not null

		if (userid != null) {
	%>
	<a href="writeLnf.jsp" class="btn btn-primary pull-right">글쓰기</a>
	<%
		} else {
	%>
	<button class="btn btn-primary pull-right"
		onclick="if(confirm('로그인 하세요'))location.href='mainUI.jsp';"
		type="button">글쓰기</button>
	<%
		}
	%>



	</ul>
	</div>
</body>
</html>
