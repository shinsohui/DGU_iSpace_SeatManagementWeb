<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.ColorDAO"%>
<%@ page import="java.util.*, java.text.*"%>
<jsp:useBean id="colorBean" class="model.ColorBean" />
<jsp:setProperty name="colorBean" property="*" />
<%
            ColorDAO dao = ColorDAO.getInstance();   
            dao.joinMember(colorBean);
            ArrayList<String> color = (ArrayList<String>)colorBean.getColorList();
            dao.room1Color(colorBean);
            ArrayList<String> room1 = (ArrayList<String>)colorBean.getRoom1Color();
            dao.room2Color(colorBean);
            ArrayList<String> room2 = (ArrayList<String>)colorBean.getRoom2Color();
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

	<h5 style="text-align: right;">
		<b><%=userid%> <%=name%> 님</b>, <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;"> 신고<%=report%>회 <img
			src="/iSpace/view/Image/reportimg.png"
			style="width: 20px; height: 20px;">
	</h5>
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
	<nav id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink">SEAT </a>
				<ul class="submenu">
					<li><a href="about_.html" class="submenuLink"> </a></li>
				</ul></li>
			<li>|</li>

			<li class="topMenuLi"><a class="menuLink">NOTICE </a></li>

			<li>|</li>

			<li class="topMenuLi"><a class="menuLink" href="notice.jsp">SUGGEST
			</a>
				<ul class="submenu">

				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink">LOST&FOUND </a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink">MY PAGE</a>
				<ul class="submenu">

				</ul></li>
		</ul>
	</nav>


	<br>
	<div class="frame">
		<div class="whitebox"
			style="width: 700px; height: 460px; margin-left: 10px;">
			<p style="text-align: center;">


				<!--        시설		-->
				<!--          시설 팝업 만들어야 됨-->
				<!--       <table>
         <tr>
            <th><input type="submit" value="1" name="button" /></th>
            <th><input type="submit" value="2" name="button" /></th>
            <th><input type="submit" value="3" name="button" /></th>
            <th><input type="submit" value="4" name="button" /></th>
            <th><input type="submit" value="5" name="button" /></th>
            <th><input type="submit" value="6" name="button" /></th>
            <th><input type="submit" value="7" name="button" /></th>
            <th><input type="submit" value="8" name="button" /></th>
            <th><input type="submit" value="9" name="button" /></th>
            <th><input type="submit" value="10" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="11" name="button" /></th>
            <th><input type="submit" value="12" name="button" /></th>
            <th><input type="submit" value="13" name="button" /></th>
            <th><input type="submit" value="14" name="button" /></th>
            <th><input type="submit" value="15" name="button" /></th>
            <th><input type="submit" value="16" name="button" /></th>
            <th><input type="submit" value="17" name="button" /></th>
            <th><input type="submit" value="18" name="button" /></th>
            <th><input type="submit" value="19" name="button" /></th>
            <th><input type="submit" value="20" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="21" name="button" /></th>
            <th><input type="submit" value="22" name="button" /></th>
            <th><input type="submit" value="23" name="button" /></th>
            <th><input type="submit" value="24" name="button" /></th>
            <th><input type="submit" value="25" name="button" /></th>
            <th><input type="submit" value="26" name="button" /></th>
            <th><input type="submit" value="27" name="button" /></th>
            <th><input type="submit" value="28" name="button" /></th>
            <th><input type="submit" value="29" name="button" /></th>
            <th><input type="submit" value="30" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="31" name="button" /></th>
            <th><input type="submit" value="32" name="button" /></th>
            <th><input type="submit" value="33" name="button" /></th>
            <th><input type="submit" value="34" name="button" /></th>
            <th><input type="submit" value="35" name="button" /></th>
            <th><input type="submit" value="36" name="button" /></th>
            <th><input type="submit" value="37" name="button" /></th>
            <th><input type="submit" value="38" name="button" /></th>
            <th><input type="submit" value="39" name="button" /></th>
            <th><input type="submit" value="40" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="41" name="button" /></th>
            <th><input type="submit" value="42" name="button" /></th>
            <th><input type="submit" value="43" name="button" /></th>
            <th><input type="submit" value="44" name="button" /></th>
            <th><input type="submit" value="45" name="button" /></th>
            <th><input type="submit" value="46" name="button" /></th>
            <th><input type="submit" value="47" name="button" /></th>
            <th><input type="submit" value="48" name="button" /></th>
            <th><input type="submit" value="49" name="button" /></th>
            <th><input type="submit" value="50" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="51" name="button" /></th>
            <th><input type="submit" value="52" name="button" /></th>
            <th><input type="submit" value="53" name="button" /></th>
            <th><input type="submit" value="54" name="button" /></th>
            <th><input type="submit" value="55" name="button" /></th>
            <th><input type="submit" value="56" name="button" /></th>
            <th><input type="submit" value="57" name="button" /></th>
            <th><input type="submit" value="58" name="button" /></th>
            <th><input type="submit" value="59" name="button" /></th>
            <th><input type="submit" value="60" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="61" name="button" /></th>
            <th><input type="submit" value="62" name="button" /></th>
            <th><input type="submit" value="63" name="button" /></th>
            <th><input type="submit" value="64" name="button" /></th>
            <th><input type="submit" value="65" name="button" /></th>
            <th><input type="submit" value="66" name="button" /></th>
            <th><input type="submit" value="67" name="button" /></th>
            <th><input type="submit" value="68" name="button" /></th>
            <th><input type="submit" value="69" name="button" /></th>
            <th><input type="submit" value="70" name="button" /></th>
         </tr>
         <tr>
            <th><input type="submit" value="71" name="button" /></th>
            <th><input type="submit" value="72" name="button" /></th>
            <th><input type="submit" value="73" name="button" /></th>
            <th><input type="submit" value="74" name="button" /></th>
            <th><input type="submit" value="75" name="button" /></th>
            <th><input type="submit" value="76" name="button" /></th>
            <th><input type="submit" value="77" name="button" /></th>
         </tr>
      </table> -->
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
	</div>

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

	<!-- 팝업뜰때 배경 -->
	<div id="mask"></div>

	<!--Popup Start -->
	<form action="/iSpace/Report" method="get">
		<div id="layerbox" class="layerpop"
			style="width: 700px; height: 350px;">
			<article class="layerpop_area">
				<div class="title">
					<b>신고하기</b>
				</div>
				<a href="javascript:popupClose();" class="layerpop_close"
					id="layerbox_close"></a> <br>
				<div class="content">

					<big><b>신고될 좌석 번호 >></b></big> <select name="selected">
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
                                    $(this).val() == "기타" ? $(
                                          '#myTextBox').show()
                                          : $('#myTextBox')
                                                .hide();
                                 });
                        });
               </script>
					<br>
					<br>
					<div style="display: inline; float: left; width: 50px">
						<input type="submit" value="확인">
					</div>
					<div style="display: inline; float: left; width: 50px" id="close">
						<button value="close">취소</button>
					</div>

				</div>
			</article>
		</div>
	</form>



	<!-- 시설예약  -->
	<!-- 날짜, 시간,  -->
	<form action="/iSpace/Reservation" method="get">
	<div id="reserve" style="display: none;">
	<div><b>시설 예약</b></div><br>
		<% Calendar cal=Calendar.getInstance(); %>
		<div>
			<b>예약 날짜</b><br>
			<%= cal.get(Calendar.YEAR)%>년
			<%= cal.get(Calendar.MONTH)%>월
			<%= cal.get(Calendar.DATE)%>일
		</div><br>
	<div><b>이용률</b><br>
	
	<input type="button" onclick="javascript:seatbtn()" value="9"
		style="color: black; background: <%=room1.get(0)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="10"
		style="color: black; background: <%=room1.get(1)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="11"
		style="color: black; background: <%=room1.get(2)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="12"
		style="color: black; background: <%=room1.get(3)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="13"
		style="color: black; background: <%=room1.get(4)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="14"
		style="color: black; background: <%=room1.get(5)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="15"
		style="color: black; background: <%=room1.get(6)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="16"
		style="color: black; background: <%=room1.get(7)%>;">
	<input type="button" onclick="javascript:seatbtn()" value="17"
		style="color: black; background: <%=room1.get(8)%>;"> 
	<input type="button" onclick="javascript:seatbtn()" value="18"
		style="color: black; background: <%=room1.get(9)%>;">
	</div>
	<br>	
	
	<div><b>사용인원</b><small>&nbsp&nbsp최소인원:6&nbsp&nbsp&nbsp최대인원:10</small>
	<select id="total">
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="6">10</option>
	</select>
	</div><br> 
	<div>
	
	</div>
	<b>대표자&nbsp&nbsp<%=userid%>&nbsp<%=name%></b><br>
	<div id="user">
	<small>이용자 학번&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이용자 이름</small><br>
<!-- 	<input type="text" name="id1">
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
	
	<textarea rows="1" cols="15" id="id1"></textarea>
	<textarea rows="1" cols="7" id="name1"></textarea><br>
	<textarea rows="1" cols="15" id="id2"></textarea>
	<textarea rows="1" cols="7" id="name2"></textarea><br>
	<textarea rows="1" cols="15" id="id3"></textarea>
	<textarea rows="1" cols="7" id="name3"></textarea><br>
	<textarea rows="1" cols="15" id="id4"></textarea>
	<textarea rows="1" cols="7" id="name4"></textarea><br>
	<textarea rows="1" cols="15" id="id5"></textarea>
	<textarea rows="1" cols="7" id="name5"></textarea><br>
	<textarea rows="1" cols="15" id="id6"></textarea>
	<textarea rows="1" cols="7" id="name6"></textarea><br>
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
	<div style="display: inline; float: left; width: 60px" id="close4">
		<button>취소</button>
	</div>
	</div>
	</form>

	<script>
   $('#room').click(function() {
   $('#reserve').toggle(0,function() {
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
      //test();
      report();
   </script>

	<!--Popup End -->
	<%
/*       out.println(state);
 */         } else if (state.equals("빈자리")) {
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
      }else if(state.equals("재입실")){
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