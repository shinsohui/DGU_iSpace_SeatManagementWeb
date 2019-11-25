<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="board.noticeDAO"%>
<%@ page import="board.notice"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 세션 유지를 위해  -->
<%
   //User user = new User();//generate user
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String noticeId = (String) session.getAttribute("noticeId");
   //String noticeId = (String) request.getAttribute("noticeId");
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
		} */
		
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");

		} 

		int index = 0;

		if(noticeId != null){

			index = Integer.parseInt(noticeId);

		}

		if(index == 0) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");

		}

		notice notice = new noticeDAO().getNotice(index);

		if(!userid.equals(notice.getUserId())) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");			

		}

		else{
			noticeDAO noticeDAO = new noticeDAO();
			int result = noticeDAO.delete(index);

			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='notice.jsp'");
				script.println("</script>");

			}
		}
	%>

</body>
</html>

