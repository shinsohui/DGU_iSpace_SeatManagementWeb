package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String room=request.getParameter("room"); //선택한 room 정보
		String id=(String)session.getAttribute("id"); //현재 로그인 아이디 얻어옴 
		
		Connection conn = null;
		String page;
		
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Reservation DB connection error>>> "+e);
		}
		try {
		//시설 DB 만들고 쿼리 바꾸기

//			String sql="select count(*) as `count` from SEAT where userID=?";
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			ResultSet rs=pstmt.executeQuery();
//			rs.next();
//			int count=rs.getInt("count");
//			DBmanager.close(pstmt);

			
			
			/*
			 * String sql2 = "select userID from SEAT where seatNo=?"; PreparedStatement
			 * pstmt2 = conn.prepareStatement(sql2); pstmt2.setString(1, select); ResultSet
			 * rs2=pstmt2.executeQuery(); rs2.next(); String
			 * seatOwner=rs2.getString("userID"); DBmanager.close(pstmt2);
			 * 
			 * 
			 * String sql3 = "select count from USER where id=?"; PreparedStatement pstmt3 =
			 * conn.prepareStatement(sql3); pstmt3.setString(1, id); ResultSet
			 * rs3=pstmt3.executeQuery(); rs3.next(); int report=rs3.getInt("count");
			 * DBmanager.close(pstmt3);
			 */


			// String seating = rs.getString("userId"); //그 자리에 있는 사람 아이디 반환
			System.out.println("reservation check : "+room);
			
			String test="reservation...facility";
			
			request.setAttribute("test", test);
			
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
