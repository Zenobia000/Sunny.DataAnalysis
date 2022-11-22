package com.lcpan.m03;

import java.sql.*;

// Update employee data
public class UpdateDemo {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "sa";
	private static final String PASSWORD = "passw0rd";
	
	private static final String SQL =
			"UPDATE employee SET salary=? WHERE empno=?";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {     
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 58000);
			pstmt.setInt(2, 1009);
			int count = pstmt.executeUpdate();
			System.out.println("update count = " + count);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch(SQLException e) { 
					e.printStackTrace();
				}
		}
	}// end of main()
}// end of class UpdateDemo
