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
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
   private static final long serialVersionUID = 1L;
     
    public Comment() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      
      
      
      System.out.println("cnum string: "+request.getParameter("cnum"));
//      System.out.println("cnum int : "+cnum);
      
      int cnum=Integer.parseInt((String)request.getParameter("cnum"));
//      System.out.println("cnum string: "+request.getParameter("cnum"));
//      System.out.println("cnum int : "+cnum);
//      
      
      
      String idx=(String) session.getAttribute("commuId");//게시글 번호 
      String writer=(String) session.getAttribute("id");//작성자 
      String content=request.getParameter("content");//내용 
      
       Connection conn = null;
         SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");

        String page;

         // System.out.println(my_seatNo);

         try {
            conn = DBmanager.getConnection();
         } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("Comment DB connection error>>> "+e);
         }
         try {

            //입실 중복 확인 
            String sql="insert into COMMENT(cnum, idx, writer, date, content) values(?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cnum);
            pstmt.setString(2, idx);
            pstmt.setString(3, writer);
            Date date=new Date();
          String currentDate = df.format(date);
            pstmt.setString(4, currentDate);
            pstmt.setString(5, content);
            pstmt.execute();
            DBmanager.close(pstmt);
            
//         page="/view/BOARD/viewCommu.jsp?"+idx;
//         RequestDispatcher dispatcher=request.getRequestDispatcher(page);
//         dispatcher.forward(request, response);   
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='/iSpace/view/BOARD/viewCommu.jsp?commuId="+idx+"'");
            //script.println("history.back()");
            script.println("</script>");
      
         }catch (Exception e) {
            System.out.println("!!!!!!!!!!!Comment error!!!!!!!!!!");
            e.printStackTrace();
         }

      
   }

}