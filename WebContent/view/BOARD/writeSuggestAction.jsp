<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board.suggestDAO"%>
<!-- bbsdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="suggest" class="board.suggest" scope="page">
<jsp:setProperty name="suggest" property="suggestTitle" param="SuggestTitle"/><!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="suggest" property="suggestContent" param="SuggestContent"/>
</jsp:useBean>

<%-- <%
	System.out.println(notice);
%> --%>
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");/* 
                           String selected=(String) session.getAttribute("selected"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의게시판 글 쓰기</title>
</head>

<body>
	<%
		//로그인 안됐을 때 이건 일단 보류야 왜냐면 처음 화면에 메뉴바 존재여부 결정 안했으니까
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");

		} else if (suggest.getSuggestTitle() == null || suggest.getSuggestContent() == null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			suggestDAO suggestDAO = new suggestDAO();

			int result = suggestDAO.write(suggest.getSuggestTitle(), userid, suggest.getSuggestContent());
			
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");

			}else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 작성되었습니다!')");
				script.println("location.href='suggest.jsp'");
				/* script.println("history.back()"); */
				script.println("</script>");
			}
		}
	%>

</body>
</html>

