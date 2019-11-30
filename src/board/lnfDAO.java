package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import controller.DBmanager;

public class lnfDAO {
	
/*	   private static noticeDAO instance;
	    private noticeDAO(){}
	    
	    public static ColorDAO getInstance(){
	        if(instance == null ) instance = new noticeDAO();
	        return instance;
	    }*/
	

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public lnfDAO() {
		
		try {
			conn = DBmanager.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("lnf DB connection error>>> "+e);
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
		String SQL = "SELECT lnfId FROM LNF ORDER BY lnfId DESC";
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
	public int write(String lnfTitle, String userId, String lnfContent, String lnfFile) {
		String SQL = "INSERT INTO LNF VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, lnfTitle); // 첫번째거는 아이디
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, lnfContent);
			pstmt.setInt(6, 1);
			pstmt.setString(7, lnfFile);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류

	}

	public ArrayList<lnf> getList(int pageNumber) {
		String SQL = "SELECT * FROM LNF WHERE lnfId < ? AND lnfAvailable = 1 ORDER BY lnfId DESC LIMIT 10";
		ArrayList<lnf> list = new ArrayList<lnf>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { // 결과 있다.
				lnf lnf = new lnf(); // 마지막 숫자에 더하기 1하기
				lnf.setLnfId(rs.getInt(1));
				lnf.setLnfTitle(rs.getString(2));
				lnf.setUserId(rs.getString(3));
				lnf.setLnfDate(rs.getString(4));
				lnf.setLnfContent(rs.getString(5));
				lnf.setLnfAvailable(rs.getInt(6));
				lnf.setLnfFile(rs.getString(7));
				list.add(lnf);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // DB 오류

	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM LNF WHERE lnfId < ? AND lnfAvailable = 1";
		
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

	public lnf getLnf(int lnfId) {
		String SQL = "SELECT * FROM LNF WHERE lnfId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, lnfId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lnf lnf = new lnf();
				lnf.setLnfId(rs.getInt(1));
				lnf.setLnfTitle(rs.getString(2));
				lnf.setUserId(rs.getString(3));
				lnf.setLnfDate(rs.getString(4));
				lnf.setLnfContent(rs.getString(5));
				lnf.setLnfAvailable(rs.getInt(6));
				lnf.setLnfFile(rs.getString(7));
				return lnf;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//수정 함수
	public int update(int lnfId, String lnfTitle, String lnfContent, String lnfFile) {
		String SQL = "UPDATE LNF SET lnfTitle = ?, lnfContent = ?, lnfFile=? WHERE lnfId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lnfTitle);
			pstmt.setString(2, lnfContent);
			pstmt.setString(3, lnfFile);
			pstmt.setInt(4, lnfId);
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}

	public int delete(int lnfId) {

		String SQL = "UPDATE LNF SET lnfAvailable = 0 WHERE lnfId = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, lnfId);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}
}
