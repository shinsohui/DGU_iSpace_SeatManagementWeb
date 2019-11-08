
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>클릭하면 뜨는 팝업</title>



<style type="text/css">
a, a:hover, a:visited {
	color: #fff;
	text-decoration: none;
}

#pop {
	padding: 3px;
	width: 200px;
	height: 35px;
	background: #ccccff;
	color: #ff3300;
	position: absolute;
	top: 10px;
	left: 500px;
	text-align: center;
	border: 1px solid #000;
}

#pop_bt {
	width: 50px;
	margin: auto;
	margin-top: 300px;
	cursor: pointer;
	font-weight: bold;
	text-align: center;
	padding: 5px;
}

/* #close {
	width: 50px;
	margin: auto;
	cursor: pointer;
	font-weight: bold;
} */
</style>



<script src="http://code.jquery.com/jquery-latest.js"></script>



<script type="text/javascript">
	$(document).ready(function() {
		$('#pop_bt').click(function() {
			$('#pop').show();
		});

		$('#close').click(function() {
			$('#pop').hide();
		});
	});
</script>

</head>

<body>
	<div id="pop_bt">
		<input type="button" value="팝업띄우기">
	</div>

	<div id="pop" style="display: none;">
		입실하시겠습니까?
		<form action="iSpace/Insert" method="GET">
		<input type="submit" value="확인"> 
		<input type="button" value="close">
		</form>
		<!-- <div id="close"> -->
		
		<!-- </div> -->
	</div>



</body>
</html>