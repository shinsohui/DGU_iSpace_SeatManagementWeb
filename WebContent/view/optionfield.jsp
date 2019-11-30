<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.PageManage"%>
<%@ page import="board.noticeDAO"%>
<%@ page import="board.notice"%>
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
%><!DOCTYPE html>
<html>
<head>
<%
	//User user = new User();//generate user
	String userid = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String state = (String) request.getAttribute("state");
	String seatNo = (String) request.getParameter("button");
	String myseatNo = (String) session.getAttribute("seatNo");
	String report = (String) session.getAttribute("report");
%>
</HEAD>
<BODY>




	<!-- 시설예약  -->
	<!-- 날짜, 시간,  -->

	<div id="reserve">
		<form action="/iSpace/Reservation" method="post">

			<b>시설 예약</b> <br>
			<%
				Calendar cal = Calendar.getInstance();
			%>

			<b>예약 날짜</b><br>
			<%=cal.get(Calendar.YEAR)%>년
			<%=cal.get(Calendar.MONTH) + 1%>월
			<%=cal.get(Calendar.DATE)%>일 <br> <b>이용률</b><br>
			<table id="util">
				<tr>
					<td><label class="container"><input type="radio"
							name="time" value="9"> <span class="checkmark" id="t0">09</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="10"> <span class="checkmark" id="t1">10</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="11"> <span class="checkmark" id="t2">11</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="12"> <span class="checkmark" id="t3">12</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="13"> <span class="checkmark" id="t4">13</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="14"> <span class="checkmark" id="t5">14</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="15"> <span class="checkmark" id="t6">15</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="16"> <span class="checkmark" id="t7">16</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="17"> <span class="checkmark" id="t8">17</span>
					</label></td>
					<td><label class="container"><input type="radio"
							name="time" value="18"> <span class="checkmark" id="t9">18</span>
					</label></td>
				</tr>
			</table>
			<%
				int temp = 0;
				for (int i = 0; i < 10; i++) {
					if (room1.get(i) == "gray") {
			%>
			<script>
            var btn = document.getElementById('t<%=i%>');
				btn.style.background = '#a3a3a3';
				btn.disabled = 'true';
			</script>

			<%
				System.out.println("if 문 i=" + i + " temp=" + temp + "색 : " + room1.get(i));
					} else {
						temp++;
					}
				}
			%>


			<br> <b>사용인원</b> <small>*&nbsp&nbsp최소인원:6&nbsp&nbsp&nbsp최대인원:10</small>
			<br> <b>대표자&nbsp&nbsp</b>
			<%=userid%>
			<%=name%><br>
			<div id="myform">
				<select id="mySelectMenu" onchange="replaceElement()">
					<option value="1">1</option>
					<option value="2" class="even">2</option>
					<option value="3">3</option>
					<option value="4" class="even">4</option>
					<option value="5">5</option>
				</select> 이용자학번&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이용자 이름
				<br> <input type="text" size="10" />
			</div>
	
	<script>
		function replaceElement() {
			var select = document.getElementById('mySelectMenu');
			var chosenoption = select.options[select.selectedIndex];
			var oChild = document.getElementsByTagName('input');
			var br1 = document.getElementsByTagName('br');
			var brLeng = br1.length-7;

			if (brLeng - chosenoption.value > 0) {
				var temp = brLeng - chosenoption.value;
				alert(temp);
				for (var i = 0; i < temp; i++) {
					alert("박스삭제" + i);
					myform.removeChild(oChild[1]);
					alert("줄바꿈삭제" + i);
					myform.removeChild(br1[1]);
				}
			}

			if (brLeng - chosenoption.value < 0) {
				var temp = -(brLeng - chosenoption.value);
				for (var i = 0; i < temp; i++) {
					alert("줄바꿈" + i);
					var br2 = document.createElement('br');
					myform.appendChild(br2);
					alert("박스추가" + i);
					var oNewChild = document.createElement('input');
					oNewChild.setAttribute("type", "text");
					oNewChild.setAttribute("size", "10");
					myform.appendChild(oNewChild);
				}
			}
		}
	</script>


	<div style="display: inline; float: left; width: 60px">
		<button>예약하기</button>
	</div>
	</form>
	<div style="display: inline; float: left; width: 60px" id="close4">
		<button>취소</button>
	</div>
	</div>

</BODY>
</HTML>