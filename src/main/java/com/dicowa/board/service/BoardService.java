package com.dicowa.board.service;

import java.util.List;
import java.util.Map;

import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;

public interface BoardService {

	int getCount() throws Exception;

	int delete(BoardDto boardDto) throws Exception;
	
	int update(BoardDto boardDto) throws Exception;

	int write(BoardDto boardDto) throws Exception;

	List<BoardDto> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	BoardDto read(Integer bno) throws Exception;
	
	

	//�럹�씠吏뺥븷�븣 �궗�슜�븷 �삁�젙
//	List<BoardDto> getPage(Map map) throws Exception;
//
//	int modify(BoardDto boardDto) throws Exception;
//
//	List<BoardDto> getSelectSearchPage(SearchCondition sc) throws Exception;
//
//	int getSearchResultCnt(SearchCondition sc) throws Exception;

}