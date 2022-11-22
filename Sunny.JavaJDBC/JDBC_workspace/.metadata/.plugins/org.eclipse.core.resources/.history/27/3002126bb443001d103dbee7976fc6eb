package com.lcpan.m04;

import java.sql.*;

public class UpdateStoredProcedure {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"{call upd_emp_salary(?, ?)}";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			CallableStatement cstmt = conn.prepareCall(SQL);
			cstmt.setInt(1, 60000);
			cstmt.setString(2, "1001");
			cstmt.execute();
			System.out.println("Update Stored Procedure successful!");
			cstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
}
