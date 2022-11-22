package com.lcpan.m05;

import java.sql.*;
import java.io.*;

public class InsertBLOB {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "sa";
	private static final String PASSWORD = "passw0rd";
	
	private static final String SQL =
			"INSERT INTO blobtest VALUES(?,?)";
	
	public static void main(String[] args) {
		Connection conn = null;
		String inFile = "res/Tomcat.gif";
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);			
			
			FileInputStream fis = new FileInputStream(inFile);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, inFile);
			pstmt.setBinaryStream(2, fis);
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
