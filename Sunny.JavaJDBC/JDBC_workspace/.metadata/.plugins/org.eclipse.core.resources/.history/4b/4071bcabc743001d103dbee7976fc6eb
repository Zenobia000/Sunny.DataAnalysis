package com.lcpan.m05;

import java.sql.*;
import java.io.*;

public class GetBLOB {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String SQL =
			"SELECT photo FROM blobtest WHERE name = ?";
	
	public static void main(String[] args) {
		Connection conn = null;
		String inFile = "res/Tomcat.gif";
		String outFile = "res/test.gif";
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
	
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, inFile);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				FileOutputStream fos = new FileOutputStream(outFile);
				Blob b = rs.getBlob("photo");
				byte[] data = b.getBytes(1, (int)b.length());
				fos.write(data);
				fos.close();
				System.out.println("File output is successful!");
			} 
			rs.close();
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
