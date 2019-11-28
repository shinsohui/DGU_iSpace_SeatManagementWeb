package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import controller.DBmanager;

public class suggestDAO {
	
/*	   private static noticeDAO instance;
	    private noticeDAO(){}
	    
	    public static ColorDAO getInstance(){
	        if(instance == null ) instance = new noticeDAO();
	        return instance;
	    }*/
	

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public suggestDAO() {
		
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("suggest DB connection error>>> "+e);
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
		String SQL = "SELECT suggestId FROM SUGGEST ORDER BY suggestId DESC";
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
	public int write(String suggestTitle, String userId, String suggestContent) {
		String SQL = "INSERT INTO SUGGEST VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, suggestTitle); // 첫번째거는 아이디
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, suggestContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류

	}

	public ArrayList<suggest> getList(int pageNumber) {
		String SQL = "SELECT * FROM SUGGEST WHERE suggestId < ? AND suggestAvailable = 1 ORDER BY suggestId DESC LIMIT 10";
		ArrayList<suggest> list = new ArrayList<suggest>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 결과 있다.
				suggest suggest = new suggest(); // 마지막 숫자에 더하기 1하기
				suggest.setSuggestId(rs.getInt(1));
				suggest.setSuggestTitle(rs.getString(2));
				suggest.setUserId(rs.getString(3));
				suggest.setSuggestDate(rs.getString(4));
				suggest.setSuggestContent(rs.getString(5));
				suggest.setSuggestAvailable(rs.getInt(6));
				list.add(suggest);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // DB 오류

	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM SUGGEST WHERE suggestId < ? AND suggestAvailable = 1";
		
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

	public suggest getSuggest(int suggestId) {
		String SQL = "SELECT * FROM SUGGEST WHERE suggestId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, suggestId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				suggest suggest = new suggest();
				suggest.setSuggestId(rs.getInt(1));
				suggest.setSuggestTitle(rs.getString(2));
				suggest.setUserId(rs.getString(3));
				suggest.setSuggestDate(rs.getString(4));
				suggest.setSuggestContent(rs.getString(5));
				suggest.setSuggestAvailable(rs.getInt(6));
				return suggest;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//수정 함수
	public int update(int suggestId, String suggestTitle, String suggestContent) {
		String SQL = "UPDATE SUGGEST SET suggestTitle = ?, suggestContent = ? WHERE suggestId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, suggestTitle);
			pstmt.setString(2, suggestContent);
			pstmt.setInt(3, suggestId);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}

	public int delete(int suggestId) {

		String SQL = "UPDATE SUGGEST SET suggestAvailable = 0 WHERE suggestId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, suggestId);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}
	
	
	public suggest getWriter(int suggestId) {
		String SQL = "SELECT userId FROM SUGGEST WHERE suggestId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, suggestId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
