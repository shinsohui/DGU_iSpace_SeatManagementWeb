package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
      String absence="no value";

      // System.out.println(my_seatNo);

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("Status DB connection error>>> "+e);
      }
      try {

         //입실 중복 확인 
         String sql="select count(*) as `count` from SEAT where userID=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         ResultSet rs=pstmt.executeQuery();
         rs.next();
         int count=rs.getInt("count");
         DBmanager.close(pstmt);


         //좌석의 주인이 누군지 
         String sql2 = "select userID from SEAT where seatNo=?";
         PreparedStatement pstmt2 = conn.prepareStatement(sql2);
         pstmt2.setString(1, select);
         ResultSet rs2=pstmt2.executeQuery();
         rs2.next();
         String seatOwner=rs2.getString("userID");
         System.out.println(seatOwner);
         DBmanager.close(pstmt2);

         
         //신고날짜 확인 
         String sql3 = "select bandate from USER where id=?";
         PreparedStatement pstmt3 = conn.prepareStatement(sql3);
         pstmt3.setString(1, id);
         ResultSet rs3=pstmt3.executeQuery();
         rs3.next();
//         int report=rs3.getInt("count");
         String bandate=rs3.getString("bandate");
         System.out.println("bandate : "+bandate);
         DBmanager.close(pstmt3);

         //부재처리해놨는지 확인 
         String sql4 = "select absence from SEAT where userID=?";
         PreparedStatement pstmt4 = conn.prepareStatement(sql4);
         pstmt4.setString(1, seatOwner);
         ResultSet rs4=pstmt4.executeQuery();
         //         rs4.next();
         if(rs4.next()==false) {
            absence="none";
         }else {
            absence=rs4.getString("absence");
         }
         DBmanager.close(pstmt4);



         // String seating = rs.getString("userId"); //그 자리에 있는 사람 아이디 반환
         // 사용자있으면 그사람 학번 없으면 none(default)
         System.out.println("seating : "+seatOwner);
         String state="null";
         Date cal =new Date();
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         String nowdate=df.format(cal.getTime());


         if(seatOwner.equals(id)) { //선택한 자리가 내자리면
            System.out.println("if문 안에 absence>>>"+absence);
            
            //부재 처리 되도록 
            if(absence==null) {
               System.out.println("부재 누른 적 없음");
               state="내자리";               
            }else {
               
//               String temp=df.format(cal.getTime());
//               System.out.println("test: " +temp);
               SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               String nowdate2=df2.format(cal.getTime());
               Date before=df2.parse(absence);
               Date now=df2.parse(nowdate2);
//               System.out.println(now.getTime() +"-"+before.getTime()+"="+(now.getTime()-before.getTime()));

               long compare=now.getTime()-before.getTime();
//               System.out.println("compare 나누기 전 : "+compare);
               compare=compare/(60*1000);//시간 차이 분으로 구하기 위함
               //초 : /1000
               //분 : /60*1000
               //시 : /60*60*1000

               compare = Math.abs(compare);
               System.out.println("compare:"+compare);
               if(compare>5) {
                  PrintWriter out = response.getWriter();
                  out.println("<script>alert('You have been forced out of the SEAT.'); location.href='/iSpace/view/home.jsp'</script>");
                  out.flush();
                  System.out.println("30분 지났어 임마 ㅋ ");
                  
                  //강제퇴실처리시킴 
                  //seat 테이블에서 사용자 none,부재 0, 입실한 날짜 0으로 초기화.  
                  String sql11 = "update SEAT set userID=?,absence=null, date=null where seatNo=?";
                  PreparedStatement pstmt11 = conn.prepareStatement(sql11);
                  pstmt11.setString(1,"none");
                  pstmt11.setString(2,select);
                  pstmt11.execute();
                  DBmanager.close(pstmt11);

                  //user 테이블에서 자리 0으로 초기화. 
                  String sql33 = "update USER set my_seatNo=0 where id=?";
                  PreparedStatement pstmt33 = conn.prepareStatement(sql33);
                  pstmt33.setString(1,id);
                  pstmt33.execute();
                  DBmanager.close(pstmt33);
           
//                  }
                  return;

               }
               
               else {
                  state="재입실";
               }


            }
         }else if(seatOwner.equals("none")) { //default value
            // 빈자리

            //두 자리 이상 입실 불가 
            if(count>0) {
               PrintWriter out = response.getWriter();
               out.println("<script>alert('You already have a selected seat.'); location.href='/iSpace/view/home.jsp'</script>");
               out.flush();
               return;
            }
            
            //해당 학번의 report table에 신고되어있는 횟수를 센다. 
            sql="select count(*) as `count` from REPORT where id=? and date=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, nowdate);
            System.out.println("현재 시간"+nowdate);
            rs=pstmt.executeQuery();
            rs.next();
            int report=rs.getInt("count");
            DBmanager.close(pstmt);
            
            if(bandate!=null) {
//            String strnow=df.format(cal.getTime());
               Date reportedDate=df.parse(bandate);
               Date nowDate=df.parse(nowdate);
               long reportDateCompare=nowDate.getTime()-reportedDate.getTime();
               reportDateCompare=reportDateCompare/(60*1000);
               reportDateCompare=Math.abs(reportDateCompare);
               //신고횟수 3회 초과이고, 2주 전이면 입실도 못시키도록 
               //초 : /1000
               //분 : /60*1000
               //시 : /60*60*1000 2주면 336
               //일 : /24*60*60*1000 
               
               System.out.println("reportDateCompare:"+reportDateCompare);
               System.out.println("report횟수 : "+report);
               
               if(reportDateCompare<7) {
                  System.out.println("reportDateCompare<14 && report>3");
                  PrintWriter out = response.getWriter();
                  out.println("<script>alert('You can not checkIN because you have been reported more than three times..'); location.href='/iSpace/view/home.jsp'</script>");
                  out.flush();
                  return;
               }
               else if(reportDateCompare>=7) {
                  System.out.println("reportDateCompare>=14 &&report>3");
                  String sql66= "update USER set bandate=null where id=?";
                  PreparedStatement pstmt66 = conn.prepareStatement(sql66);
                  pstmt66.setString(1,id);
                  pstmt66.execute();
                  DBmanager.close(pstmt66);
                  state="빈자리";
               }
            }
            else {
               System.out.println("bandate==null");
               state="빈자리";
            }

            //      }else if(!seating.equals(id)){
         }else{
            
            String sql7 = "select absence from SEAT where userID=?";
            PreparedStatement pstmt7 = conn.prepareStatement(sql7);
            pstmt7.setString(1, seatOwner);
            ResultSet rs7=pstmt7.executeQuery();
            //         rs4.next();
            if(rs7.next()==false) {
               seatOwner="none";
            }else {
               absence=rs7.getString("absence");
            }
            DBmanager.close(pstmt7);
            // 내자리 아니고 빈자리 아님 --> 남의 자리
            if(absence==null) {
               System.out.println(absence);
               state="남의자리";
            }else {
               PrintWriter out = response.getWriter();
               out.println("<script>alert('Absence SEAT.'); location.href='/iSpace/view/home.jsp'</script>");
               out.flush();
            }
            
         }

         request.setAttribute("state", state); //데이터 실었음

         page="/view/home.jsp";
         RequestDispatcher dispatcher=request.getRequestDispatcher(page);
         dispatcher.forward(request, response);

         DBmanager.close(conn);

      }catch (Exception e)
      {
         System.out.println("!!!!status check error!!!");
         e.printStackTrace();
      }

   }


}