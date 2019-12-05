<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.commuDAO"%>
<%@ page import="board.commu"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report"); 
   String commuId = (String) session.getAttribute("commuId");
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 수정</title>
</head>
<body>

	<%
		System.out.println("updateCommuAction.jsp commuId : " + commuId);
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");
		}

		//글이 유효한지 판별
		int index = 0;
		if (commuId != null) {
			index = Integer.parseInt(commuId);
		}

		if (index == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'commu.jsp'");
			script.println("</script>");

		}
		//현재 넘어온 id값을 가지고 
		commu commu = new commuDAO().getCommu(index);

		if (!userid.equals(commu.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'commu.jsp'");
			script.println("</script>");

		} else {

			if (request.getParameter("commuTitle") == null || request.getParameter("commuContent") == null
					|| request.getParameter("commuTitle").equals("")
					|| request.getParameter("commuContent").equals("")) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {

				commuDAO commuDAO = new commuDAO();

				int result = commuDAO.update(index, request.getParameter("commuTitle"), request.getParameter("commuContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='commu.jsp'");
					//script.println("history.back()");
					script.println("</script>");

				}
			}
		}
	%>

</body>
</html>



