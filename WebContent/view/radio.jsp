<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="model.PageManage"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="colorBean" class="model.ColorBean" />
<jsp:setProperty name="colorBean" property="*" />
<%
   PageManage dao = PageManage.getInstance();
dao.room1Color(colorBean);
   ArrayList<String> room1 = (ArrayList<String>) colorBean.getRoom1Color();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
<%@include file ="/view/CSS/radio.css"%> 
</style>
<title>Insert title here</title>
</head>
<body>
   <h1>Custom Radio Buttons</h1>
<!--    <label class="container">One   <input type="radio" checked="checked" name="time">
 <input type="radio" name="time"> <span class="checkmark"></span>
   </label>
   <label class="container">Two <input type="radio" name="time">
      <span class="checkmark"></span>
   </label>
   <label class="container">Three <input type="radio" name="time">
      <span class="checkmark"></span>
   </label>
   <label class="container">Four <input type="radio" name="time">
      <span class="checkmark"></span>
   </label>
   <br> -->
   <label class="container" >9시 <input type="radio" name="time" >
      <span class="checkmark" id="t0"></span>
   </label>
   <label class="container">10시<input type="radio" name="time" >
      <span class="checkmark" id="t1"></span>
   </label>
   <label class="container">11시<input type="radio" name="time" >
      <span class="checkmark" id="t2"></span>
   </label>
   <label class="container">12시<input type="radio" name="time"  >
      <span class="checkmark" id="t3"></span>
   </label>
   <label class="container">1시<input type="radio" name="time" >
      <span class="checkmark" id="t4"></span>
   </label>
   <label class="container">2시<input type="radio" name="time" >
      <span class="checkmark" id="t5"></span>
   </label>
   <label class="container">3시<input type="radio" name="time"  >
      <span class="checkmark" id="t6"></span>
   </label>
   <label class="container">4시<input type="radio" name="time" >
      <span class="checkmark" id="t7"></span>
   </label>
   <label class="container">5시<input type="radio" name="time"  >
      <span class="checkmark" id="t8"></span>
   </label>
   <label class="container">6시<input type="radio" name="time"  >
      <span class="checkmark" id="t9"></span>
   </label>
   <%
            int temp=0;
            for(int i=0;i<10;i++){
               if(room1.get(i)=="gray"){
         %>
         <script>
            var btn = document.getElementById('t<%=i%>');
            btn.style.background = 'gray';
            btn.disabled = 'true';
            
         </script>
         
         <%
            System.out.println("if 문 i="+i+" temp="+temp+"색 : "+room1.get(i));
               }else{
                  temp++;
               }
            }
         %>

</body>
</html>