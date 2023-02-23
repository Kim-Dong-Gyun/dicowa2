package com.dicowa.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dicowa.board.dao.BoardDao;
import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public int getCount() throws Exception {
	      return boardDao.count();
	  }

	@Override
	public int delete(BoardDto boardDto) throws Exception {
	      return boardDao.delete(boardDto);
	  }

	@Override
	public int write(BoardDto boardDto) throws Exception {
	    //throw new Exception("test");  
		return boardDao.insert(boardDto);
	  }

	@Override
	public List<BoardDto> list(SearchCriteria scri) throws Exception {
	      return boardDao.list(scri);
	  }

	@Override
	public BoardDto read(Integer bno) throws Exception {
	      BoardDto boardDto = boardDao.select(bno);
	      System.out.println(boardDto);
	     // boardDao.increaseViewCnt(bno);

	      return boardDto;
	  }

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return boardDao.listCount(scri);
	}

	@Override
	public int update(BoardDto boardDto) throws Exception {
		return boardDao.update(boardDto);
		
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
