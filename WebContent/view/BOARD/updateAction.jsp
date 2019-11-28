<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.noticeDAO"%>
<%@ page import="board.notice"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	//sresponse.setContentType("text/html; charset=UTF-8");
%>

<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   //String useridd= (String) session.setAttribute("userid");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report"); 
   String noticeId = (String) session.getAttribute("noticeId");/*
   String selected=(String) session.getAttribute("selected"); */
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>

	<%
		/* String userId = null;
		if (session.getAttribute("userId") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userId = (String) session.getAttribute("userId");//유저아이디에 해당 세션값을 넣어준다.
		}
		*/

		System.out.println("updateAction.jsp noticeId : " + noticeId);
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");
		}

		//글이 유효한지 판별
		int index = 0;
		if (noticeId != null) {
			index = Integer.parseInt(noticeId);
		}

		if (index == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");

		}
		//현재 넘어온 id값을 가지고 
		notice notice = new noticeDAO().getNotice(index);

		if (!userid.equals(notice.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");

		} else {

			if (request.getParameter("noticeTitle") == null || request.getParameter("noticeContent") == null
					|| request.getParameter("noticeTitle").equals("")
					|| request.getParameter("noticeContent").equals("")) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {

				noticeDAO noticeDAO = new noticeDAO();

				int result = noticeDAO.update(index, request.getParameter("noticeTitle"),
						request.getParameter("noticeContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다')");
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



