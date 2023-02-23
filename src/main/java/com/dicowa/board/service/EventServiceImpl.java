package com.dicowa.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dicowa.board.dao.EventDao;
import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
	@Override
	public int getCount() throws Exception {
	      return eventDao.count();
	  }

	@Override
	public int delete(BoardDto boardDto) throws Exception {
	      return eventDao.delete(boardDto);
	  }

	@Override
	public int write(BoardDto boardDto) throws Exception {
	    //throw new Exception("test");  
		return eventDao.insert(boardDto);
	  }

	@Override
	public List<BoardDto> list(SearchCriteria scri) throws Exception {
	      return eventDao.list(scri);
	  }

	@Override
	public BoardDto read(Integer bno) throws Exception {
	      //BoardDto boardDto = eventDao.read(bno);
//	      System.out.println(boardDto);
//	      eventDao.increaseViewCnt(bno);

	      return eventDao.read(bno);
	  }

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return eventDao.listCount(scri);
	}

	@Override
	public int update(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return eventDao.update(boardDto);
	}

	//�럹�씠吏뺥븷�븣 �궗�슜�븷 �삁�젙
//	@Override
//	public List<BoardDto> getPage(Map map) throws Exception {
//	      return boardDao.selectPage(map);
//	  }
//
//	@Override
//	public int modify(BoardDto boardDto) throws Exception {
//	      return boardDao.update(boardDto);
//	}
//	
//	@Override
//	public List<BoardDto> getSelectSearchPage(SearchCondition sc) throws Exception {
//	      return boardDao.selectSearchPage(sc);
//	}
//	
//	@Override
//	public int getSearchResultCnt(SearchCondition sc) throws Exception {
//	      return boardDao.searchResultCnt(sc);
//	}
}
