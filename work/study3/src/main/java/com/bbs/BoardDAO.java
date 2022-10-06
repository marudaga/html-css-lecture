package com.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BoardDAO {
	private Connection conn = DBConn.getConnection();
	
	public void insertBoard(BoardDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			// INSERT INTO 테이블명(컬럼명, 컬렴명) VALUES (값, 값)
			sql = "INSERT INTO bbs(num, name, pwd, subject, content, ipAddr, reg_date, hitCount) "
					+ " VALUES (bbs_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, 0)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIpAddr());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
	}
	
	public int dataCount() {
		// 전체 데이터 개수
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) FROM bbs";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
		
		return result;
	}
	
	public int dataCount(String condition, String keyword) {
		// 검색일때 데이터 개수
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) cnt FROM bbs";
			if(condition.equals("all")) {
				sql += "  WHERE INSTR(subject, ?) >=1 OR INSTR(content, ?) >= 1 ";
			} else if(condition.equals("reg_date")) {
				keyword = keyword.replaceAll("(\\-|\\/|\\.)", "");
				sql += "  WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ? ";
			} else { // name, subject, content
				sql += "  WHERE INSTR(" + condition + ", ?) >= 1 ";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			if(condition.equals("all")) {
				pstmt.setString(2, keyword);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
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
		
		return result;
	}
	
	/**
	 * 게시글 리스트
	 * @param offset	건너뛸개수
	 * @param size		가져올개수
	 * @return			게시글리스트
	 */
	public List<BoardDTO> listBoard(int offset, int size) {
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("  SELECT num, name, subject, hitCount, ");
			sb.append("     TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append("  FROM bbs ");
			sb.append("  ORDER BY num DESC ");
			sb.append("  OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
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
	
	public List<BoardDTO> listBoard(int offset, int size, String condition, String keyword) {
		// 검색에서의 리스트
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("  SELECT num, name, subject, hitCount, ");
			sb.append("     TO_CHAR(reg_date, 'YYYY-MM-DD') reg_date ");
			sb.append("  FROM bbs ");
			if(condition.equals("all")) {
				sb.append("  WHERE INSTR(subject, ?) >=1 OR INSTR(content, ?) >= 1 ");
			} else if(condition.equals("reg_date")) {
				keyword = keyword.replaceAll("(\\-|\\/|\\.)", "");
				sb.append("  WHERE TO_CHAR(reg_date, 'YYYYMMDD') = ? ");
			} else {
				sb.append("  WHERE INSTR(" + condition + ", ?) >= 1 ");
			}
			sb.append("  ORDER BY num DESC ");
			sb.append("  OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			if(condition.equals("all")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, size);
			} else {
				pstmt.setString(1, keyword);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, size);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
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
	//게시글 번호 가져오기
	public BoardDTO readBoard(long num) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT num, name, subject, content, pwd, ipAddr, hitCount, reg_date "
					+ " FROM bbs"
					+ " WHERE num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setIpAddr(rs.getString("ipAddr"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setReg_date(rs.getString("reg_date"));
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
		return dto;
	}
	//게시글의 조회수 증가
	public void updateHitCount(long num) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			//UPDATE 테이블명 SET 컬럼=값 WHERE 조건
			sql="UPDATE bbs SET hitCount = hitCount +1 WHERE num =? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}
	
	public BoardDTO preReadBoard(long num,String condition, String keyword) {

		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		try {
			
			if(keyword != null && keyword.length() !=0) {
				//검색일때
				sb.append("SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num > ?  ");
				if(condition.equals("all")) {
					sb.append(" AND ( INSTR(subject, ?) >= 1 OR INSTR(content, ?)>=1 ) ");
				} else if(condition.equals("reg_date")) {
					keyword = keyword.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("  AND ( TO_CHAR(reg_date, 'YYYYMMDD') =? ) ");
				} else {
					sb.append(" AND ( INSTR(" + condition + ", ?) >= 1 ) ");
				}
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt =conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				pstmt.setString(2, keyword);
				if(condition.equals("all")) {
					pstmt.setString(3, keyword);
				}
				
			} else {
				//검색아닐때 
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num > ?  ");
				sb.append(" ORDER BY num ASC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt =conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
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
			return dto;
	}
	
	public BoardDTO nextReadBoard(long num,String condition, String keyword) {
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		try {
			
			if(keyword != null && keyword.length() !=0) {
				//검색일때
				sb.append("SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num < ?  ");
				if(condition.equals("all")) {
					sb.append(" AND ( INSTR(subject, ?) >= 1 OR INSTR(content, ?)>=1 ) ");
				} else if(condition.equals("reg_date")) {
					keyword = keyword.replaceAll("(\\-|\\/|\\.)", "");
					sb.append("  AND ( TO_CHAR(reg_date, 'YYYYMMDD') =? ) ");
				} else {
					sb.append(" AND ( INSTR(" + condition + ", ?) >= 1 ) ");
				}
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt =conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				pstmt.setString(2, keyword);
				if(condition.equals("all")) {
					pstmt.setString(3, keyword);
				}
				
			} else {
				//검색아닐때 
				sb.append(" SELECT num, subject ");
				sb.append(" FROM bbs ");
				sb.append(" WHERE num < ?  ");
				sb.append(" ORDER BY num DESC ");
				sb.append(" FETCH FIRST 1 ROWS ONLY ");
				
				pstmt =conn.prepareStatement(sb.toString());
				pstmt.setLong(1, num);
				
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				
				dto.setNum(rs.getLong("num"));
				dto.setSubject(rs.getString("subject"));
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
		return dto;
	}
	
	public void updateBoard(BoardDTO dto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			//UPDATE 테이블명 SET 컬럼명=값, 컬럼명=값 WHERE 조건
			sql="UPDATE bbs SET name=?,pwd=?, subject=?, content=? WHERE num=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2,dto.getPwd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setLong(5,dto.getNum());
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
	public void deleteBoard(long num) throws SQLException{
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="DELETE FROM bbs WHERE num=? ";
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
