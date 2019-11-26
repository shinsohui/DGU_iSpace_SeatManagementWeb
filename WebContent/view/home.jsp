<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.PageManage"%>
<%@ page import="java.util.*,java.text.*"%>
<jsp:useBean id="colorBean" class="model.ColorBean" />
<jsp:setProperty name="colorBean" property="*" />
<%
	PageManage dao = PageManage.getInstance();

	dao.seatColor(colorBean);
	ArrayList<String> color = (ArrayList<String>) colorBean.getColorList();
	dao.room1Color(colorBean);
	ArrayList<String> room1 = (ArrayList<String>) colorBean.getRoom1Color();
	dao.room2Color(colorBean);
	ArrayList<String> room2 = (ArrayList<String>) colorBean.getRoom2Color();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
<%@include file="/view/CSS/home.css"%>
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<!-- 드래그 할수 있는 기능을 사용하기 위해서 draggable(); -->

<%
	//User user = new User();//generate user
	String userid = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String state = (String) request.getAttribute("state");
	String seatNo = (String) request.getParameter("button");
	String myseatNo = (String) session.getAttribute("seatNo");
	String report = (String) session.getAttribute("report");
%>
</head>

<body>
	<!-- <button onClick="javascript:goDetail('테스트');">팝업</button> -->


	<p style="text-align: center;">
		<a href="/iSpace/view/home.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;"></a>
	</p>

	<!-- remove -->
	<a href="/iSpace/view/home.jsp">home.jsp</a>
	<a href="/iSpace/view/mainUI.jsp">mainUI.jsp</a>

	<%-- <h5 style="text-align: right;">
		<b><%=userid%> <%=name%> 님</b>, <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;"> 좌석 <%=myseatNo%>번 <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;">
	</h5> --%>
	<!-- <th><button class="button" data-modal="confirm">Contact Us</button></th> -->

	<!--    <table border="1" style="width: 100%; text-align: center;">
      <tr>
         <td><a href="/iSpace/view/home.jsp">좌석현황 </a></td>
         <td>공지사항</td>
         <td>건의사항</td>
         <td>분실물센터</td>
         <td>MY PAGE</td>
      </tr>
   </table> -->
   
   <div align="center">
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink">SEAT </a></li>
			<li>|</li>

			<li class="topMenuLi"><a class="menuLink">NOTICE </a></li>

			<li>|</li>

			<li class="topMenuLi"><a class="menuLink" href="notice.jsp">SUGGEST
			</a></li>
			
			<li>|</li>
			
			<li class="topMenuLi"><a class="menuLink">LOST&FOUND </a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink">MY PAGE</a>
				</li>
		</ul>
	</nav>
	</div>


	<br>
	
	
	<div class="frame">
		<div class="whitebox"
			style="width: 700px; height: 460px; margin-left: 10px;">
			<p style="text-align: center;">


				<!--        시설		-->
				<!--          시설 팝업 만들어야 됨-->
				<!--       
	    -->
				<!--        시설		-->

				<button value="3DLAB" name="room"
					style="color: black; background: skyblue; position: absolute; left: 40px; top: 10px; height: 100px; width: 30px;">
					3<br>D<br>L<br>A<br>B
				</button>

				<!-- <form action="/iSpace/Facility" method="post">   -->
				<button value="seminar1" id="room" name="room1"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 130px; width: 30px;">
					세<br>미<br>나<br>실<br>1
				</button>
				<!-- </form>
   	  <form action="/iSpace/Facility" method="post">  -->
				<button value="seminar2" id="room" name="room2"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 250px; width: 30px;">
					세<br>미<br>나<br>실<br>2
				</button>
				<!--  </form> -->

				<!-- <input type="submit" value = "3DLAB" name = "room" 
        style= "color: black; background:skyblue; position: absolute;
        left: 40px; top: 10px; height: 100px; width: 30px;" > 
      <input type = "submit" value = "세미나실1" name = "room"
       style= "color: black; background:skyblue; height: 100px; position: absolute; left: 40px; top: 130px;
       width: 30px;"> 
       
       <input type = "submit" value = "세미나실2" name = "room"
       style= "color: black; background:skyblue; height: 100px; position: absolute; left: 40px; top: 250px;
       width: 30px;"> 
       </form> -->

				<!--    </form>
       -->

				<!--        좌석		-->
			<form action="/iSpace/Status" method="get">

				<input type="submit" value="1" name="button"
					style="color: black; background: <%=color.get(0)%>; height: 30px; position: absolute; left: 120px; top: 10px; width: 30px;">

				<input type="submit" value="2" name="button"
					style="color: black; background: <%=color.get(1)%>; height: 30px; position: absolute; left: 150px; top: 10px; width: 30px;">

				<input type="submit" value="3" name="button"
					style="color: black; background: <%=color.get(2)%>; height: 30px; position: absolute; left: 195px; top: 10px; width: 30px;">

				<input type="submit" value="4" name="button"
					style="color: black; background: <%=color.get(3)%>; height: 30px; position: absolute; left: 225px; top: 10px; width: 30px;">

				<input type="submit" value="5" name="button"
					style="color: black; background: <%=color.get(4)%>; height: 30px; position: absolute; left: 255px; top: 10px; width: 30px;">

				<input type="submit" value="6" name="button"
					style="color: black; background: <%=color.get(5)%>; height: 30px; position: absolute; left: 285px; top: 10px; width: 30px;">

				<input type="submit" value="7" name="button"
					style="color: black; background: <%=color.get(6)%>; height: 30px; position: absolute; left: 330px; top: 10px; width: 30px;">

				<input type="submit" value="8" name="button"
					style="color: black; background: <%=color.get(7)%>; height: 30px; position: absolute; left: 360px; top: 10px; width: 30px;">

				<input type="submit" value="9" name="button"
					style="color: black; background: <%=color.get(8)%>; height: 30px; position: absolute; left: 390px; top: 10px; width: 30px;">

				<input type="submit" value="10" name="button"
					style="color: black; background: <%=color.get(9)%>; height: 30px; position: absolute; left: 420px; top: 10px; width: 30px;">

				<input type="submit" value="11" name="button"
					style="color: black; background: <%=color.get(10)%>; height: 30px; position: absolute; left: 450px; top: 10px; width: 30px;">

				<input type="submit" value="12" name="button"
					style="color: black; background: <%=color.get(11)%>; height: 30px; position: absolute; left: 480px; top: 10px; width: 30px;">

				<input type="submit" value="13" name="button"
					style="color: black; background: <%=color.get(12)%>; height: 30px; position: absolute; left: 510px; top: 10px; width: 30px;">

				<input type="submit" value="14" name="button"
					style="color: black; background: <%=color.get(13)%>; height: 30px; position: absolute; left: 540px; top: 10px; width: 30px;">

				<input type="submit" value="15" name="button"
					style="color: black; background: <%=color.get(14)%>; height: 30px; position: absolute; left: 585px; top: 10px; width: 30px;">

				<input type="submit" value="16" name="button"
					style="color: black; background: <%=color.get(15)%>; height: 40px; position: absolute; left: 140px; top: 80px; width: 40px;">

				<input type="submit" value="17" name="button"
					style="color: black; background: <%=color.get(16)%>; height: 40px; position: absolute; left: 120px; top: 120px; width: 40px;">

				<input type="submit" value="18" name="button"
					style="color: black; background: <%=color.get(17)%>; height: 40px; position: absolute; left: 160px; top: 120px; width: 40px;">

				<input type="submit" value="19" name="button"
					style="color: black; background: <%=color.get(18)%>; height: 40px; position: absolute; left: 120px; top: 160px; width: 40px;">

				<input type="submit" value="20" name="button"
					style="color: black; background: <%=color.get(19)%>; height: 40px; position: absolute; left: 160px; top: 160px; width: 40px;">

				<input type="submit" value="21" name="button"
					style="color: black; background: <%=color.get(20)%>; height: 40px; position: absolute; left: 120px; top: 200px; width: 40px;">

				<input type="submit" value="22" name="button"
					style="color: black; background: <%=color.get(21)%>; height: 40px; position: absolute; left: 160px; top: 200px; width: 40px;">

				<input type="submit" value="23" name="button"
					style="color: black; background: <%=color.get(22)%>; height: 40px; position: absolute; left: 120px; top: 240px; width: 40px;">

				<input type="submit" value="24" name="button"
					style="color: black; background: <%=color.get(23)%>; height: 40px; position: absolute; left: 160px; top: 240px; width: 40px;">

				<input type="submit" value="25" name="button"
					style="color: black; background: <%=color.get(24)%>; height: 40px; position: absolute; left: 140px; top: 280px; width: 40px;">

				<input type="submit" value="26" name="button"
					style="color: black; background: <%=color.get(25)%>; height: 40px; position: absolute; left: 230px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="27" name="button"
					style="color: black; background: <%=color.get(26)%>; height: 40px; position: absolute; left: 270px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="28" name="button"
					style="color: black; background: <%=color.get(27)%>; height: 40px; position: absolute; left: 230px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="29" name="button"
					style="color: black; background: <%=color.get(28)%>; height: 40px; position: absolute; left: 270px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="30" name="button"
					style="color: black; background: <%=color.get(29)%>; height: 40px; position: absolute; left: 330px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="31" name="button"
					style="color: black; background: <%=color.get(30)%>; height: 40px; position: absolute; left: 370px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="32" name="button"
					style="color: black; background: <%=color.get(31)%>; height: 40px; position: absolute; left: 330px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="33" name="button"
					style="color: black; background: <%=color.get(32)%>; height: 40px; position: absolute; left: 370px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="34" name="button"
					style="color: black; background: <%=color.get(33)%>; height: 40px; position: absolute; left: 430px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="35" name="button"
					style="color: black; background: <%=color.get(34)%>; height: 40px; position: absolute; left: 470px; top: 90px; width: 40px; border-radius: 18px">

				<input type="submit" value="36" name="button"
					style="color: black; background: <%=color.get(35)%>; height: 40px; position: absolute; left: 430px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="37" name="button"
					style="color: black; background: <%=color.get(36)%>; height: 40px; position: absolute; left: 470px; top: 130px; width: 40px; border-radius: 18px">

				<input type="submit" value="38" name="button"
					style="color: black; background: <%=color.get(37)%>; height: 40px; position: absolute; left: 230px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="39" name="button"
					style="color: black; background: <%=color.get(38)%>; height: 40px; position: absolute; left: 270px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="40" name="button"
					style="color: black; background: <%=color.get(39)%>; height: 40px; position: absolute; left: 230px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="41" name="button"
					style="color: black; background: <%=color.get(40)%>; height: 40px; position: absolute; left: 270px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="42" name="button"
					style="color: black; background: <%=color.get(41)%>; height: 40px; position: absolute; left: 330px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="43" name="button"
					style="color: black; background: <%=color.get(42)%>; height: 40px; position: absolute; left: 370px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="44" name="button"
					style="color: black; background: <%=color.get(43)%>; height: 40px; position: absolute; left: 330px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="45" name="button"
					style="color: black; background: <%=color.get(44)%>; height: 40px; position: absolute; left: 370px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="46" name="button"
					style="color: black; background: <%=color.get(45)%>; height: 40px; position: absolute; left: 430px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="47" name="button"
					style="color: black; background: <%=color.get(46)%>; height: 40px; position: absolute; left: 470px; top: 180px; width: 40px; border-radius: 18px">

				<input type="submit" value="48" name="button"
					style="color: black; background: <%=color.get(47)%>; height: 40px; position: absolute; left: 430px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="49" name="button"
					style="color: black; background: <%=color.get(48)%>; height: 40px; position: absolute; left: 470px; top: 220px; width: 40px; border-radius: 18px">

				<input type="submit" value="50" name="button"
					style="color: black; background: <%=color.get(49)%>; height: 40px; position: absolute; left: 560px; top: 80px; width: 40px;">

				<input type="submit" value="51" name="button"
					style="color: black; background: <%=color.get(50)%>; height: 40px; position: absolute; left: 540px; top: 120px; width: 40px;">

				<input type="submit" value="52" name="button"
					style="color: black; background: <%=color.get(51)%>; height: 40px; position: absolute; left: 580px; top: 120px; width: 40px;">

				<input type="submit" value="53" name="button"
					style="color: black; background: <%=color.get(52)%>; height: 40px; position: absolute; left: 540px; top: 160px; width: 40px;">

				<input type="submit" value="54" name="button"
					style="color: black; background: <%=color.get(53)%>; height: 40px; position: absolute; left: 580px; top: 160px; width: 40px;">

				<input type="submit" value="55" name="button"
					style="color: black; background: <%=color.get(54)%>; height: 40px; position: absolute; left: 540px; top: 200px; width: 40px;">

				<input type="submit" value="56" name="button"
					style="color: black; background: <%=color.get(55)%>; height: 40px; position: absolute; left: 580px; top: 200px; width: 40px;">

				<input type="submit" value="57" name="button"
					style="color: black; background: <%=color.get(56)%>; height: 40px; position: absolute; left: 540px; top: 240px; width: 40px;">

				<input type="submit" value="58" name="button"
					style="color: black; background: <%=color.get(57)%>; height: 40px; position: absolute; left: 580px; top: 240px; width: 40px;">

				<input type="submit" value="59" name="button"
					style="color: black; background: <%=color.get(58)%>; height: 40px; position: absolute; left: 560px; top: 280px; width: 40px;">

				<input type="submit" value="60" name="button"
					style="color: black; background: <%=color.get(59)%>; height: 35px; position: absolute; left: 230px; top: 340px; width: 40px;">

				<input type="submit" value="61" name="button"
					style="color: black; background: <%=color.get(60)%>; height: 35px; position: absolute; left: 270px; top: 340px; width: 40px;">

				<input type="submit" value="62" name="button"
					style="color: black; background: <%=color.get(61)%>; height: 35px; position: absolute; left: 230px; top: 375px; width: 40px;">

				<input type="submit" value="63" name="button"
					style="color: black; background: <%=color.get(62)%>; height: 35px; position: absolute; left: 270px; top: 375px; width: 40px;">

				<input type="submit" value="64" name="button"
					style="color: black; background: <%=color.get(63)%>; height: 35px; position: absolute; left: 330px; top: 340px; width: 40px;">

				<input type="submit" value="65" name="button"
					style="color: black; background: <%=color.get(64)%>; height: 35px; position: absolute; left: 370px; top: 340px; width: 40px;">

				<input type="submit" value="66" name="button"
					style="color: black; background: <%=color.get(65)%>; height: 35px; position: absolute; left: 330px; top: 375px; width: 40px;">

				<input type="submit" value="67" name="button"
					style="color: black; background: <%=color.get(66)%>; height: 35px; position: absolute; left: 370px; top: 375px; width: 40px;">

				<input type="submit" value="68" name="button"
					style="color: black; background: <%=color.get(67)%>; height: 35px; position: absolute; left: 430px; top: 340px; width: 40px;">

				<input type="submit" value="69" name="button"
					style="color: black; background: <%=color.get(68)%>; height: 35px; position: absolute; left: 470px; top: 340px; width: 40px;">

				<input type="submit" value="70" name="button"
					style="color: black; background: <%=color.get(69)%>; height: 35px; position: absolute; left: 430px; top: 375px; width: 40px;">

				<input type="submit" value="71" name="button"
					style="color: black; background: <%=color.get(70)%>; height: 35px; position: absolute; left: 470px; top: 375px; width: 40px;">

				<input type="submit" value="72" name="button"
					style="color: black; background: <%=color.get(71)%>; height: 30px; position: absolute; left: 540px; top: 330px; width: 30px; border-radius: 18px">

				<input type="submit" value="73" name="button"
					style="color: black; background: <%=color.get(72)%>; height: 30px; position: absolute; left: 540px; top: 360px; width: 30px; border-radius: 18px">

				<input type="submit" value="74" name="button"
					style="color: black; background: <%=color.get(73)%>; height: 30px; position: absolute; left: 570px; top: 360px; width: 30px; border-radius: 18px">

				<input type="submit" value="75" name="button"
					style="color: black; background: <%=color.get(74)%>; height: 30px; position: absolute; left: 540px; top: 390px; width: 30px; border-radius: 18px">

				<input type="submit" value="76" name="button"
					style="color: black; background: <%=color.get(75)%>; height: 30px; position: absolute; left: 570px; top: 390px; width: 30px; border-radius: 18px">

				<input type="submit" value="77" name="button"
					style="color: black; background: <%=color.get(76)%>; height: 30px; position: absolute; left: 540px; top: 420px; width: 30px; border-radius: 18px">
			</form>
		</div>
		
		<div class="whitebox"
			style="width: 230px; height: 230px; margin-left: 720px; text-align: center">
			<h5>
				<b><%=userid%> <%=name%> 님</b> <br>
				<img src="/iSpace/view/Image/reportimg.png"
					style="width: 20px; height: 20px;">
				<%
					if (myseatNo.equals("선택된 좌석이 없습니다.")) {
				%>
				선택된 좌석이 없습니다.
				<%
					} else {
				%>
				좌석
				<%=myseatNo%>번
				<%
					}
				%><img src="/iSpace/view/Image/reportimg.png"
					style="width: 20px; height: 20px;">
			</h5>
			<form action="/iSpace/Logout" method="get">
			<input type="submit" value="로그아웃" name="logout" id="logout">
			</form>
			
		</div>

	</div>

	<form action="/iSpace/Report" method="get">
	<div id="pop5" style="display: none;">
		<div class="title">
			<b>신고하기</b>
		</div>
		<a href="javascript:popupClose();" class="layerpop_close"
			id="layerbox_close"></a> <br>
		<div class="content">

			<h3><b>신고될 좌석 번호 >></b></h3> <select name="selected">
				<option value="<%=seatNo%>"><%=seatNo%></option>
			</select> <br> <br> 신고항목을 선택해주세요<br> <select
				id="reason_selection" name="reason">
				<option value="너무 시끄러워요.">너무 시끄러워요.</option>
				<option value="오랫동안 부재인 좌석입니다.">오랫동안 부재인 좌석입니다.</option>
				<option value="음식 섭취중입니다.">음식 섭취중입니다.</option>
				<option value="기타">기타</option>
			</select>
			<textarea rows="4" cols="50" name="reason" class="hiddenField"
				id="myTextBox" placeholder="신고 내용을 기재해주세요."></textarea>
			<script type="text/javascript">
				$(document).ready(
						function() {
							$('#reason_selection').change(
									function() {
										$(this).val() == "기타" ? $('#myTextBox')
												.show() : $('#myTextBox')
												.hide();
									});
						});
			</script>
			<br> <br>
			<div style="display: inline; float: left; width: 50px">
				<input type="submit" value="확인">
			</div>
			<div style="display: inline; float: left; width: 50px" id="close5">
				<button value="close">취소</button>
			</div>

		</div>
	</div>
</form>



	<!-- 시설예약  -->
	<!-- 날짜, 시간,  -->
	   
      <div id="reserve" style="display: none;">
      <form action="/iSpace/Reservation" method="get">
         <div>
            <b>시설 예약</b>
         </div>
         <br>
         <%
            Calendar cal = Calendar.getInstance();
         %>
         <div>
            <b>예약 날짜</b><br>
            <%=cal.get(Calendar.YEAR)%>년
            <%=cal.get(Calendar.MONTH) + 1%>월
            <%=cal.get(Calendar.DATE)%>일
         </div>
         <br>
         
<%-- <table>
         <tr>
         <td  class="td1" style="background: <%=room1.get(0)%>;">9<input type="button" class="stylebutton" onclick="submitButtonStyle(this)" id="t1"></td>
         <td  class="td1" style="background: <%=room1.get(1)%>;">10<input type="button" class="button2" onclick="submitButtonStyle2()" id="t2"></td>
         <td style="background: <%=room1.get(2)%>;">11<input type="button" id="t"></td>
         <td style="background: <%=room1.get(3)%>;">12<input type="button" id="t"></td>
         <td style="background: <%=room1.get(4)%>;">33<input type="button" id="t"></td>
         <td style="background: <%=room1.get(5)%>;">44<input type="button" id="t"></td>
         <td style="background: <%=room1.get(6)%>;">15<input type="button" id="t"></td>
         <td style="background: <%=room1.get(7)%>;">16<input type="button" id="t"></td>
         <td style="background: <%=room1.get(8)%>;">17<input type="button" id="t"></td>
         <td style="background: <%=room1.get(9)%>;">18<input type="button" id="t"></td>
         </tr>
         </table>
         --%>


          <input type="hidden"name="room" value="ROOM1">
          <input type="hidden"name="login_id" value="<%=userid%>">
          <input type="hidden"name="login_name" value="<%=name%>">

         <div>
            <b>이용률</b><br> 
            <input type="button" name="time" onclick="submitButtonStyle(this)" id="t0" value="9"
               style="color: black; background: <%=room1.get(0)%>;"> 
               <input type="button" onclick="submitButtonStyle(this)" id="t1"  value="10"
               style="color: black; background: <%=room1.get(1)%>;"> 
               
               <input type="button" onclick="javascript:seatbtn()" value="11"
               style="color: black; background: <%=room1.get(2)%>;"> <input
               type="button" name="time" onclick="javascript:seatbtn()" value="12"
               style="color: black; background: <%=room1.get(3)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="13"
               style="color: black; background: <%=room1.get(4)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="14"
               style="color: black; background: <%=room1.get(5)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="15"
               style="color: black; background: <%=room1.get(6)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="16"
               style="color: black; background: <%=room1.get(7)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="17"
               style="color: black; background: <%=room1.get(8)%>;"> <input
               type="button" onclick="javascript:seatbtn()" value="18"
               style="color: black; background: <%=room1.get(9)%>;">
         </div>
          <input type="hidden" id="time" name="time" value="">
          
          <br>
         
         <%-- 
         <%
            for (int i = 0; i < 10; i++) {
               if (room1.get(i) == "gray") {
         %>
         <script>
            var btn = document.getElementById('t1');

            var btn = document.getElementById('btn-world');
            btn.disabled = 'disabled';
         </script>
         <%
               }
            }
         %>
 --%>
 
<!--           시간들 각각 회색인지 확인
 -->      
          <%
            if (room1.get(0) == "gray") {
         %>
         <script>
            var btn = document.getElementById('t0');
            btn.disabled = 'disabled';
         </script>
         <%
            }
         %>
         <%
            if (room1.get(1) == "gray") {
         %>
         <script>
         <%
          System.out.println("회색회색");
         %>
         	alert('이미 예약되어 있는 시간입니다ㅠㅠ');
            var btn = document.getElementById('t1');
            btn.disabled = 'disabled';
         </script>
         <%
            }
         %>

         <!--       색 확인해서 시간만큼 가능하면 빨간색으로
 -->      
      <script>
      
      function submitButtonStyle(_this) {
         <%
          System.out.println("파란 시간 눌렀다!!");
         %>
         
         _this.style.background = "red";
          //var tm = document.getElementById('time');
          //var tzero = document.getElementById('t0');
         //tm.attr('value',tzero.value); 
         document.getElementById('time').value=document.getElementById('t0').value;
            
      }

       
      </script>
         
         
<!-- 
         <div>
            <b>시작시간</b> <select id="starttime">
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
               <option value="13">13</option>
               <option value="14">14</option>
               <option value="15">15</option>
               <option value="16">16</option>
               <option value="17">17</option>
               <option value="18">18</option>
            </select> <b>끝난시간</b> <select id="endtime">
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
               <option value="13">13</option>
               <option value="14">14</option>
               <option value="15">15</option>
               <option value="16">16</option>
               <option value="17">17</option>
               <option value="18">18</option>
            </select>
         </div>
         <br>

 -->

         <div>
            <b>사용인원</b><small>&nbsp&nbsp최소인원:6&nbsp&nbsp&nbsp최대인원:10</small> <select
               id="total">
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="6">10</option>
            </select>
         </div>
         <br>
         <div></div>
         <b>대표자&nbsp&nbsp<%=userid%>&nbsp<%=name%></b><br>
         <div id="user">
            <small>이용자
               학번&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이용자 이름</small><br>
            <!--    <input type="text" name="id1">
   <input type="text" name="name1"><br>
   <input type="text" name="id2">
   <input type="text" name="name2"><br>
   <input type="text" name="id3">
   <input type="text" name="name3"><br>
   <input type="text" name="id4">
   <input type="text" name="name4"><br>
   <input type="text" name="id5">
   <input type="text" name="name5"><br>
   <input type="text" name="id6">
   <input type="text" name="name6"><br> -->

            <textarea rows="1" cols="15" name="id1"></textarea>
            <textarea rows="1" cols="7" name="name1"></textarea>
            <br>
            <textarea rows="1" cols="15" id="id2"></textarea>
            <textarea rows="1" cols="7" id="name2"></textarea>
            <br>
            <textarea rows="1" cols="15" id="id3"></textarea>
            <textarea rows="1" cols="7" id="name3"></textarea>
            <br>
            <textarea rows="1" cols="15" id="id4"></textarea>
            <textarea rows="1" cols="7" id="name4"></textarea>
            <br>
            <textarea rows="1" cols="15" id="id5"></textarea>
            <textarea rows="1" cols="7" id="name5"></textarea>
            <br>
            <textarea rows="1" cols="15" id="id6"></textarea>
            <textarea rows="1" cols="7" id="name6"></textarea>
            <br>
            <!-- <button id="append" onlick="append()">추가하기</button>
   <script>
   function append(){
      /* var txt1 = "<textarea ></textarea><br><textarea ></textarea><br>"; */ 
      var txt1="<p>test</p>";
      
      $("#user").append(txt1);
   }
   
   </script> -->

         </div>


         <!-- <script type="text/javascript">
   $(document).ready(function() {
       $('#total').change(function() {
            $(this).val() == "기타"?$('#myTextBox').show():$('#myTextBox').hide();
        });
    });
   
   </script> -->


         <div style="display: inline; float: left; width: 60px">
            <button>예약하기</button>
         </div>
         </form>
         <div style="display: inline; float: left; width: 60px" id="close4">
            <button>취소</button>
         </div>
      </div>
     
   
	<script>
		$('#room').click(function() {
			$('#reserve').toggle(0, function() {
				$('#close4').click(function() {
					$('#reserve').hide();
				});
			});

		});/* 
		   $(function(){
			    $("#date1").datepicker();
			}); */
	</script>





	<div id="pop" style="display: none;">
		<div style="height: 20px;"><%=seatNo%>번 좌석에 입실하시겠습니까?
		</div>
		<form action="/iSpace/CheckIn" method="get">
			<div style="display: inline; float: left; width: 60px">
				<button value="<%=seatNo%>" name="button">입실</button>
			</div>
		</form>
		<div style="display: inline; float: left; width: 60px" id="close1">
			<button>취소</button>
		</div>
	</div>

	<div id="pop2" style="display: none;">
		<div style="height: 20px;"><%=seatNo%>번 좌석에서 퇴실하시겠습니까?
		</div>
		<form action="/iSpace/CheckOut" method="get">
			<div style="display: inline; float: left; width: 60px">
				<button value="<%=seatNo%>" name="button">퇴실</button>
			</div>
		</form>
		<div style="display: inline; float: left; width: 60px" id="close2">
			<button>취소</button>
		</div>
		<form action="/iSpace/Absence" method="get">
			<div style="display: inline; float: left; width: 60px">
				<button value="<%=seatNo%>" name="absence">부재</button>
			</div>
		</form>
	</div>

	<div id="pop3" style="display: none;">
		<div style="height: 20px;"><%=seatNo%>번 좌석에 재입실하시겠습니까?
		</div>
		<form action="/iSpace/ReCheckIn" method="get">
			<div style="display: inline; float: left; width: 60px">
				<button value="<%=seatNo%>" name="button">재입실</button>
			</div>
		</form>
		<div style="display: inline; float: left; width: 60px" id="close3">
			<button>취소</button>
		</div>
	</div>

	<%
		if (state != null) {
			if (state.equals("남의자리")) {
	%>

	<script>
		$('#pop5').show();
		$('#close5').click(function() {
			$('#pop5').hide();
		});
	</script>

	<!--Popup End -->
	<%
		/*       out.println(state);
				 */ } else if (state.equals("빈자리")) {
	%>

	<!-- 입실시키는 부분  -->
	<script>
		$('#pop').show();
		$('#close1').click(function() {
			$('#pop').hide();
		});
	</script>

	<%
		} else if (state.equals("내자리")) {
	%>
	<!-- 퇴실시키는 부분  -->
	<script>
		$('#pop2').show();
		$('#close2').click(function() {
			$('#pop2').hide();
		});
	</script>
	<%
		} else if (state.equals("재입실")) {
	%>
	<script>
		$('#pop3').show();
		$('#close3').click(function() {
			$('#pop3').hide();
		});
	</script>

	<%
      }else {
/*          out.println("Status에서 DB체크해서 넘어오는 거 error 1.내자리 2.빈자리 3.남의자리로 반환해야되는데 엉뚱한값 반환됨ㄱ- ");
 */      }
      }
   %>
</body>
</html>