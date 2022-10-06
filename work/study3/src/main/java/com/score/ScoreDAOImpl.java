package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ScoreDAOImpl implements ScoreDAO {
	private Connection conn = DBConn.getConnection();

	@Override
	public void insertScore(ScoreDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			// INSERT INTO 테이블명(컬럼명, 컬럼명) values( 값, 값)
			// 1) 쿼리작성
			sql = "INSERT INTO score(hak,name, birth, kor, eng, mat) VALUES (?,?,?,?,?,?)";
			// 2)쿼리를 preparedStatement객체에 받기
			pstmt = conn.prepareStatement(sql);
			// 3) setter로 ?값 할당
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());

			// 4)쿼리실행
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// SQLIntegerityConstrationViolationException
			// :기본키 중복, NOT NULL 등 제약조건 위반에 예외발생(무결성 제약위반)
			// 에러코드 1- 기본키제약워반, 1400-NOTNULL제약위반
			// SQLDataException
			// : 날짜등 형식잘못입력으로 인한 예외
			// :1840, 1861 - 날짜오류
			e.printStackTrace();
			throw e;
		} catch (Exception e) {

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
		}

	}

	@Override
	public void updateScore(ScoreDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE score SET name=?,birth=?, kor=?, eng=?, mat=? WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}

	@Override
	public void deleteScore(String hak) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		//DELETE FROM 테이블명 WHERE 조건
		
		
		try {
			sql="DELETE FROM score WHERE hak= ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt !=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}

	}
	
	@Override
	public void deleteScore(String[] hak) throws SQLException {
		PreparedStatement pstmt = null;
		String sql;
		
		
		
		//DELETE FROM 테이블명 WHERE 조건
		
		try {
			sql="DELETE FROM score WHERE hak IN (";
			for(int i=0;i<hak.length; i++) {
				sql +="?,";
			}
			sql = sql.substring(0,sql.length()-1)+")";
			
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<hak.length;i++) {
				pstmt.setString(i+1,hak[i]);
			}
			
			pstmt.executeUpdate();
//			sql="DELETE FROM score WHERE hak= ? ";
//			for(int i=0;i<hak.length;i++) {
//				pstmt = conn.prepareStatement(sql);
			//쿼리 실행을 하는 구문
//				pstmt.setString(1, hak[i]);
//				pstmt.executeUpdate();
//			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt !=null) {
				try {
					pstmt.close();
					//객체생성을 여러번 해야지 닫는다.
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
	}

	@Override
	public int dateCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT COUNT(*) FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// result = rs.getInt("cnt");
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}

	@Override
	public List<ScoreDTO> listScore() {
		List<ScoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			// SELECT 컬럼명, 컬럼명 FROM 테이블명 [WHERE 조건]
			sql = " SELECT hak, name, TO_CHAR(birth, 'YYYY-MM-DD') birth,"
					+ "kor, eng, mat, kor+eng+mat tot, (kor+eng+mat)/3 ave " + "FROM score ORDER BY hak";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ScoreDTO dto = new ScoreDTO();

				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		;
		return list;
	}

	@Override
	public List<ScoreDTO> listScore(int offset, int size) {
		// offset : 건너뛸 수 , size : 가져올 개수
		List<ScoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = " SELECT hak, name, TO_CHAR(birth, 'YYYY-MM-DD') birth, "
					+ " kor,eng,mat, kor+eng+mat tot, (kor+eng+mat)/3 ave "
					+ " FROM score "
					+ " ORDER BY hak "
					+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ScoreDTO dto = new ScoreDTO();

				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));

				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			
			if(pstmt !=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}

		}

		return list;
	}

	@Override
	public ScoreDTO readscore(String hak) {
		ScoreDTO dto =  null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		
		try {
			sql="SELECT hak, name,TO_CHAR(birth, 'YYYY-MM-DD') birth, kor, eng, mat FROM score WHERE hak =? ";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,hak);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
//				dto.setBirth(rs.getDate("birth").toString());
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs !=null) {
				try {
					rs.close();
				}catch(Exception e2) {
				}
			}
			if(pstmt!= null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
		return dto;
	}

}
