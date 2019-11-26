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

			String sql="select date from SEAT";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			int end=0;
			int i=0;
			rs.next();
			String temp=rs.getString("date");

			if(++i<78) {
				System.out.print(i+" ");
				while(temp!=null&&end==0) {
					System.out.println(temp);
					if(temp!=null) {
						//      		  String temp=rs.getString("date");
						Date date=new Date();
						SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
						String currentTime=df.format(date);
						if(temp.equals(currentTime)==false) {
							sql="update SEAT set userID=?, absence=null, date=null";
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1, "none");
							pstmt.execute();
							
							sql="update USER set my_seatNo=0";
							pstmt=conn.prepareStatement(sql);
							pstmt.execute();

						}
						end=1;
					}

				}
			}

		}catch (Exception e) {
			System.out.println("SEAT DATE CHECK ERROR");
			e.printStackTrace();
		}
	}
}







