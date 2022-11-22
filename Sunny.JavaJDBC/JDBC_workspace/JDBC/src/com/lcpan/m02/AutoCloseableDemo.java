package com.lcpan.m02;

import java.sql.*;

public class AutoCloseableDemo {
	public static void main(String[] args) {
		// 註冊擺第一
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 註冊
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}
		
		
		String url = "jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
		// try with resource
		
		try (Connection conn = DriverManager.getConnection(url, "root", "Passw0rd!");) {
			
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
