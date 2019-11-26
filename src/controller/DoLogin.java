package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoLogin() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String page = null;

		//checkLogin login=new checkLogin();
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");

		HttpSession session = request.getSession();


		String pass;

		int report;

		Connection conn = null;
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println("DB connection error on DoLogin"+e1);
		}

		try {
			String sql = "select * from USER where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			pass = rs.getString("pw");

			if(pass.equals(pw)) {

				//
				String name=rs.getString("name");
//				String count=Integer.toString(rs.getInt("count"));
				String seatNo="";
				if(rs.getInt("my_seatNo")==0) {
					seatNo="선택된 좌석이 없습니다.";

				}else {
					seatNo=Integer.toString(rs.getInt("my_seatNo"));
				}


				session.setAttribute("id",id);
				//            session.setAttribute("pw",pw); //이거 필요한거 맞아 ㄱ-????????
				session.setAttribute("name",name);
				session.setAttribute("seatNo", seatNo);
//				session.setAttribute("report", count);

				//

				//            response.setContentType("text/html");  
				request.setAttribute("NAME", rs.getString("name"));
				page="/iSpace/view/home.jsp";

				response.sendRedirect(page);

				//            
				//            
				//            RequestDispatcher dispatcher=request.getRequestDispatcher(page);
				//            dispatcher.forward(request, response);   
			}
			else {
				System.out.println("pw error");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('입력하신 아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/iSpace/view/mainUI.jsp'</script>");
				out.flush();
			}
			DBmanager.close(rs);
			DBmanager.close(pstmt);
			DBmanager.close(conn);
		}catch(SQLException e) {
			System.out.println("only id error || id&& pw error");
			//page="/view/mainUI.jsp";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/iSpace/view/mainUI.jsp'</script>");
			out.flush();
		}

	}

}