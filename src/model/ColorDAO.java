package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
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

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("Status DB connection error>>> "+e);
      }
      try {
         String sql = "select userId,absence from SEAT";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs=pstmt.executeQuery();

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