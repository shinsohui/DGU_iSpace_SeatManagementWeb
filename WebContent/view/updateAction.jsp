<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="board.noticeDAO"%>

<%@ page import="board.notice"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%
		String userId = "112106";

		if (session.getAttribute("userId") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			userId = (String) session.getAttribute("userId");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 

		//글이 유효한지 판별
		int noticeId = 0;
		if (request.getParameter("noticeId") != null) {
			
			noticeId = Integer.parseInt(request.getParameter("noticeId"));

		}

		if (noticeId == 0) {
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");

		}

		notice notice = new noticeDAO().getNotice(noticeId);

		if (!userId.equals(notice.getUserId())) {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");				

		} else {

			if (request.getParameter("noticeTitle") == null || request.getParameter("noticeContent") == null
			|| request.getParameter("noticeTitle").equals("") || request.getParameter("noticeContent").equals("") ) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");

			} else {
		noticeDAO noticeDAO = new noticeDAO();

		int result = noticeDAO.update(noticeId, request.getParameter("noticeTitle"), request.getParameter("noticeContent"));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='notice.jsp'");
			//script.println("history.back()");
			script.println("</script>");

		}
			}
		}
	%>

</body>
</html>



