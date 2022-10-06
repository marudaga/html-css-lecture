package com.score;

import java.sql.SQLException;
import java.util.List;

public interface ScoreDAO {
	public void insertScore(ScoreDTO dto) throws SQLException;
	public void updateScore(ScoreDTO dto)throws SQLException;
	public void deleteScore(String hak) throws SQLException;
	public void deleteScore(String[] hak)throws SQLException;
	
	public int dateCount();
	public List<ScoreDTO> listScore();
	public List<ScoreDTO> listScore(int offset, int size);
	public ScoreDTO readscore(String hak);
}
