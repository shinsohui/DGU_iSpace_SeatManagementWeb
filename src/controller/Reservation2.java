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
@WebServlet("/Reservation2")
public class Reservation2 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public Reservation2() {
      super();
      // TODO Auto-generated constructor stub
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

      String login_id = (String) session.getAttribute("id");
      String login_name =(String)session.getAttribute("name");
//      String room = request.getParameter("room"); // 선택한 room 정보
      String time = request.getParameter("time");
      String page;
      String reservecomplete="no";
      String[] usersId= {request.getParameter("id1"),request.getParameter("id2"),
    		  request.getParameter("id3"),request.getParameter("id4"),request.getParameter("id5"),
    		  request.getParameter("id6"),request.getParameter("id7"),request.getParameter("id8"),
    		  request.getParameter("id9")};
      
   
   	  String[] usersName={request.getParameter("name1"),request.getParameter("name2"),
    		  request.getParameter("name3"),request.getParameter("name4"),request.getParameter("name5"),
    		  request.getParameter("name6"),request.getParameter("name7"),request.getParameter("name8"),
    		  request.getParameter("name9")};
   	  
   	for(int i=0;i<9;i++) {
 		  System.out.println(i+"번째 "+usersId[i]+" "+usersName[i]);
 	  }
 	  
   	
 	  PrintWriter out = response.getWriter();
// 	  String problem="";
// 	  
 	  for(int i=0;i<5;i++) {
 		  if(usersId[i].equals("")||usersName[i].equals("")) {
 			
          out.println("<script>alert('At least 6 people available to check in.'); location.href='/iSpace/view/home.jsp'; </script>");
          return;
 			
 		  }
 	  }
// 	  for(int i=6;i<10;i++) {
// 		  if(((usersName[i].equals("")==false&&usersId[i].equals(""))||(usersId[i].equals("")==false&&usersName[i].equals("")))) {
// 			  out.println("<script>alert('There's empty field.'); location.href='/iSpace/view/home.jsp'; </script>");
// 			  return;
// 			 
// 		  }
// 	  }
 	  
    String users = "";
    for(int i=0;i<9;i++) {
  	  users+=usersId[i]+" "+usersName[i]+"\n";
    }
    
        
    if(time==null) {
  	  out.println("<script>alert('select TIME'); history.back(); </script>");
    }
    int Time = (Integer.parseInt(time) - 9);
    time = Integer.toString(Time);

   	  
   
      Connection conn = null;
      

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("Reservation2 DB connection error>>> " + e);
      }
      try {
    	  
    	  
         // 시설 DB 만들고 쿼리 바꾸기
         System.out.println("login id : " + login_id);
         System.out.println("login name : " + login_name);
         System.out.println("time : " + time);
         System.out.println("users : " + users);

         
           String sql = "update ROOM2 set id=?,name=?,users=?,date=? where time=?";
           
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
           
          
          
           System.out.println("reservation2 check : ROOM2");
           
           reservecomplete = "compelete";
           
           request.setAttribute("reservecomplete", reservecomplete);
      //     request.setAttribute("problem", problem);
           
           page = "/view/home.jsp"; 
           RequestDispatcher dispatcher = request.getRequestDispatcher(page); 
           dispatcher.forward(request, response);
           
           DBmanager.close(conn);
          
      } catch (Exception e) {
         System.out.println("!!!!reservation2 check error!!!");
         e.printStackTrace();
      }

   }

}