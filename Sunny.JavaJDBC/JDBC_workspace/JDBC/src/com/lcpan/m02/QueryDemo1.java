package com.lcpan.m02;

import java.sql.*;

public class QueryDemo1 {
	public static void main(String[] args) {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 註冊
			String url = "jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";// 資料庫連線資訊
			conn = DriverManager.getConnection(url, "root", "Passw0rd!");//

			String sql = "SELECT ename, salary FROM employee";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql); //資料庫會丟錯誤訊息 給java
			

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
