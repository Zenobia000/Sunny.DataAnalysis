package com.lcpan.m06;

import java.sql.*;

public class ColumnCount {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL1 =
			"SELECT ename, salary FROM employee";
	private static final String SQL2 =
			"SELECT * FROM employee";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			// conn mapping to one SQL server
			Statement stmt = conn.createStatement(); // built conn. because it's conn. so need to end while use end
			ResultSet rs = stmt.executeQuery(SQL1);	// claim SQL instrument 
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			System.out.println("column count = " + count);
			
			// re, rsmd -> reuse
			rs = stmt.executeQuery(SQL2);// because re have been define, reuse var, is much clean
			rsmd = rs.getMetaData(); 
			count = rsmd.getColumnCount();
			System.out.println("table column count = " + count);
			
			rs.close();
			stmt.close();
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
	}
}
