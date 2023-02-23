package com.dicowa.board.dao;

import java.util.List;

import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;

public interface NoticeDao {

	BoardDto select(Integer bno) throws Exception;

	int count() throws Exception;

	int insert(BoardDto dto) throws Exception;

	int update(BoardDto dto) throws Exception;

	int delete(BoardDto dto) throws Exception;

	int deleteForAdmin(Integer bno) throws Exception;

	int deleteAll();

	List<BoardDto> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	int increaseViewCnt(Integer bno) throws Exception;

}