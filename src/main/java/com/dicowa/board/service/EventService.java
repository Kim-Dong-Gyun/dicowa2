package com.dicowa.board.service;

import java.util.List;

import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;

public interface EventService {

	int getCount() throws Exception;

	int delete(BoardDto boardDto) throws Exception;

	int write(BoardDto boardDto) throws Exception;

	List<BoardDto> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	BoardDto read(Integer bno) throws Exception;
	
	int update(BoardDto boardDto) throws Exception;

}