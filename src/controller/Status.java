package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
		String init="null";

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
			DBmanager.close(pstmt2);

			//신고횟수 확인 
			String sql3 = "select count from USER where id=?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, id);
			ResultSet rs3=pstmt3.executeQuery();
			rs3.next();
			int report=rs3.getInt("count");
			DBmanager.close(pstmt3);

			//			//부재처리해놨는지 확인 
			String sql4 = "select absence from SEAT where userID=?";
			PreparedStatement pstmt4 = conn.prepareStatement(sql4);
			pstmt4.setString(1, id);
			ResultSet rs4=pstmt4.executeQuery();
			//			rs4.next();
			if(rs4.next()==false) {
				seatOwner="none";
			}else {
				absence=rs4.getString("absence");
			}
			DBmanager.close(pstmt4);



			// String seating = rs.getString("userId"); //그 자리에 있는 사람 아이디 반환
			// 사용자있으면 그사람 학번 없으면 none(default)
			System.out.println("seating : "+seatOwner);
			String state="null";



			if(seatOwner.equals(id)) { //선택한 자리가 내자리면
				System.out.println("if문 안에 absence>>>"+absence);
				if(absence==null) {
					System.out.println("state에 들어가는거야 ");
					state="내자리";					
				}else {

						state="재입실";
				}
			}else if(seatOwner.equals("none")) { //default value
				// 빈자리

				if(count>0) {
					PrintWriter out = response.getWriter();
					out.println("<script>alert('You already have a selected seat.'); location.href='/iSpace/view/home.jsp'</script>");
					out.flush();
					return;
				}

				state="빈자리";

				if(report>3) {
					PrintWriter out = response.getWriter();
					out.println("<script>alert('You can not checkIN because you have been reported more than three times..'); location.href='/iSpace/view/home.jsp'</script>");
					out.flush();
					return;
				}
				//      }else if(!seating.equals(id)){
			}else{
				// 내자리 아니고 빈자리 아님 --> 남의 자리
				state="남의자리";
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