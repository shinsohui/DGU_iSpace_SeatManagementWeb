package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controller.DBmanager;

public class commentDAO {
	 private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;

	   public commentDAO() {
	      
	      try {
	         conn = DBmanager.getConnection();
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         System.out.println("comment DB connection error>>> "+e);
	      }
	   }
	   
	   public ArrayList<comment> getList(String idx) {
		      String SQL = "SELECT * FROM COMMENT WHERE idx =?";
		      ArrayList<comment> list = new ArrayList<comment>();
		      try {

		         PreparedStatement pstmt = conn.prepareStatement(SQL);
		         pstmt.setString(1, idx);
		         rs = pstmt.executeQuery();
		         while (rs.next()) { // 결과 있다.
		            comment comment = new comment(); // 마지막 숫자에 더하기 1하기
		           
		            comment.setIdx(rs.getString("idx"));
		            comment.setWriter(rs.getString("writer"));
		            comment.setDate(rs.getString("date"));
		            comment.setContent(rs.getString("content"));
		            
		            list.add(comment);
		         }

		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return list; // DB 오류

		   }
	   
	   public int update(String idx, int cnum, String content) {
			String SQL = "UPDATE COMMENT SET content=? WHERE cnum=? and idx=?";

			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, content);
				pstmt.setInt(2, cnum);
				pstmt.setString(3, idx);
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return 2; // 데이터베이스 오류
		}  
	   
	   
	public int delete(int cnum, String idx) {

		String SQL = "delete from COMMENT WHERE cnum=? and idx=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cnum);
			pstmt.setString(2, idx);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; // 데이터베이스 오류
	}
	   
	   
}
