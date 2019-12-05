package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import controller.DBmanager;

public class commuDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;

   public commuDAO() {
      
      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("commu DB connection error>>> "+e);
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
      String SQL = "SELECT commuId FROM COMMU ORDER BY commuId DESC";
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
   public int write(String commuTitle, String userId, String commuContent) {
      String SQL = "INSERT INTO COMMU VALUES(?, ?, ?, ?, ?, ?)";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setString(2, commuTitle); // 첫번째거는 아이디
         pstmt.setString(3, userId);
         pstmt.setString(4, getDate());
         pstmt.setString(5, commuContent);
         pstmt.setInt(6, 1);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // DB 오류

   }

   public ArrayList<commu> getList(int pageNumber) {
      String SQL = "SELECT * FROM COMMU WHERE commuId < ? AND commuAvailable = 1 ORDER BY commuId DESC LIMIT 10";
      ArrayList<commu> list = new ArrayList<commu>();
      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
         rs = pstmt.executeQuery();
         while (rs.next()) { // 결과 있다.
            commu commu = new commu(); // 마지막 숫자에 더하기 1하기
            commu.setCommuId(rs.getInt(1));
            commu.setCommuTitle(rs.getString(2));
            commu.setUserId(rs.getString(3));
//            Date date=new Date();
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            String currentTime = sdf.format(date);
//            notice.setNoticeDate(currentTime);
            commu.setCommuDate(rs.getString(4));
            commu.setCommuContent(rs.getString(5));
            commu.setCommuAvailable(rs.getInt(6));
            list.add(commu);
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
      return list; // DB 오류

   }

   public boolean nextPage(int pageNumber) {
      String SQL = "SELECT * FROM COMMU WHERE commuId < ? AND commuAvailable = 1";
      
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

   public commu getCommu(int commuId) {
      String SQL = "SELECT * FROM COMMU WHERE commuId = ?";

      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, commuId);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            commu commu = new commu();
            commu.setCommuId(rs.getInt(1));
            commu.setCommuTitle(rs.getString(2));
            commu.setUserId(rs.getString(3));
            commu.setCommuDate(rs.getString(4));
            commu.setCommuContent(rs.getString(5));
            commu.setCommuAvailable(rs.getInt(6));
            return commu;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

//수정 함수
   public int update(int commuId, String commuTitle, String commuContent) {
      String SQL = "UPDATE COMMU SET commuTitle = ?, commuContent = ? WHERE commuId = ?";

      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, commuTitle);
         pstmt.setString(2, commuContent);
         pstmt.setInt(3, commuId);
         return pstmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return -1; // 데이터베이스 오류
   }

   public int delete(int commuId) {

      String SQL = "UPDATE COMMU SET commuAvailable = 0 WHERE commuId = ?";

      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, commuId);
         return pstmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return -1; // 데이터베이스 오류
   }
}