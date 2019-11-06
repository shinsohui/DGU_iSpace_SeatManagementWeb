package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckLogin {

	
	public static int pass(String id, String password) throws Exception {
		String pass;
		Connection conn = DBmanager.getConnection();

		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from USER where id = "+id;
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			pass = rs.getString("pw");
			DBmanager.close(rs);
			DBmanager.close(stmt);
			DBmanager.close(conn);
			if(pass.equals(password)) {
				return 1;
			}
		}catch(SQLException e) {
			System.out.println("checkLogin/pass error");
		}
		return 0;
	}
}