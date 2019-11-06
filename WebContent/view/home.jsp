<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home PAGE</title>
<style>
table {
   width: 100;
   border: 1px solid #444444;
   border-collapse: collapse;
}
th, td {
   border: 1px solid #444444;
   padding: 10px;
}
/* Popup Box */
/* The Modal (background) */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 8888; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
   background-color: #fefefe; /*#fefefe*/
   margin: 10vh auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 60%; /* Could be more or less, depending on screen size */
}
@media ( min-width : 1366px) { /*1366px부터는 modal-content 이걸로 쓰임*/
   .modal-content {
      background-color: #33cc33;
      margin: 10vh auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 30%; /* Could be more or less, depending on screen size */
   }
}
h2, p {
   margin: 0 0 20px;
   font-weight: 400;
   color: #666;
}
span {
   color: #666;
   display: block;
   padding: 0 0 5px;
}
/* form {
   padding: 25px;
   margin: 25px;
   /*box-shadow: 0 2px 5px #f5f5f5;*/
background
:
 
#ff3399
; /*#eee*/
}
* /
input, textarea {
   width: calc(100% - 18px);
   padding: 10px;
   margin-bottom: 0px;
   border: 1px solid #1c87c9;
   outline: none;
}
.contact-form button {
   width: 100%;
   padding: 10px;
   border: none;
   background: #ff3399; /*#1c87c9*/
   font-size: 16px;
   font-weight: 400;
   color: #fff;
}
button:hover {
   background: #2371a0;
}
/* The Close Button */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}
.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}
button.button {
   background: none;
   border-top: none;
   outline: none;
   border-right: none;
   border-left: none;
   border-bottom: #02274a 1px solid;
   padding: 0 0 3px 0;
   font-size: 16px;
   cursor: pointer;
}
button.button:hover {
   border-bottom: #a99567 1px solid;
   color: #a99567;
}
</style>
</head>
<body>

   <%
      //User user = new User();//generate user
      String userid = (String)session.getAttribute("id");
      String name=(String)session.getAttribute("name");   
   %>

   <h2>this is the page after login</h2>

   <!-- value가 보여지는 값 name이 가리키는 값에 해당 , name이 넘어갈 때 필요한 변수 이름  -->
   <form action="/iSpace/Insert" method="get">
      <table>
         <tr> <h3><%=userid%> <%=name%> 님</h3> </tr>
         <tr>
         
            <th><input type="submit" value="1" name="button" class="button" data-modal="confirm" /></th>
               
            <th><input type="submit" value="2" name="button" class="button" data-modal="confirm"></th>

            <th><input type="submit" value="3" name="button" class="button" data-modal="confirm"></th>
            
            <!-- <th><button class="button" data-modal="confirm">Contact Us</button></th> -->
            
         </tr>
      </table>
   </form>

   <p>
      <!-- <div id="confirm" class="modal">
      <div class="modal-content">
         <div class="contact-form">
            <h2>좌석을 선택하시겠습니까?</h2>
            <form action="/iSpace/Insert" method="get">
               <input type="submit" value="확인">
            </form>
            <form action="/iSpace/view/home.jsp">
               <input type="submit" value="취소">
            </form>
         </div>
      </div>
   </div> -->

      <script>
      var modalBtns = [...document.querySelectorAll(".button")];
      modalBtns.forEach(function(btn){
        btn.onclick = function() {
          var modal = btn.getAttribute('data-modal');
          document.getElementById(modal).style.display = "block";
        }
      });
      
      var closeBtns = [...document.querySelectorAll(".close")];
      closeBtns.forEach(function(btn){
        btn.onclick = function() {
          var modal = btn.closest('.modal');
          modal.style.display = "none";
        }
      });
      
      window.onclick = function(event) {
        if (event.target.className === "modal") {
          event.target.style.display = "none";
        }
      }
    </script>
</body>
</html>