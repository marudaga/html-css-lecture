package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class GuestDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertGuest(GuestDTO dto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			System.out.println(dto.getName()+dto.getContent());
			sql = "INSERT INTO guest(num, name, content, reg_date)"
					+ " VALUES(guest_seq.NEXTVAL,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt !=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
	}
	
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) FROM guest";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs !=null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
		return result;
	}
	
	public List<GuestDTO> listGuest(int offset, int size){
		List<GuestDTO> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		try {
			sb.append("  SELECT num, name, content, ");
			sb.append("     TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append("  FROM guest ");
			sb.append("  ORDER BY num DESC ");
			sb.append("  OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestDTO dto = new GuestDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
		return list;
	}
	public void deleteGuest(long num) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql=" DELETE FROM guest WHERE num= ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}
}
