package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Facility
 */
//seminar
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public Reservation() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession();

      // String login_id = (String) session.getAttribute("id");
      // String login_name = (String) session.getAttribute("name");

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");

      String login_id = request.getParameter("login_id");
      String login_name = request.getParameter("login_name");
      String room = request.getParameter("room"); // 선택한 room 정보
      String time = request.getParameter("time");
      String id1 = request.getParameter("id1");
      String name1 = request.getParameter("name1");
      String id2 = request.getParameter("id2");
      String name2 = request.getParameter("name2");
      String id3 = request.getParameter("id3");
      String name3 = request.getParameter("name3");
      String id4 = request.getParameter("id4");
      String name4 = request.getParameter("name4");
      String id5 = request.getParameter("id5");
      String name5 = request.getParameter("name5");
      String id6 = request.getParameter("id6");
      String name6 = request.getParameter("name6");

      String users = "";
      users = users + id1 + name1 + id2 + name2 + id3 + name3 + id4 + name4 + id5 + name5 + id6 + name6;
      int Time = (Integer.parseInt(time) - 9);
      time = Integer.toString(Time);

      String id = (String) session.getAttribute("id"); // 현재 로그인 아이디 얻어옴

      Connection conn = null;
      String page;

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("Reservation DB connection error>>> " + e);
      }
      try {
         // 시설 DB 만들고 쿼리 바꾸기
         System.out.println("login id : " + login_id);
         System.out.println("login name : " + login_name);

         System.out.println("time : " + time);
         System.out.println("id1 : " + id1);
         System.out.println("name1 : " + name1);
         System.out.println("users : " + users);

         
           String sql = "update " + room +" set id=?,name=?,users=?,date=? where time=?";
           
           PreparedStatement pstmt = conn.prepareStatement(sql); //
           pstmt.setString(1, login_id); 
           pstmt.setString(2,login_name); 
           pstmt.setString(3, users);
           
           Date date = new Date(); 
           SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
           String currentTime = df.format(date);
           pstmt.setString(4, currentTime); 
           pstmt.setString(5, time);
           
           pstmt.execute(); 
           DBmanager.close(pstmt);
           
          
          
           System.out.println("reservation check : " + room);
           
           String test = "reservation...facility";
           
           request.setAttribute("test", test);
           
           page = "/view/home.jsp"; 
           RequestDispatcher dispatcher = request.getRequestDispatcher(page); 
           dispatcher.forward(request, response);
           
           DBmanager.close(conn);
          
      } catch (Exception e) {
         System.out.println("!!!!status check error!!!");
         e.printStackTrace();
      }

   }

}