package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/CheckIn")
public class CheckIn extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public CheckIn() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession(); //세션추가용
      
      String my_seatNo=request.getParameter("button");
      String id=(String)session.getAttribute("id"); //현재 로그인 아이디 얻어옴
      
      Connection conn = null;
      String page;

      System.out.println(my_seatNo);

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
    	 System.out.println("DB connection error on checkOut"+e);
      }
      try {
      String sql = "update SEAT set userID=?,date=? where seatNo=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,id);
      Date date=new Date();
      SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
      String currentTime=df.format(date);
      pstmt.setString(2, currentTime);
      pstmt.setString(3,my_seatNo);
      pstmt.execute();
      DBmanager.close(pstmt);
      
            
      String sql2="update USER set my_seatNo=? where id=?";
      PreparedStatement pstmt2 = conn.prepareStatement(sql2);
      pstmt2.setString(1,my_seatNo);
      pstmt2.setString(2,id);
      pstmt2.execute();
      DBmanager.close(pstmt2);
      
//      
//      session.setAttribute("selected", my_seatNo);
      page="/view/home.jsp";
      RequestDispatcher dispatcher=request.getRequestDispatcher(page);
      dispatcher.forward(request, response);   
      
      DBmanager.close(conn);
      
      }catch (Exception e)
       {
         System.out.println("!!!!!!!!!!!CheckIn my_seatNo error!!!!!!!!!!");
         e.printStackTrace();
       }
       

   }

}