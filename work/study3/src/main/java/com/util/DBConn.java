package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	private static Connection conn = null;
	
	private DBConn() {
		
	}
	
	public static Connection getConnection() {
		//String url = "jdbc:oracle:thin:@//아이피주소:오라클포트/SID
		String url = "jdbc:oracle:thin:@//localhost:1521/XE";
		String user = "sky";
		String pwd= "java$!";
		
		if(conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return conn;
	}
	
	public static void close() {
		try {
			if( conn != null) {
				try {
					if(! conn.isClosed()) {
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
		}
		
		conn =null;
	}
}
