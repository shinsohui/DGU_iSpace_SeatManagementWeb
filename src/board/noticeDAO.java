package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import controller.DBmanager;

public class noticeDAO {
	
/*	   private static noticeDAO instance;
	    private noticeDAO(){}
	    
	    public static ColorDAO getInstance(){
	        if(instance == null ) instance = new noticeDAO();
	        return instance;
	    }*/

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public noticeDAO() {
		try {
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://13.124.48.223:3306/SEED";
			String username = "root";
			String password = "1234";
			conn = DriverManager.getConnection(url, username, password);
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() { // 서버시간
		String SQL = "SELECT NOW()";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과 있다.
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB 오류

	}

	public int getNext() {
		String SQL = "SELECT noticeId FROM NOTICE ORDER BY noticeId DESC";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과 있다.
				return rs.getInt(1) + 1; // 마지막 숫자에 더하기 1하기
			}
			return 1; // 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류

	}

	// int noticeView
	public int write(String noticeTitle, String userId, String noticeContent) {
		String SQL = "INSERT INTO NOTICE VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, noticeTitle); // 첫번째거는 아이디
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, noticeContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류

	}

	public ArrayList<notice> getList(int pageNumber) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeAvailable = 1 ORDER BY noticeId DESC LIMIT 10";
		ArrayList<notice> list = new ArrayList<notice>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 결과 있다.
				notice notice = new notice(); // 마지막 숫자에 더하기 1하기
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getInt(6));
				list.add(notice);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // DB 오류

	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeAvailable = 1";
		ArrayList<notice> list = new ArrayList<notice>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과 있다.
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // DB 오류
	}

	public notice getNotice(int noticeId) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice notice = new notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getInt(6));
				return notice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//수정 함수
	public int update(int noticeId, String noticeTitle, String noticeContent) {
		String SQL = "UPDATE NOTICE SET noticeTitle = ?, noticeContent = ?, WHERE noticeId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeContent);
			pstmt.setInt(3, noticeId);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}

	public int delete(int noticeId) {

		String SQL = "UPDATE NOITCE SET noticeAvailable = 0 WHERE noticeId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}
}
