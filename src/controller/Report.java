package controller;

import java.io.IOException;
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
 * Servlet implementation class Report
 */
@WebServlet("/Report")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); //세션추가용

		String reason=request.getParameter("reason");
		String select=request.getParameter("selected"); //현재 seatNumber 얻어옴

		System.out.println("reason>>>>>>>>>>>>"+reason);
		System.out.println("selected seat>>>>>>>>>>>>"+select);
		
		
		
		Connection conn = null;
		
		String page;
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("DB connection error on Report"+e);
		}
		try {
			String sql = "select id from USER where my_seatNo=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, select);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String seatOwner=rs.getString("id");  


			DBmanager.close(pstmt);


			String sql2 = "insert into REPORT(id, reason) values(?,?)";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1,seatOwner);
			pstmt2.setString(2,reason);
			pstmt2.execute();
			DBmanager.close(pstmt2);


			page="/view/home.jsp";
			RequestDispatcher dispatcher=request.getRequestDispatcher(page);
			dispatcher.forward(request, response);   

			DBmanager.close(conn);

		}catch (Exception e) {
			System.out.println("!!!!!!!!!!!Report error!!!!!!!!!!");
			e.printStackTrace();
		}

	}



}
