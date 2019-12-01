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


<title>건의게시판</title>

<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String ifmanager = (String) session.getAttribute("ifmanager"); 

  //String selected=(String) session.getAttribute("selected"); */
%>

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

   if(ifmanager == "1"){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('관리자 권한이 필요합니다.')");
      script.println("location.href = 'notice.jsp'");
      script.println("</script>");
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

   <div align="center" style="padding-top:50px; font-size: 30px;
   font-weight: bold;  font-family:'Trebuchet MS', Dotum;  color: #252525;">건의게시판</div>
      <div class="container" style= "padding-top:10px;">
      <div class="row" style= "width:980px;">
         <form method="post" action="writeSuggestAction.jsp">

            <table class="table table-striped"
               style="text-align: center; border: 1px solid #dddddd; padding-top:10px; padding-left: 100px;">

               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #eeeeee; text-align: center;">건의 게시판</th>
                  </tr>
               </thead>
               
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control"
                        placeholder="글 제목" name="SuggestTitle" maxlength="50" /></td>
                  </tr>
                  
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용"
                           name="SuggestContent" maxlength="2048"
                           style="height: 200px; width: 980px;"></textarea></td>
                  </tr>
               </tbody>
            </table>
            
            <input type="submit" class="btn btn-primary" value="글쓰기" />

         </form>
      </div>
   </div>

   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>

