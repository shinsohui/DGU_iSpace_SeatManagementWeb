<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.PageManage"%>
<%@ page import = "board.noticeDAO"%>
<%@ page import = "board.notice"%>
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
	<p style="text-align: center;">
		<a href="/iSpace/view/home.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top: 3px;"></a>
	</p>

	<!-- remove -->
	<a href="/iSpace/view/home.jsp">home.jsp</a>
	<a href="/iSpace/view/mainUI.jsp">mainUI.jsp</a>


	<div align="center">
		<nav id="topMenu">
			<ul>
				<li class="topMenuLi"><a class="menuLink"
					href="/iSpace/view/home.jsp">SEAT </a></li>
				<li>|</li>

				<li class="topMenuLi"><a class="menuLink"
					href="/iSpace/view/BOARD/notice.jsp">NOTICE </a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink"
					href="/iSpace/view/BOARD/suggest.jsp">SUGGEST </a></li>

				<li>|</li>

				<li class="topMenuLi"><a class="menuLink"
					href="/iSpace/view/BOARD/lnf.jsp">LOST&FOUND </a></li>
			</ul>
		</nav>
	</div>


	<br>


	<div class="frame">
		<div class="whitebox"
			style="width: 700px; height: 460px; margin-left: 10px;">
			<p style="text-align: center;">

				<!--        시설		-->
				<button value="3DLAB" name="room"
					style="color: black; background: skyblue; position: absolute; left: 40px; top: 10px; height: 100px; width: 30px;">
					3<br>D<br>L<br>A<br>B
				</button>

				<!-- <form action="/iSpace/Facility" method="post">   -->
				<button value="seminar1" id="seminar1" name="room1"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 130px; width: 30px;">
					세<br>미<br>나<br>실<br>1
				</button>
				<!-- </form>
        <form action="/iSpace/Facility" method="post">  -->
				<button value="seminar2" id="seminar2" name="room2"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 250px; width: 30px;">
					세<br>미<br>나<br>실<br>2
				</button>


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
			style="width: 230px; height: 170px; margin-left: 720px; text-align: center">
			
			<h5>
				<b><%=userid%> <%=name%> 님</b> <br> <img
					src="/iSpace/view/Image/reportimg.png"
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
 			
				<!-- <input type="button" value="로그아웃" id="logout"> -->
			<a href="/iSpace/view/logout.jsp">
  		 <button id="logout">로그아웃</button>
		</a>
		</div>
		</div>
		<div class="whitebox"
      style="width: 210px; left: 995px; height: 260px; background-color: yellow; top: 420px; font-size: 17px; padding: 10px" >

      공지사항 <a href="/iSpace/view/BOARD/notice.jsp" style="text-decoration: none">+ <br></a>
      
         <%
            int pageNumber = 1; //기본 페이지 넘버
            //페이지넘버값이 있을때
            if (request.getParameter("pageNumber") != null) {
               pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            }
         %> 
         <br>
         <%
    noticeDAO notice = new noticeDAO();
    ArrayList<notice> list = notice.getList(pageNumber);
    for (int i = 0; i < list.size(); i++) {
                %>
		<table id="subboard">
         <tr>
         
            <td><a href="/iSpace/view/BOARD/view.jsp?noticeId=<%=list.get(i).getNoticeId()%>">
                  <%=list.get(i).getNoticeTitle()%><br>
            </a></td>
         </tr>
         </table> <%
    }
 %>
   </div>
		
	

	

	<!-- 시설예약  -->
	<!-- 날짜, 시간,  -->

	<div id="reserve" style="display: none;">
		<form action="/iSpace/Reservation" method="post">
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
			<div>
				<b>이용률</b><br>
				<table id="util">
					<tr>
						<td><label class="container"><input type="radio" name="time" value="9"> <span class="checkmark" id="t0">09</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="10"> <span class="checkmark" id="t1">10</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="11"> <span class="checkmark" id="t2">11</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="12"> <span class="checkmark" id="t3">12</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="13"> <span class="checkmark" id="t4">13</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="14"> <span class="checkmark" id="t5">14</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="15"> <span class="checkmark" id="t6">15</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="16"> <span class="checkmark" id="t7">16</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="17"> <span class="checkmark" id="t8">17</span> </label></td>
						<td><label class="container"><input type="radio" name="time" value="18"> <span class="checkmark" id="t9">18</span> </label></td>
					</tr>
				</table>
				<%
            int temp=0;
            for(int i=0;i<10;i++){
               if(room1.get(i)=="gray"){
         %>
         <script>
            var btn = document.getElementById('t<%=i%>');
            btn.style.background = '#a3a3a3';
            btn.disabled = 'true';
            
         </script>
         
         <%
            System.out.println("if 문 i="+i+" temp="+temp+"색 : "+room1.get(i));
               }else{
                  temp++;
               }
            }
         %>
 
 </div>
			
						<br> <b>사용인원</b>
				<small>*&nbsp&nbsp최소인원:6&nbsp&nbsp&nbsp최대인원:10</small>
			<div id="usersInfo">
				<select id="total" onchange="numberofusers()">
					<option value="1">6</option>
					<option value="2">7</option>
					<option value="3">8</option>
					<option value="4">9</option>
					<option value="5">10</option>
				</select>
				<p><b>대표자&nbsp&nbsp</b><br> 
				<input type="text" size="15" value=<%=userid%>>
				<input type="text" size="15" value=<%=name%>>
				<small><br>이용자 학번&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이용자 이름</small><br>
				<input type="text" size="15">
				<input type="text" size="15"><br>
				<input type="text" size="15">
				<input type="text" size="15"><br>
				<input type="text" size="15">
				<input type="text" size="15"><br>
				<input type="text" size="15">
				<input type="text" size="15"><br>
				<input type="text" size="15">
				<input type="text" size="15">
				
			<script>
				function numberofusers() {
					/* alert("infunction"); */
					var select = document.getElementById('total');
					var chosen = select.options[select.selectedIndex];
					
					var oldinput = document.getElementsByTagName('input');
					var p1 = document.getElementsByTagName('p');
					var pNum = p1.length-2; //p 총 몇개인지 
					/* alert("pNum : " + pNum); //지금의 숫자 
					alert("chosen :" + chosen.value); //고른 숫자  */
					
					//지금의 숫자보다 더 작은 수를 고르면 그만큼 없어져야 함.
					if (pNum - chosen.value > 0) {
						var temp = pNum - chosen.value;
						/* alert(temp); */
						for (var i = 0; i < temp; i++) {
							/* alert("remove" + i); */
							for(var j=0; j<2;j++){
							usersInfo.removeChild(oldinput[j]);
							usersInfo.removeChild(p1[j]);
							}
						}
					}

					if (pNum - chosen.value < 0) {
						var temp = -(pNum - chosen.value);
						for (var i = 0; i < temp; i++) {
							/* alert("generate" + i); */
							for(var j=0; j<2;j++){
								var newinput = document.createElement('input');
								newinput.setAttribute("type", "text");
								newinput.setAttribute("size", "15");
								usersInfo.appendChild(newinput);
							}
							var p2 = document.createElement('br');
							usersInfo.appendChild(p2);
							
						}
					}
				}
			</script>
			</div>


			<div style="display: inline; float: left; width: 60px">
				<button>예약하기</button>
			</div>
		</form>
		<div style="display: inline; float: left; width: 60px" id="close4">
			<button>취소</button>
		</div>
	</div>


	<script>
		$('#seminar1').click(function() {
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
	<script>
		$('#seminar2').click(function() {
			$('#reserve').toggle(0, function() {
				$('#close4').click(function() {
					$('#reserve').hide();
				});
			});

		});
	</script>


<!-- 좌석 관리 div 입. 퇴. 부. 재. 신 -->

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
	
<form action="/iSpace/Report" method="get">
		<div id="pop5" style="display: none;">
			<div class="title">
				<b>신고하기</b>
			</div>
			<a href="javascript:popupClose();" class="layerpop_close"
				id="layerbox_close"></a> <br>
			<div class="content">

				<h3>
					<b>신고될 좌석 번호 >></b>
				</h3>
				<select name="selected">
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