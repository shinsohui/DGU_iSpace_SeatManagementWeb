package controller;

import java.io.IOException;
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
		String sql="";
		PreparedStatement pstmt;
		ResultSet rs;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		
		
		String page;
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("DB connection error on Report"+e);
		}
		try {
			//신고된 좌석 번호의 주인을 찾는다. 
			sql = "select id from USER where my_seatNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, select);
			rs=pstmt.executeQuery();
			rs.next();
			String seatOwner=rs.getString("id");  
			DBmanager.close(pstmt);
			

			//신고 테이블에 신고된 학번과 이유 및 해당 날짜 저장 
			sql = "insert into REPORT(id, reason, date) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			Date date=new Date();
			String currentDate = df.format(date);
			pstmt.setString(1,seatOwner);
			pstmt.setString(2,reason);
			pstmt.setString(3,currentDate);
			pstmt.execute();
			DBmanager.close(pstmt);
			
			//해당 학번의 report table에 신고되어있는 횟수를 센다. 
			sql="select count(id) as `count` from REPORT where id=? and date=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seatOwner);
			pstmt.setString(2, currentDate);
			rs=pstmt.executeQuery();
			rs.next();
			int count=rs.getInt("count");
			DBmanager.close(pstmt);
			
			//4회째 신고일경우, 강제퇴실 
			if(count>3) {
				//해당 좌석의 사용자 정보 초기화.
				sql = "update SEAT set userID=? where seatNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"none");
				pstmt.setString(2,select);
				pstmt.execute();
				DBmanager.close(pstmt);

				//user 테이블에서 자리 0으로 초기화. 4번째 신고 날짜 사용자 정보에 저장. 
				sql = "update USER set my_seatNo=0, bandate=? where id=?";
				pstmt = conn.prepareStatement(sql);
				Date ban=new Date();
				String bandate=df.format(ban);
				pstmt.setString(1,bandate);
				pstmt.setString(2,seatOwner);
				pstmt.execute();
				DBmanager.close(pstmt);
			}
			
//			//신고된 사용자의 신고횟수를 1증가시키고 신고될 때의 시간 입력 
//			String sql3 = "update USER set count=count+1, bandate=? where id=?";
//			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
//			Date dt = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String currentTime = sdf.format(dt);
//			pstmt3.setString(1, currentTime);
//			pstmt3.setString(2,seatOwner);
//			pstmt3.execute();
//			DBmanager.close(pstmt3);
//
//			
//			//지금은 신고당하면 바로 강제퇴실시킴 
//			//seat 테이블에서 사용자 none으로 초기화.  
//			String sql11 = "update SEAT set userID=? where seatNo=?";
//			PreparedStatement pstmt11 = conn.prepareStatement(sql11);
//			pstmt11.setString(1,"none");
//			pstmt11.setString(2,select);
//			pstmt11.execute();
//			DBmanager.close(pstmt11);
//			
//			//user 테이블에서 자리 0으로 초기화. 
//			String sql33 = "update USER set my_seatNo=0 where id=?";
//			PreparedStatement pstmt33 = conn.prepareStatement(sql33);
//			pstmt33.setString(1,seatOwner);
//			pstmt33.execute();
//			DBmanager.close(pstmt33);
			
			


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
