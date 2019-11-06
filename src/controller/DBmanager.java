package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBmanager {
//	public static void main(String[] args) throws Exception{
//		DBmanager.getConnection();
//		
//	}
	public static Connection getConnection() throws Exception{
		Connection conn=null;
		try {
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://13.124.48.223:3306/SEED";
			String username="root";
			String password="1234";
			conn=DriverManager.getConnection(url,username,password);
			Class.forName(driver);
			
		}catch(ClassNotFoundException e) {
			System.out.println("ClassNotFoundException<br/>"+e);
		}catch(Exception e) {
			System.out.println("Exception<br/>"+e);
		}
		return conn;
		
	}
	public static void close(Connection conn) {
		try {if(conn != null) {conn.close();}}
		catch(Exception e) {e.printStackTrace();}
	}
	public static void close(Statement stmt) {
		try {if(stmt != null) {stmt.close();}}
		catch(Exception e) {e.printStackTrace();}
	}
	public static void close(PreparedStatement pstmt) {
		try {if(pstmt != null) {pstmt.close();}}
		catch(Exception e) {e.printStackTrace();}
	}
	public static void close(ResultSet rs) {
		try {if(rs != null) {rs.close();}}
		catch(Exception e) {e.printStackTrace();}
	}
}