<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/test.css">
<title>New Document</title>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!--드래그 할수 있는 기능을 사용하기 위해서 draggable();-->

<%
	//User user = new User();//generate user
	String userid = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
%>

</head>

<body>
	<!-- <button onClick="javascript:goDetail('테스트');">팝업</button> -->
	<form action="/iSpace/Status" method="get">
		<table>
			<tr>
				<h3><%=userid%> <%=name%> 님, 
				</h3>
			</tr>
			<tr>
				<th><input type="submit" value="1" name="button" /></th>

				<th><input type="submit" value="2" name="button" /></th>
				
				<th><input type="submit" value="3" name="button"  /></th>
				<!-- <th><button class="button" data-modal="confirm">Contact Us</button></th> -->
			</tr>
		</table>
	</form>


<div style="height: 1000px;"></div>

	<!-- 팝업뜰때 배경 -->
	<div id="mask"></div>

	<!--Popup Start -->
	<div id="layerbox" class="layerpop" style="width:700px; height: 350px;">
		<article class="layerpop_area">
			<div class="title">
				<b>신고하기</b>
			</div>
			<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close"></a> <br>
			<div class="content"> -->
				<big><b>신고하시겠습니까?</b></big></br> 신고항목을 선택해주세요<br> 
				<select id="reason_selection">
					<option value="reason1">너무 시끄러워요.</option>
					<option value="reason2">오랫동안 부재인 좌석입니다.</option>
					<option value="reason3">음식 섭취중입니다.</option>
					<option value="reason4">기타</option>
				</select> </br>
				<textarea rows="4" cols="50" class="hiddenField" id="myTextBox"
					placeholder="신고 내용을 기재해주세요."></textarea>
				<script type="text/javascript">
					$(document).ready(
							function() {
								$('#reason_selection').change(
										function() {
											$(this).val() == "reason4" ? $(
													'#myTextBox').show() : $(
													'#myTextBox').hide();
										});
							});
				</script>
				<form action="/iSpace/view/test.jsp" method="get">
					<input type="submit" value="data">
				</form>
			</div>
		</article>
	</div>
<%String state = (String)request.getAttribute("state"); %>
	
	, 확인!!!!!!!!!!
	<!--<input type="submit" value="1" name="button" onClick="javascript:goDetail();" /> -->
	<%
	if(state!=null){
		out.println(state);
	%>
	
<!-- <input type="submit" value="1" name="button" onClick="javascript:goDetail();" /> -->
	<script src="/iSpace/view/home.js">
	//test();
	goDetail();	
	</script>
	
	<!--Popup End -->
	<% 
	}else{
		out.println("null이야 ㄱ- ");
	}
	%>
</body>
</html>