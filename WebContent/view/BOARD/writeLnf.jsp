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

<title>분실물게시판</title>

<%
   //User user = new User();//generate user
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
<%@include file ="/view/CSS/home.css"%>
</style>


<body>
  <p style="text-align: center;">
		<img src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px;padding-top: 18px;">
	</p>
   
   <h5 style="text-align: right;">
      <b><%=userid%> <%=name%> 님</b>, <img
         src="/iSpace/view/Image/reportimg.png"
         style="width: 20px; height: 20px;"> 신고<%=report%>회 <img
         src="/iSpace/view/Image/reportimg.png"
         style="width: 20px; height: 20px;">
   </h5>


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
      <nav id="topMenu" style="padding-top:26px;">
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


   <!-- 게시판 -->

   <div class="container">

      <div class="row">

         <form action="/iSpace/UploadService" method="post"
      enctype="multipart/form-data">

            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd">

               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">분실물 게시판</th>
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
									style="height: 200px; width: 400px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="file" value="파일 선택" name="file" /></td>
						</tr>
					</tbody>
				</table>
            
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

         </form>
      </div>
   </div>
<!-- 
   <form action="/iSpace/UploadService" method="post"
      enctype="multipart/form-data">
      <table>
         <tr>
            <td>글쓴이 :</td>
            <td><input type="text" name="author" /></td>
         </tr>
         <tr>
            <td>제목 :</td>
            <td><input type="text" name="title" /></td>
         </tr>
         <tr>
            <td>파일업로드 :</td>
            <td><input type="file" value="파일 선택" name="file" /></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="업로드" /></td>
         </tr>
      </table>
   </form> -->

   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>

