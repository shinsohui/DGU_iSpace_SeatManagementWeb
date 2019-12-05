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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<title>분실물게시판 글쓰기</title>

<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report"); 
   String ifmanager = (String) session.getAttribute("ifmanager"); 
   String lnfId=(String) session.getAttribute("lnfId");                   
%>

</head>

<style type="text/css">
<%@include file ="/view/CSS/board.css"%>
</style>


<body>
 <div id='top'>
		<p style="text-align: left; margin-top: 10px; margin-left: 20%;">
			<img src="/iSpace/view/Image/mainlogo.png" style="width: 300px;">
		</p>


   <%
      if (ifmanager.equals("0")) {
         System.out.println("ifmamager:" + ifmanager);
   %>
   
   <script>
      alert('관리자 권한이 필요합니다.');
      location.href = 'lnf.jsp';
   </script>

   <%
      }
   %>

   <%
      int pageNumber = 1; //기본 페이지 넘버
      //페이지넘버값이 있을때
      if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
   %>
<div align="center">
      <nav id="topMenu">
         <ul>
				<li style="width: 20%">&nbsp;</li>
				
					<% if(userid!=null) {%>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/home.jsp">SEAT </a></li>
				<%}else{ %>
				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/mainUI.jsp">SEAT </a></li>
				<%} %>

				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


				<li class="topMenuLi"><a class="menuLink" href="/iSpace/view/BOARD/suggest.jsp">SUGGEST
				</a></li>


				<li class="topMenuLi" style="background-color: #df633a;">
				<a class="menuLink" style="color:white;" href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
			<li style="width: 20%;">&nbsp;</li>
			
				</ul>
      </nav>
   </div>
   </div>
    
    <div id='containn'>
		<div id='box-left'>'</div>
		
		<div id='box-center'>
				
   <!-- 게시판 -->
 <div class="container" style= "padding-top:50px; width : 100%;" >
      <div class="row" >

         <form action="/iSpace/UploadService" method="post"
      enctype="multipart/form-data">

            <table class="table table-bordered"
               style="text-align: center; border: 1px solid #dddddd">

               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: white; text-align: center; font-size:25px;">분실물 센터</th>
                  </tr>
               </thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="title" maxlength="50" /></td>
						</tr>

						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="content" maxlength="2048"
									style="height: 200px; width: 100%;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="file" value="파일 선택" name="file" /></td>
						</tr>
					</tbody>
				</table>
            
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

         </form>
                  <a href="lnf.jsp" class="btn btn-primary pull-right">목록</a> 
         
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

