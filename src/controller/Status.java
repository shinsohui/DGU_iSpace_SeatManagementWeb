package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Status
 */
@WebServlet("/Status")
public class Status extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public Status() {
      super();
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      HttpSession session = request.getSession(); //세션추가용

      String select=request.getParameter("button"); //좌석버튼정보
      String id=(String)session.getAttribute("id"); //현재 로그인 아이디 얻어옴

      Connection conn = null;
      String page;

      // System.out.println(my_seatNo);

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
        System.out.println("Status DB connection error>>> "+e);
      }
      try {
         Statement stmt = conn.createStatement();
         String sql = "select userId from SEAT where seatNo="+select;
         ResultSet rs = stmt.executeQuery(sql);
         String seating="newwwwww";
         rs.next();
         seating = rs.getString("userId"); //그 자리에 있는 사람 아이디 반환


         // String seating = rs.getString("userId"); //그 자리에 있는 사람 아이디 반환
         // 사용자있으면 그사람 학번 없으면 none(default)
         System.out.println("seating : "+seating);
         //      

         String state="0";


         if(seating.equals(id)) { //선택한 자리가 내자리면
            state="내자리";
         }else if(seating.equals("none")) { //default value
            // 빈자리
            state="빈자리";
            //      }else if(!seating.equals(id)){
         }else{
            // 내자리 아니고 빈자리 아님 --> 남의 자리
            state="남의자리";
         }


         request.setAttribute("state", state); //데이터 실었음

         page="/view/home.jsp";
         RequestDispatcher dispatcher=request.getRequestDispatcher(page);
         dispatcher.forward(request, response);   

         DBmanager.close(stmt);
         DBmanager.close(conn);

      }catch (Exception e)
      {
         System.out.println("!!!!status check error!!!");
         e.printStackTrace();
      }

   }


}