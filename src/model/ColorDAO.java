package model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import model.ColorBean;
import controller.DBmanager;

public class ColorDAO {
	//SeatColor
	private static ColorDAO instance;
	private ColorDAO(){}

	public static ColorDAO getInstance(){
		if(instance == null ) instance = new ColorDAO();
		return instance;
	}

	public void joinMember(ColorBean bean) {
		Connection conn = null;
		String sql="";
		PreparedStatement pstmt;
		ResultSet rs;
		
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Status DB connection error>>> "+e);
		}
		try {
//
//			//부재처리해놨는지 확인 
//			sql = "select * from SEAT";
//			pstmt = conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			String absence=rs.getString("absence");
//			String seatNo="";
//			String userID="";
//
//			while(rs.next()) {
//				if(absence==null) {
//					System.out.println("할짓없어 ");
//				}else { //부재처리된 좌석의 경우 
//					absence=rs.getString("absence");
//					seatNo=rs.getString("seatNo");
//					userID=rs.getString("userID");
//					//				String temp=df.format(cal.getTime());
//					//				System.out.println("test: " +temp);
//					SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					String nowdate2=df2.format(cal.getTime());
//					Date before=df2.parse(absence);
//					Date now=df2.parse(nowdate2);
//					//				System.out.println(now.getTime() +"-"+before.getTime()+"="+(now.getTime()-before.getTime()));
//
//					long compare=now.getTime()-before.getTime();
//					//				System.out.println("compare 나누기 전 : "+compare);
//					compare=compare/(60*1000);//시간 차이 분으로 구하기 위함
//					//초 : /1000
//					//분 : /60*1000
//					//시 : /60*60*1000
//
//					compare = Math.abs(compare);
//					System.out.println("compare:"+compare);
//					if(compare>1) {
//						//					PrintWriter out = response.getWriter();
//						//					out.println("<script>alert('You have been forced out of the SEAT.'); location.href='/iSpace/view/home.jsp'</script>");
//						//					out.flush();
//						//					System.out.println("30분 지났어 임마 ㅋ ");
//
//						//강제퇴실처리시킴 
//						//seat 테이블에서 사용자 none,부재 0으로 초기화.  
//						sql = "update SEAT set userID=?,absence=null where seatNo=?";
//						pstmt = conn.prepareStatement(sql);
//						pstmt.setString(1,"none");
//						pstmt.setString(2,seatNo);
//						pstmt.execute();
//						DBmanager.close(pstmt);
//
//						//user 테이블에서 자리 0으로 초기화. 
//						sql = "update USER set my_seatNo=0 where id=?";
//						pstmt = conn.prepareStatement(sql);
//						pstmt.setString(1,userID);
//						pstmt.execute();
//						DBmanager.close(pstmt);
//
//					}
//				}
//			}
//			DBmanager.close(pstmt);
//
//




			sql = "select userId,absence from SEAT";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			ArrayList<String> color = new ArrayList<String>();

			while (rs.next()) {
				if(rs.getString("userId").equals("none")) { 
					//              System.out.println("퇴실상태");
					color.add("skyblue");
				}else {
					String absence = rs.getString("absence");
					if (rs.wasNull()) {
						absence = "no"; //null이면 부재가 아닌 상태
					}
					if(absence.equals("no")) { 
						//                 System.out.println("입실상태");
						color.add("gray");
					}else {
						//                 System.out.println("부재상태");
						color.add("yellowgreen");
						//  color.add("#b0cf5a");         
					}
				}

			}
			/*
			 * for(int i=0;i<color.size();i++) { System.out.println(i+"좌석 : "+color.get(i));
			 * }
			 */

			bean.setColorList(color);

			DBmanager.close(pstmt);
			DBmanager.close(conn);

		}catch (Exception e)
		{
			System.out.println("SEAT COLOR CHECK ERROR");
			e.printStackTrace();
		}
	} 
}