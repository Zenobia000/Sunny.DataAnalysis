package com.lcpan.m06;

import java.sql.*;

public class ColumnName {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"SELECT * FROM employee";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD); // built conn.
			// conn. need to close
			Statement stmt = conn.createStatement(); // server conn. 
			// execute need to close
			ResultSet rs = stmt.executeQuery(SQL); // SQL to resultset which belongs to SQL base filed, rs is SQL DB container
			ResultSetMetaData rsmd = rs.getMetaData(); // container as rsmd
			int count = rsmd.getColumnCount();
			for (int i = 1; i <= count; i++) {
				String colName = rsmd.getColumnName(i);
				System.out.println("column name" + i + " = " + colName);
			}
			rs.close();
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
