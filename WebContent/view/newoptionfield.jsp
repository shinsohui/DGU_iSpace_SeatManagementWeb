<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<SCRIPT>
		function replaceElement() {

			var select = document.getElementById('mySelectMenu');

			var chosenoption = select.options[select.selectedIndex];

			var oChild = document.getElementsByTagName('input');

			var br1 = document.getElementsByTagName('br');

			var temp = br1.length; // 아래에서 자식 노드를 제거하면 배열의 요소가 하나 줄어서 br1.length(배열의 크기)가 for문 수행 중에 줄어든다. 배열의 크기를 temp에 저장하고 for문 조건식에서 사용하자.

			for (var i = 0; i < temp; i++) {

				alert("박스삭제" + i);

				myform.removeChild(oChild[0]); // myform의 자식 노드를 하나 삭제하면 oChild[0]의 값은 삭제되고 oChild[index]의 값이 oChild[index - 1]에 저장됩니다.

				alert("줄바꿈삭제" + i);

				myform.removeChild(br1[0]);

			}

			//위에서 기존 text input box를 삭제하고 아래에서 select에서 선택한 option의 value만큼 text input box를 생성해보겠습니다.

			for (var i = 0; i < chosenoption.value; i++) {

				alert("줄바꿈" + i);

				var br2 = document.createElement('br');

				myform.appendChild(br2);

				alert("박스추가" + i);

				var oNewChild = document.createElement('input');

				oNewChild.type = 'text';

				oNewChild.size = 6;

				myform.appendChild(oNewChild);

			}

		}
	</SCRIPT>

	<form id="myform">

		<select id="mySelectMenu" onchange="replaceElement()">

			<option value="1">1</option>

			<option value="2" class="even">2</option>

			<option value="3">3</option>

			<option value="4" class="even">4</option>

			<option value="5">5</option>

		</select> <br>
		<input type="text" size="10" />

	</form>
</body>
</html>