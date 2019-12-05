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
//	   
//	   public int getNext() {
//		      String SQL = "SELECT idx FROM COMMENT";
//		      try {
//
//		         PreparedStatement pstmt = conn.prepareStatement(SQL);
//		         rs = pstmt.executeQuery();
//		         if (rs.next()) { // 결과 있다.
//		            return rs.getInt(1) + 1; // 마지막 숫자에 더하기 1하기
//		         }
//		         return 1; // 첫번째 게시물인 경우
//		      } catch (Exception e) {
//		         e.printStackTrace();
//		      }
//		      return -1; // DB 오류
//
//		   }
	   
	   public ArrayList<comment> getList(String idx) {
		      String SQL = "SELECT * FROM COMMENT WHERE idx=?";
		      ArrayList<comment> list = new ArrayList<comment>();
		      try {

		         PreparedStatement pstmt = conn.prepareStatement(SQL);
		         pstmt.setString(1,idx);
		         rs = pstmt.executeQuery();
		         while (rs.next()) { // 결과 있다.
		            comment comment = new comment(); // 마지막 숫자에 더하기 1하기
		            comment.setIdx(rs.getString(1));
		            comment.setWriter(rs.getString(2));
		            comment.setDate(rs.getString(3));
		            comment.setContent(rs.getString(4));
		            list.add(comment);
		         }

		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return list; // DB 오류

		   }
}
