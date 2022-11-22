package com.lcpan.m06;

import java.sql.*;

public class ColumnType {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "sa";
	private static final String PASSWORD = "passw0rd";
	
	private static final String SQL =
			"SELECT * FROM employee";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			ResultSetMetaData rsmd = rs.getMetaData();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				String typeName = rsmd.getColumnTypeName(i);
				int size = rsmd.getColumnDisplaySize(i);
				System.out.println("type name" + i + " = " + typeName
						+ "(" + size + ")");
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
