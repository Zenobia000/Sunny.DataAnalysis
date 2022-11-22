package com.lcpan.m06;

import java.sql.*;

public class ColumnType {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"SELECT * FROM employee";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			//the point of SQL need to import "JAR" file to java IDE then which can apply the tools  
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL); // 和SQL 扯上邊 要記得關閉 
			ResultSetMetaData rsmd = rs.getMetaData(); // get meta data instrument
			// loop print iterator
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				String typeName = rsmd.getColumnTypeName(i);
				int size = rsmd.getColumnDisplaySize(i);
				System.out.println("type name" + i + " = " + typeName
						+ "(" + size + ")");
			}
			rs.close(); // SQl instu. 
			stmt.close(); // server point 
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
