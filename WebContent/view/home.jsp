<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: "맑은 고딕"
}

#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 999;
	background-color: #000000;
	display: none;
}

.layerpop {
	display: none;
	z-index: 1000;
	border: 2px solid #ccc;
	background: #fff;
	cursor: move;
}

.layerpop_area .title {
	padding: 10px 10px 10px 10px;
	border: 0px solid #aaaaaa;
	background: #f1f1f1;
	color: #3eb0ce;
	font-size: 1.3em;
	font-weight: bold;
	line-height: 24px;
}

.layerpop_area .layerpop_close {
	width: 25px;
	height: 25px;
	display: block;
	position: absolute;
	top: 10px;
	right: 10px;
	background: transparent url('btn_exit_off.png') no-repeat;
}

.layerpop_area .layerpop_close:hover {
	background: transparent url('btn_exit_on.png') no-repeat;
	cursor: pointer;
}

.layerpop_area .content {
	width: 96%;
	margin: 2%;
	color: #828282;
}

.hiddenField {
	display: none;
}


</style>

<link rel="stylesheet" href="CSS/test.css">
<title>New Document</title>
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 드래그 할수 있는 기능을 사용하기 위해서 draggable();
 -->
<%
	//User user = new User();//generate user
	String userid = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String state = (String)request.getAttribute("state");
	String seatNo=(String) request.getParameter("button");
	
	
%>

</head>

<body>
	<!-- <button onClick="javascript:goDetail('테스트');">팝업</button> -->
	<form action="/iSpace/Status" method="get">
		<table>
			<tr>
				<h3><%=userid%> <%=name%> 님, WELCOME~~~~~~~~~:) <%=state%>
				<p id="demo"></p>
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
	
	<script>
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//문서영역의 크기 
		console.log("document 사이즈:" + $(document).width() + "*"
				+ $(document).height());
		//브라우저에서 문서가 보여지는 영역의 크기
		console.log("window 사이즈:" + $(window).width() + "*"
				+ $(window).height());

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//애니메이션 효과
		//$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("slow", 0.5);
	}

	function popupOpen() {
		$('.layerpop').css("position", "absolute");
		//영역 가운데에 레이어를 뛰우기 위해 위치 계산 
		$('.layerpop').css(
				"top",
				(($(window).height() - $('.layerpop').outerHeight()) / 2)
						+ $(window).scrollTop());
		$('.layerpop').css(
				"left",
				(($(window).width() - $('.layerpop').outerWidth()) / 2)
						+ $(window).scrollLeft());
		$('.layerpop').draggable();
		$('#layerbox').show();
	}

	function popupClose() {
		$('#layerbox').hide();
		$('#mask').hide();
	}

	function report() {
		/*팝업 오픈전 별도의 작업이 있을경우 구현*/
		popupOpen(); //레이어 팝업창 오픈 
		wrapWindowByMask(); //화면 마스크 효과 

	}
	
</script>



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
			<div class="content">
				<big><b><%=seatNo%>번 좌석을 신고하시겠습니까?</b></big></br> 신고항목을 선택해주세요<br> 
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
				<form action="/iSpace/view/home.jsp" method="get">
					<input type="submit" value="data">
				</form>
			</div>
		</article>
	</div>
		
	<div id="pop" style="display: none;">
		<div style="height: 20px;"><%=seatNo%>번 좌석에 입실하시겠습니까?</div>
		<form action="/iSpace/Insert" method="get">
		<input type="submit" value="<%=seatNo%>" name="button"> 
		</form>
		<div id="close">
			<input type="button" value="close">
		</div>
	</div>
	
	<!--<input type="submit" value="1" name="button" onClick="javascript:goDetail();" /> -->
	<%
	if(state!=null){
		if(state.equals("남의자리")){
	%>
	
<!-- <input type="submit" value="1" name="button" onClick="javascript:goDetail();" /> -->
	<script>
	//test();
	report();	
	</script>
	
	<!--Popup End -->
	<% 
		out.println(state);
		}
	 	else if(state.equals("빈자리")){
	%>
	
	<!-- 입실시키는 부분  -->
	<script>
	$('#pop').show();
	$('#close').click(function() {
		$('#pop').hide();
	});
	</script>
	
	<%
		}
	 	else if(state.equals("내자리")){
	%>
	<script>
	function checkOUT() {
		var txt;
		  var r = confirm("퇴실하시겠습니까?");
		  if (r == true) {
		    txt = "You pressed OK!";
		  } else {
		    txt = "You pressed Cancel!";
		  }
		  document.getElementById("demo").innerHTML = txt;
	}
	checkOUT();
	</script>
	<%
		 }	
	}
	else {
		out.println("Status에서 DB체크해서 넘어오는 거 error 1.내자리 2.빈자리 3.남의자리로 반환해야되는데 엉뚱한값 반환됨ㄱ- ");
	}
	%>
</body>
</html>