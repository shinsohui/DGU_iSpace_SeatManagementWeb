<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board.commuDAO"%>
<!-- bbsdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="commu" class="board.commu" scope="page">
<jsp:setProperty name="commu" property="commuTitle" param="CommuTitle"/>
<jsp:setProperty name="commu" property="commuContent" param="CommuContent"/>
</jsp:useBean>

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
<title>건의게시판</title>
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

		} else if (commu.getCommuTitle() == null || commu.getCommuContent() == null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			commuDAO commuDAO = new commuDAO();

			int result = commuDAO.write(commu.getCommuTitle(), userid, commu.getCommuContent());
			
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
				script.println("location.href='commu.jsp'");
				/* script.println("history.back()"); */
				script.println("</script>");
			}
		}
	%>

</body>
</html>

