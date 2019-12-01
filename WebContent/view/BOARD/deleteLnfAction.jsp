<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="board.lnfDAO"%>
<%@ page import="board.lnf"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 세션 유지를 위해  -->
<%
   String userid = (String) session.getAttribute("id");
   String name = (String) session.getAttribute("name");
   String state = (String) request.getAttribute("state");
   String seatNo = (String) request.getParameter("button");
   String report = (String) session.getAttribute("report");
   String lnfId = (String) session.getAttribute("lnfId");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분실물게시판 글 삭제</title>
</head>
<body>

	<%
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");

		} 

		int index = 0;

		if(lnfId != null){

			index = Integer.parseInt(lnfId);

		}

		if(index == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='lnf.jsp'");
			script.println("</script>");

		}

		lnf lnf = new lnfDAO().getLnf(index);

		if(!userid.equals(lnf.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='lnf.jsp'");
			script.println("</script>");			

		}

		else{
			lnfDAO lnfDAO = new lnfDAO();
			int result = lnfDAO.delete(index);

			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='lnf.jsp'");
				script.println("</script>");

			}
		}
	%>

</body>
</html>

