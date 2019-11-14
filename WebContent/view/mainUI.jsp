<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>mainUI</title>
<style><%@include file="/view/CSS/mainUI.css"%></style>
</head>
<body>
	  <p style="text-align: center;">
		<a href="/iSpace/view/mainUI.jsp"><img
			src="/iSpace/view/Image/mainlogo.png"
			style="width: 400px; height: 80px; padding-top:3px;"></a>
	</p>
	
	<h5 style="text-align: right; text-indent: 100%; white-space: nowrap; overflow: hidden;">
    no content </h5>
	
	<!-- <table border="1" style="width:100%; text-align:center;">
   <tr>
   <td><a href="/iSpace/view/home.jsp">좌석현황 </a></td>
   <td>공지사항 </td>
   <td>건의사항 </td>
   <td>분실물센터 </td>
   <td>MY PAGE </td>
   </tr>
   </table> -->
   <nav id="topMenu" >
         <ul>
            <li class="topMenuLi"><a class="menuLink">좌석현황</a>
               <ul class="submenu">
                  <li><a href="about_.html" class="submenuLink"> </a></li>
               </ul></li>
            <li>|</li>

            <li class="topMenuLi"><a class="menuLink">공지사항</a></li>

            <li>|</li>

            <li class="topMenuLi"><a class="menuLink">건의사항</a>
               <ul class="submenu">

               </ul></li>
            <li>|</li>
            <li class="topMenuLi"><a class="menuLink">분실물센터</a></li>
            <li>|</li>
            <li class="topMenuLi"><a class="menuLink">MY PAGE</a>
               <ul class="submenu">

               </ul></li>
         </ul>
      </nav>
   
	<div class="frame">

			<div class="whitebox" id="seat"
				style="position: absolute; width: 700px; height: 460px; margin-left: 10px;">

				<p style="text-align: center;">

<!-- 				<input type="button" onclick="javascript:seatbtn()" value="3DLAB"
					style="color: black; background: skyblue; position: absolute; left: 40px; top: 10px; height: 100px; width: 30px;"> 
				<input type="button" onclick="javascript:seatbtn()" value="세미나실1"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 130px; width: 30px;"> 
				<input type="button" onclick="javascript:seatbtn()" value="세미나실2"
					style="color: black; background: skyblue; height: 100px; position: absolute; left: 40px; top: 250px; width: 30px;">
 -->

<!-- 	시설은 세로 정렬해야 돼서 버튼으로 바꿈
 -->      
 	  <button onclick="javascript:seatbtn()" value="3DLAB"  style= "color: black; background:skyblue; position: absolute; left: 40px; top: 10px; height: 100px; 
 	   width: 30px;">3<br>D<br>L<br>A<br>B</button>
      <button onclick="javascript:seatbtn()" value="세미나실1"  style= "color: black; background:skyblue; height: 100px; position: absolute; left: 40px; top: 130px;
       width: 30px;">세<br>미<br>나<br>실<br>1</button>  
   	  <button onclick="javascript:seatbtn()" value="세미나실2"  style= "color: black; background:skyblue; height: 100px; position: absolute; left: 40px; top: 250px;
       width: 30px;">세<br>미<br>나<br>실<br>2</button>


				<input type="button" onclick="javascript:seatbtn()"  value="1" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 120px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="2" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 150px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="3" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 195px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="4" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 225px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="5" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 255px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="6" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 285px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="7" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 330px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="8" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 360px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="9" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 390px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="10" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 420px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="11" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 450px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="12" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 480px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="13" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 510px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="14" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 540px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="15" 
						style="color: black; background: skyblue; height: 30px; position: absolute; left: 585px; top: 10px; width: 30px;">

					<input type="button" onclick="javascript:seatbtn()"  value="16" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 140px; top: 80px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="17" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 120px; top: 120px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="18" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 160px; top: 120px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="19" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 120px; top: 160px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="20" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 160px; top: 160px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="21" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 120px; top: 200px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="22" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 160px; top: 200px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="23" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 120px; top: 240px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="24" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 160px; top: 240px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="25" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 140px; top: 280px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="26" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 230px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="27" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 270px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="28" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 230px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="29" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 270px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="30" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 330px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="31" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 370px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="32" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 330px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="33" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 370px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="34" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 430px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="35" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 470px; top: 90px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="36" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 430px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="37" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 470px; top: 130px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="38" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 230px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="39" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 270px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="40" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 230px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="41" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 270px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="42" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 330px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="43" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 370px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="44" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 330px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="45" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 370px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="46" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 430px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="47" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 470px; top: 180px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="48" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 430px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="49" 
						style="color: black; background: gray; height: 40px; position: absolute; left: 470px; top: 220px; width: 40px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="50" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 560px; top: 80px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="51" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 540px; top: 120px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="52" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 580px; top: 120px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="53" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 540px; top: 160px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="54" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 580px; top: 160px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="55" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 540px; top: 200px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="56" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 580px; top: 200px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="57" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 540px; top: 240px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="58" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 580px; top: 240px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="59" 
						style="color: black; background: skyblue; height: 40px; position: absolute; left: 560px; top: 280px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="60" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 230px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="61" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 270px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="62" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 230px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="63" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 270px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="64" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 330px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="65" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 370px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="66" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 330px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="67" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 370px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="68" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 430px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="69" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 470px; top: 340px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="70" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 430px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="71" 
						style="color: black; background: skyblue; height: 35px; position: absolute; left: 470px; top: 375px; width: 40px;">

					<input type="button" onclick="javascript:seatbtn()"  value="72" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 540px; top: 330px; width: 30px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="73" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 540px; top: 360px; width: 30px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="74" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 570px; top: 360px; width: 30px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="75" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 540px; top: 390px; width: 30px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="76" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 570px; top: 390px; width: 30px; border-radius: 18px">

					<input type="button" onclick="javascript:seatbtn()"  value="77" 
						style="color: black; background: gray; height: 30px; position: absolute; left: 540px; top: 420px; width: 30px; border-radius: 18px">
			</div>
	</div>

	<script>
	function seatbtn(){ alert('You need to LOGIN first'); }

	</script>
	

	<div class="whitebox"
		style="width: 230px; background-color: white; left: 995px; top: 240px; height: 170px; ">

		<form action=/iSpace/DoLogin method="post" style="padding-top:55px; padding-left:28px;">
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="ID"
						autocomplete="on" tabindex="1"></td>
					<td rowspan=2><input type="submit" value="LOGIN" tabindex="3"></td>
				</tr>

				<tr>
					<td><input type="password" name="pw" placeholder="PW"
						autocomplete="off" tabindex="2"></td>
				</tr>
			</table>
		</form>
	</div>

	<!--   <center>로그인자리?
      <iframe src = "login_frame.jsp" name = "login" width = "150" height = "125" 
      style = "margin-right: 2%; margin-top:2%; margin-bottom:2%" scrolling="no" frameborder="0"> </iframe> <br>
        <a href="join.jsp"><input type="submit" value="join us" style="color: blue; background-color: white"></a>
     </center>  -->

	<div class="whitebox"
		style="width: 230px; left: 995px; height: 280px; background-color: yellow; top: 420px">
		<br>
		공지사항 자리 <br>공지사항이 나타날 자리에요
	</div>

</body>
</html>