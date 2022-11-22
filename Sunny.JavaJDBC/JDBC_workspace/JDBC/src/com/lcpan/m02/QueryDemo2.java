package com.lcpan.m02;

import java.sql.*;

public class QueryDemo2 {
	private static final String JDBC_DRIVER = 
			"com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = // <Protocol>:<SubProtocal>:<Subname>
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"SELECT ename, salary FROM employee";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER); //註冊
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD); //連線
			Statement stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				System.out.print("name = " + rs.getString("ename"));
				System.out.println(", salary = " + rs.getInt("salary"));
			}
			rs.close();
			stmt.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
