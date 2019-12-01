<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.suggestDAO"%>
<%@ page import="board.suggest"%>
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
   String suggestId = (String) session.getAttribute("suggestId");
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의게시판 수정</title>
</head>
<body>

	<%
        System.out.println("updateSuggestAction.jsp suggestId : "+suggestId);
		if (userid == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'mainUI.jsp'");
			script.println("</script>");
		} 

 		//글이 유효한지 판별
		int index = 0;
		if (suggestId != null) {
			index = Integer.parseInt(suggestId);
		}

		if (index == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'suggest.jsp'");
			script.println("</script>");

		} 
		//현재 넘어온 id값을 가지고 
		suggest suggest = new suggestDAO().getSuggest(index);

		if (!userid.equals(suggest.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'suggest.jsp'");
			script.println("</script>");				

		} else {

			if (request.getParameter("suggestTitle") == null || request.getParameter("suggestContent") == null
			|| request.getParameter("suggestTitle").equals("") || request.getParameter("suggestContent").equals("") ) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
       		} else {
				
       			suggestDAO suggestDAO = new suggestDAO();

				int result = suggestDAO.update(index, request.getParameter("suggestTitle"), request.getParameter("suggestContent"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");		
					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='suggest.jsp'");
					//script.println("history.back()");
					script.println("</script>");

				}		
			}
		}
	%>

</body>
</html>



