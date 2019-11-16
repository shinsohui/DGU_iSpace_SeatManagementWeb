package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOut() {
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
			//seat 테이블에서 사용자 none으로 초기화.  
			String sql = "update SEAT set userID=? where seatNo=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"none");
			pstmt.setString(2,my_seatNo);
			pstmt.execute();
			DBmanager.close(pstmt);

			//seat 테이블에서 부재 0으로 초기화.
			String sql2 = "update SEAT set absence=null where seatNo=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1,my_seatNo);
			pstmt2.execute();
			DBmanager.close(pstmt2);
			
			//user 테이블에서 자리 0으로 초기화. 
			String sql3 = "update USER set my_seatNo=0 where id=?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1,id);

			pstmt3.execute();
			DBmanager.close(pstmt3);
			

			page="/view/home.jsp";
			RequestDispatcher dispatcher=request.getRequestDispatcher(page);
			dispatcher.forward(request, response);   

			DBmanager.close(conn);

		}catch (Exception e)
		{
			System.out.println("!!!!!!!!!!!insert my_seatNo error!!!!!!!!!!");
			e.printStackTrace();
		}


	}
}

