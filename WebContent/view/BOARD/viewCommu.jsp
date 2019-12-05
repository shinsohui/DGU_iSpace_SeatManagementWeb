<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.commu"%>
<%@ page import="board.commuDAO"%>
<%@ page import="board.comment"%>
<%@ page import="board.commentDAO"%>
<%@ page import="java.util.ArrayList"%>

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
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>공지사항 view</title>
</head>
<style type="text/css">
<%@include file="/view/CSS/board.css"%>
</style>
<script>
var httpRequest = null;

// httpRequest ��ü ����
function getXMLHttpRequest(){
   var httpRequest = null;

   if(window.ActiveXObject){
      try{
         httpRequest = new ActiveXObject("Msxml2.XMLHTTP");   
      } catch(e) {
         try{
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) { httpRequest = null; }
      }
   }
   else if(window.XMLHttpRequest){
      httpRequest = new window.XMLHttpRequest();
   }
   return httpRequest;   
}

// ��� ���
function writeCmt()
{
   var form = document.getElementById("writeCommentForm");
   
   var board = form.comment_board.value
   var id = form.comment_id.value
   var content = form.comment_content.value;
   
   if(!content)
   {
      alert("내용을 입력하세요.");
      return false;
   }
   else
   {   
      var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
         
      httpRequest = getXMLHttpRequest();
      httpRequest.onreadystatechange = checkFunc;
      httpRequest.open("POST", "CommentWriteAction.co", true);   
      httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
      httpRequest.send(param);
   }
}

function checkFunc(){
   if(httpRequest.readyState == 4){
      // 결과값을 가져온다. 
      var resultText = httpRequest.responseText;
      if(resultText == 1){ 
         document.location.reload(); // 상세보기 및 새로고침 
      }
   }
}


</script>

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
            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/home.jsp">SEAT </a></li>
            <%}else{ %>
            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/mainUI.jsp">SEAT </a></li>
            <%} %>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/suggest.jsp">SUGGEST </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

            <li class="topMenuLi" style="background-color: #df633a;"><a
               class="menuLink" style="color: white;"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
                 <li style="width: 20%;">&nbsp;</li>
        
         </ul>
      </nav>
   </div>
</div>
      <div id='containn'>
      <div id='box-left'>'</div>

      <div id='box-center'>
   <%
   /*      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
         String userid = null;
         if (session.getAttribute("userId") != null) {
            userid = (String) session.getAttribute("userId");
      
         }  */
      int commuId = 0; //지워진 글인지 판단하기위해

      if (request.getParameter("commuId") != null) {
         commuId = Integer.parseInt(request.getParameter("commuId"));
         System.out.println("viewCommu.jsp commuId: "+commuId);
      }

      if (commuId == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 글 입니다.')");

         script.println("location.href = 'commu.jsp'");
         script.println("</script>");

      }
      int cnum=0;
      session.setAttribute("commuId",request.getParameter("commuId"));
      session.setAttribute("cnum", cnum);
       commu commu = new commuDAO().getCommu(commuId);
   %>


   <!-- 게시판 -->
 <div class="container" style= "padding-top:50px; width : 100%;" >
      <div class="row">

         <table class="table table-bordered" style="border: 1px solid #dddddd;">

            <thead>
               <tr>
                  <th colspan="2"
                     style="background-color: white; text-align: center; font-size: 25px;">커뮤니티</th>

               </tr>
            </thead>
            <tbody>

               <tr>
                  <td style="width: 20%; text-align: center">글 제목</td>
                  <td colspan="2"><%=commu.getCommuTitle()%></td>
               </tr>

               <tr>
                  <td style="text-align: center">작성자</td>
                  <td colspan="2"><%= commu.getUserId() %></td>

               </tr>

               <tr>

                  <td style="text-align: center">작성일</td>
                  <td colspan="2"><%= commu.getCommuDate().substring(0, 11)%></td>
               </tr>

               <tr>
                  <td style="text-align: center">내용</td>
                  <td colspan="2" style="min-height: 200px; text-align: left;"><%=commu.getCommuContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
               .replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
               </tr>
            </tbody>
         </table>

         <div class="container" style = "width : 980px;">
            <!-- <table width="980px" border="1"> -->
            <table class="table table-striped"
            style="border: 1px solid #eeeeee">
               <%
                  
                   String idx =(String)session.getAttribute("commuId");
                  System.out.println("cnum" + cnum);
                  System.out.println("idx"+idx);
                  commentDAO comment = new commentDAO();
                  ArrayList<comment> list = comment.getList(idx);
                  for (int i = 0; i < list.size(); i++) {
               %>


               <tr style="text-align:center">
                  <td><%=list.get(i).getWriter()%>&nbsp&nbsp&nbsp&nbsp</td>
                  <td><%=list.get(i).getContent()%>&nbsp&nbsp&nbsp&nbsp</td>
                  <td><%=list.get(i).getDate().substring(0,11)%>&nbsp&nbsp&nbsp&nbsp</td>
    
               </tr>

            <%
   
                              } //for문 괄호 
               %>
   </table>
         </div>


         <br>
         <div>
            <form action="/iSpace/Comment" method="post">
               <table width="100%" border="1">
                  <tr>
                     <td width="70px">댓글</td>
                     <td><textarea rows="3" cols="100" style="resize: none;" name="content"
                           placeholder="댓글을 입력해주세요."></textarea></td>
                     <td><input type="hidden" name="cnum" value="<%=++cnum%>"></td>
                     <td><input type="submit" value="등록"></td>

                  </tr>

               </table>
            </form>
         </div>
         <br> <a href="commu.jsp" class="btn btn-primary pull-right">목록</a>

         <%
            //글작성자 본인일시 수정 삭제 가능 
            if (userid != null && userid.equals(commu.getUserId())) {
         %>
         
         
         
<a href="UpdateCommu.jsp?commuId=<%=commuId%>" class="btn btn-primary pull-right">수정</a>
         
         <a onclick="return confirm('정말로 삭제하시겠습니까?')"
            href="deleteCommuAction.jsp?commuID=<%=commuId%>"
            class="btn btn-primary pull-right">삭제</a>


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
            <% }%>         
</div>
      </div>
   </div>
   
   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>

 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.commu"%>
<%@ page import="board.commuDAO"%>
<%@ page import="board.comment"%>
<%@ page import="board.commentDAO"%>
<%@ page import="java.util.ArrayList"%>

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
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>공지사항 view</title>
</head>
<style type="text/css">
<%@include file="/view/CSS/board.css"%>
</style>
<script>
var httpRequest = null;

// httpRequest ��ü ����
function getXMLHttpRequest(){
   var httpRequest = null;

   if(window.ActiveXObject){
      try{
         httpRequest = new ActiveXObject("Msxml2.XMLHTTP");   
      } catch(e) {
         try{
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) { httpRequest = null; }
      }
   }
   else if(window.XMLHttpRequest){
      httpRequest = new window.XMLHttpRequest();
   }
   return httpRequest;   
}

// ��� ���
function writeCmt()
{
   var form = document.getElementById("writeCommentForm");
   
   var board = form.comment_board.value
   var id = form.comment_id.value
   var content = form.comment_content.value;
   
   if(!content)
   {
      alert("내용을 입력하세요.");
      return false;
   }
   else
   {   
      var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
         
      httpRequest = getXMLHttpRequest();
      httpRequest.onreadystatechange = checkFunc;
      httpRequest.open("POST", "CommentWriteAction.co", true);   
      httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
      httpRequest.send(param);
   }
}

function checkFunc(){
   if(httpRequest.readyState == 4){
      // 결과값을 가져온다. 
      var resultText = httpRequest.responseText;
      if(resultText == 1){ 
         document.location.reload(); // 상세보기 및 새로고침 
      }
   }
}


</script>

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
            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/home.jsp">SEAT </a></li>
            <%}else{ %>
            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/mainUI.jsp">SEAT </a></li>
            <%} %>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/suggest.jsp">SUGGEST </a></li>


            <li class="topMenuLi"><a class="menuLink"
               href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>

            <li class="topMenuLi" style="background-color: #df633a;"><a
               class="menuLink" style="color: white;"
               href="/iSpace/view/BOARD/commu.jsp">COMMUNITY </a></li>
                 <li style="width: 20%;">&nbsp;</li>
        
         </ul>
      </nav>
   </div>
</div>
      <div id='containn'>
      <div id='box-left'>'</div>

      <div id='box-center'>
   <%
   /*      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
         String userid = null;
         if (session.getAttribute("userId") != null) {
            userid = (String) session.getAttribute("userId");
      
         }  */
      int commuId = 0; //지워진 글인지 판단하기위해

      if (request.getParameter("commuId") != null) {
         commuId = Integer.parseInt(request.getParameter("commuId"));
         System.out.println("viewCommu.jsp commuId: "+commuId);
      }

      if (commuId == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 글 입니다.')");

         script.println("location.href = 'commu.jsp'");
         script.println("</script>");

      }
      int cnum=0;
      session.setAttribute("commuId",request.getParameter("commuId"));
      session.setAttribute("cnum", cnum);
       commu commu = new commuDAO().getCommu(commuId);
   %>


   <!-- 게시판 -->
<div class="container" style= "padding-top:50px; width:100%;" >
      <div class="row"> 

         <table class="table table-bordered" style="border: 1px solid #dddddd;">

            <thead>
               <tr>
                  <th colspan="2"
                     style="background-color: white; text-align: center; font-size: 25px;">커뮤니티</th>

               </tr>
            </thead>
            <tbody>

               <tr>
                  <td style="width: 20%; text-align: center">글 제목</td>
                  <td colspan="2"><%=commu.getCommuTitle()%></td>
               </tr>

               <tr>
                  <td style="text-align: center">작성자</td>
                  <td colspan="2"><%= commu.getUserId() %></td>

               </tr>

               <tr>

                  <td style="text-align: center">작성일</td>
                  <td colspan="2"><%= commu.getCommuDate().substring(0, 11)%></td>
               </tr>

               <tr>
                  <td style="text-align: center">내용</td>
                  <td colspan="2" style="min-height: 200px; text-align: left;"><%=commu.getCommuContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
               .replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
               </tr>
            </tbody>
         </table>

       
            <!-- <table width="980px" border="1"> -->
            <table class="table table-bordered" style="border: 1px solid #eeeeee">
               <%
                  
                   String idx =(String)session.getAttribute("commuId");
                  System.out.println("cnum" + cnum);
                  System.out.println("idx"+idx);
                  commentDAO comment = new commentDAO();
                  ArrayList<comment> list = comment.getList(idx);
                  for (int i = 0; i < list.size(); i++) {
               %>


               <tr style="text-align:center">
                  <td><%=list.get(i).getWriter()%>&nbsp&nbsp&nbsp&nbsp</td>
                  <td><%=list.get(i).getContent()%>&nbsp&nbsp&nbsp&nbsp</td>
                  <td><%=list.get(i).getDate().substring(0,11)%>&nbsp&nbsp&nbsp&nbsp</td>
    
               </tr>

            <%
   
                              } //for문 괄호 
               %>
   </table>
        


         <br>
        
            <form action="/iSpace/Comment" method="post">
               <table class="table table-bordered" style="border: 1px solid #eeeeee">
                  <tr>
                     <td width="50px">댓글</td>
                     <td><textarea rows="3" cols="100" style="resize: none;" name="content"
                           placeholder="댓글을 입력해주세요."></textarea></td>
                    <%--  <td><input type="hidden" name="cnum" value="<%=++cnum%>"></td> --%>
                     <td><input type="submit" value="등록"></td>

                  </tr>

               </table>
            </form>
        
         <br> <a href="commu.jsp" class="btn btn-primary pull-right">목록</a>

         <%
            //글작성자 본인일시 수정 삭제 가능 
            if (userid != null && userid.equals(commu.getUserId())) {
         %>
         
         
         
<a href="UpdateCommu.jsp?commuId=<%=commuId%>" class="btn btn-primary pull-right">수정</a>
         
         <a onclick="return confirm('정말로 삭제하시겠습니까?')"
            href="deleteCommuAction.jsp?commuID=<%=commuId%>"
            class="btn btn-primary pull-right">삭제</a>


         <%
            }
         %>
      </div>
   </div>
</div>

   

   <div id='box-right'>
      <div class="myloginarea">
         <%
            if (userid != null) {
         %>
         <%=userid%>
         <%=name%>님, 환영합니다. | <a href="/iSpace/view/logout.jsp"
            style="text-decoration: none; color: gray;"> 로그아웃 </a>
         <%
            }
         %>
      </div>
   </div>
</div>


   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>

</body>
</html>