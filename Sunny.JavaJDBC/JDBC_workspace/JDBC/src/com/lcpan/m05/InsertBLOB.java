package com.lcpan.m05;

import java.sql.*;
import java.io.*;

public class InsertBLOB {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"INSERT INTO blobtest VALUES(?,?)"; // SQl 指令
	
	public static void main(String[] args) {
		Connection conn = null; // built connect
		String inFile = "res/Tomcat.gif"; // define doc
		String name = "sunny";
		
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);			
			
			FileInputStream fis = new FileInputStream(inFile); // instance
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name); // 根據SQL指令給參數
			pstmt.setBinaryStream(2, fis);// 根據SQL指令給參數
			int count = pstmt.executeUpdate();
			
			if (count > 0)
				System.out.println("Insert blob is successful!");	

			pstmt.close();
		} catch (Exception e) {
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
