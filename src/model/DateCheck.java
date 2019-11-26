package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import controller.DBmanager;

public class DateCheck {
	private static DateCheck instance;
	private DateCheck(){}

	public static DateCheck getInstance() {
		if(instance==null) instance=new DateCheck();
		return instance;
	}

	public void dateCheck() {
		Connection conn=null;

		try {
			conn=DBmanager.getConnection();
		}catch(Exception e) {
			System.out.println("DateCheck DB connection error>>>"+e);
		}
		try {

			//좌석 초기화 
			String sql="select date from SEAT";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();

			for(int i=1;i<78;i++) {
				System.out.print(i+" ");
				while(rs.next()) {
					if(rs.getString("date")!=null) {
						String temp=rs.getString("date");
						Date date=new Date();
						SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
						String currentTime=df.format(date)+" 00:00:00.0";
						System.out.println("temp:"+temp);
						System.out.println("current:"+currentTime);
						if(temp.equals(currentTime)==false) {
							String sql2="select seatNo, userID  from SEAT where date=?";
							PreparedStatement pstmt2=conn.prepareStatement(sql2);
							pstmt2.setString(1, temp);
							ResultSet rstemp=pstmt2.executeQuery();
							rstemp.next();
							int seatNo=rstemp.getInt("seatNo");
							String id=rstemp.getString("userID");
							DBmanager.close(pstmt2);


							sql="update USER set my_seatNo=0 where id=?";
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1, id);
							pstmt.execute();

							sql="update SEAT set userID=?, absence=null, date=null where seatNo=?";
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1, "none");
							pstmt.setInt(2, seatNo);
							pstmt.execute();



						}
					}
				}
			}

			//세미나룸1 초기화 
			sql="select date from ROOM1";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("date")!=null) {
					String temp=rs.getString("date");
					Date date=new Date();
					SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					String currentTime=df.format(date)+" 00:00:00.0";
					System.out.println("temp:"+temp);
					System.out.println("current:"+currentTime);
					if(temp.equals(currentTime)==false) {
						sql="update ROOM1 set id=?, name=null, users=null, date=null";
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, "none");
						pstmt.execute();



					}
				}
			}
			
			//세미나룸1 초기화 
			sql="select date from ROOM2";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("date")!=null) {
					String temp=rs.getString("date");
					Date date=new Date();
					SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					String currentTime=df.format(date)+" 00:00:00.0";
					System.out.println("temp:"+temp);
					System.out.println("current:"+currentTime);
					if(temp.equals(currentTime)==false) {
						sql="update ROOM2 set id=?, name=null, users=null, date=null";
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, "none");
						pstmt.execute();



					}
				}
			}
			
		}catch (Exception e) {
			System.out.println("SEAT DATE CHECK ERROR");
			e.printStackTrace();
		}
	}
}
