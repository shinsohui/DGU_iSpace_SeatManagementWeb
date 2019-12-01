<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="board.suggestDAO"%>
<%@ page import="board.suggest"%>
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
   String suggestId = (String) session.getAttribute("suggestId");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의게시판 글 삭제</title>
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

		if(suggestId != null){

			index = Integer.parseInt(suggestId);

		}

		if(index == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='suggest.jsp'");
			script.println("</script>");

		}

		suggest suggest = new suggestDAO().getSuggest(index);

		if(!userid.equals(suggest.getUserId())) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='suggest.jsp'");
			script.println("</script>");			
		}

		else{
			suggestDAO suggestDAO = new suggestDAO();
			int result = suggestDAO.delete(index);

			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='suggest.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>

