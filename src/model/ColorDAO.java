package model;

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

   public void seatColor(ColorBean bean) {
	   
//	   String sql="";
//	   PreparedStatement pstmt;
//	   ResultSet rs;
      Connection conn = null;

      try {
         conn = DBmanager.getConnection();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         System.out.println("ColorDAO DB connection error>>> "+e);
      }
      try {
    	  
//    	  String sql="select date from SEAT";
//    	  PreparedStatement pstmt=conn.prepareStatement(sql);
//    	  ResultSet rs=pstmt.executeQuery();
//    	  int end=0;
//    	  while(rs.next()&&end==0) {
//    		  String temp=rs.getString("date");
//    		  System.out.println(temp);
//    		  while(temp!=null&&end==0) {
//    			  
//    			  
//    			  System.out.println(temp);
//    			  if(temp!=null) {
////    		  String temp=rs.getString("date");
//    				  Date date=new Date();
//    				  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
//    				  String currentTime=df.format(date);
//    				  if(temp.equals(currentTime)==false) {
//    					  sql="update SEAT set userID=?, absence=null, date=null";
//    					  pstmt=conn.prepareStatement(sql);
//    					  pstmt.setString(1, "none");
//    					  rs=pstmt.executeQuery();
//    					  
//    				  }
//    				  end=1;
//    			  }
//    		  
//    	  }
//    	}

          String sql = "select userID,absence from SEAT";
           PreparedStatement pstmt = conn.prepareStatement(sql);
          ResultSet rs=pstmt.executeQuery();

           
           
           
         ArrayList<String> color = new ArrayList<String>();

         while (rs.next()) {
            if(rs.getString("userID").equals("none")) { 
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
   
   public void room1Color(ColorBean bean) { //세미나실1 이용시간 색
	   
//	   String sql="";
//	   PreparedStatement pstmt;
//	   ResultSet rs;
      Connection conn = null;

         try {
            conn = DBmanager.getConnection();
         } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("ColorDAO DB connection error>>> "+e);
         }
         try {
             String sql = "select time,id from ROOM1";
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs=pstmt.executeQuery();

            ArrayList<String> color = new ArrayList<String>();

            while (rs.next()) {
               if(rs.getString("id").equals("none")) { 
                  System.out.println("예약없음");
                  color.add("skyblue");
               }else {
                  System.out.println("예약있음");
                  color.add("gray");
               }
            }
            
              for(int i=0;i<color.size();i++) { 
                 System.out.println("ROOM1 시간"+(i+1)+" : "+color.get(i));
              }
             
            
             bean.setRoom1Color(color);

            DBmanager.close(pstmt);
            DBmanager.close(conn);

         }catch (Exception e)
         {
            System.out.println("SEAT COLOR CHECK ERROR");
            e.printStackTrace();
         }
      } 
   public void room2Color(ColorBean bean) { //세미나실2 이용시간 색
//	   String sql="";
//	   PreparedStatement pstmt;
//	   ResultSet rs;
      Connection conn = null;

         try {
            conn = DBmanager.getConnection();
         } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("ColorDAO DB connection error>>> "+e);
         }
         try {
             String sql = "select time,id from ROOM2";
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs=pstmt.executeQuery();

            ArrayList<String> color = new ArrayList<String>();

            while (rs.next()) {
               if(rs.getString("id").equals("none")) { 
                  System.out.println("예약없음");
                  color.add("skyblue");
               }else {
                  System.out.println("예약있음");
                  color.add("gray");
               }
            }
            

            for(int i=0;i<color.size();i++) { 
                 System.out.println("ROOM2 시간"+(i+1)+" : "+color.get(i));
              }

            
         
           String color0=color.get(0);
           
           
           if(color0.equals("skyblue")) { 
              System.out.println("0번색은 파랑이야ㅑㅑ"); 
           }
           else {
           System.out.println("0번색은 회색이야"); }
          
             bean.setRoom1Color(color);

            DBmanager.close(pstmt);
            DBmanager.close(conn);

         }catch (Exception e)
         {
            System.out.println("SEAT COLOR CHECK ERROR");
            e.printStackTrace();
         }
      } 
   
   
}