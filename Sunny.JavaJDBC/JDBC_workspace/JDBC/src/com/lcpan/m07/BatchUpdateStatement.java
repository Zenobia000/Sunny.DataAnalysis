package com.lcpan.m07;

import java.sql.*;

public class BatchUpdateStatement {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "sa";
	private static final String PASSWORD = "passw0rd";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			Statement stmt = conn.createStatement();
			stmt.addBatch("UPDATE employee SET salary = 62000 WHERE empno = 1001");
			stmt.addBatch("UPDATE employee SET salary = 36000 WHERE empno = 1002");
			stmt.addBatch("UPDATE employee SET salary = 80000 WHERE empno = 1003");
			stmt.executeBatch();

			stmt.close();
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
