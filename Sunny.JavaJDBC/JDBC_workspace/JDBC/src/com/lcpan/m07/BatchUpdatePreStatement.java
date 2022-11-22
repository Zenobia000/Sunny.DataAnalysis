package com.lcpan.m07;

import java.sql.*;

public class BatchUpdatePreStatement {
	private static final String DB_URL = 
			"jdbc:mysql://localhost:3306/jdbc?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Passw0rd!";
	
	private static final String QUERY =
			"SELECT empno, salary FROM employee";
	private static final String UPDATE =
			"UPDATE employee SET salary = ? WHERE empno = ?";
	
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			
			Statement stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery(QUERY);
//			while (rs.next()) {
//				System.out.print("empno = " + rs.getString("empno"));
//				System.out.println(", salary = " + rs.getInt("salary"));
//			}
			
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			while (rs.next()) { // 要注意 next pointer 的位置!!!!
				pstmt.setInt(1, rs.getInt("salary")+2000);
				pstmt.setString(2, rs.getString("empno"));
				pstmt.addBatch();
				
			}
			pstmt.executeBatch();
			
			rs = stmt.executeQuery(QUERY); // 指標要回到1
			while(rs.next()) {
				System.out.print("empno = " + rs.getString("empno"));
				System.out.println(", salary = " + rs.getInt("salary"));	
			};
			
			
//			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
//			
//			
//			
//			pstmt.setInt(1, 70000);
//			pstmt.setString(2, "1004");
//			pstmt.addBatch();
//			pstmt.setInt(1, 40000);
//			pstmt.setString(2, "1005");
//			pstmt.addBatch();
//			pstmt.setInt(1, 47000);
//			pstmt.setString(2, "1006");
//			pstmt.addBatch();
//			pstmt.executeBatch();
			
			rs.close();
			stmt.close();
			pstmt.close();
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