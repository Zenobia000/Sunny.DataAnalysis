package com.lcpan.m02;

import java.sql.*;

public class AutoCloseableDemo {
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
		try (Connection conn = DriverManager.getConnection(url, "sa", "passw0rd");) {		
			String sql = "SELECT ename, salary FROM employee";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.print("name = " + rs.getString("ename"));
				System.out.println(", salary = " + rs.getInt("salary"));
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
