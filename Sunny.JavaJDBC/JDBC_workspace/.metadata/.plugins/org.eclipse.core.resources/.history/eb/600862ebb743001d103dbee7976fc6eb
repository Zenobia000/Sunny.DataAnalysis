package com.lcpan.m04;

import java.sql.*;

public class QueryStoredProcedure {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "sa";
	private static final String PASSWORD = "passw0rd";
	
	private static final String SQL = "{call qry_emp(?,?,?)}";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			CallableStatement cstmt = conn.prepareCall(SQL);
			cstmt.setString(1, "1001");
			cstmt.registerOutParameter(2, Types.VARCHAR);
			cstmt.registerOutParameter(3, Types.INTEGER);
			cstmt.execute();
			System.out.print("name = " + cstmt.getString(2));
			System.out.println(", salary = " + cstmt.getInt(3));
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
	}// end of main()
}// end of class StoredProcedureDemo
