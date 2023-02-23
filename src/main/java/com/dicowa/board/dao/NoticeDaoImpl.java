package com.dicowa.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dicowa.board.domain.BoardDto;
import com.dicowa.board.domain.Criteria;
import com.dicowa.board.domain.SearchCriteria;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSession session;
	
	String namespace = "com.dicowa.board.dao.NoticeDao.";
	
	@Override
	public BoardDto select(Integer bno) throws Exception {
		return session.selectOne(namespace + "select", bno);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+"count");
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		return session.insert(namespace+"insert", dto);
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		return session.update(namespace+"update", dto);
	}

	@Override
	public int delete(BoardDto dto) throws Exception {
		
        return session.delete(namespace+"delete", dto);
	}

	@Override
	public int deleteForAdmin(Integer bno) throws Exception {
		Map map = new HashMap();
        map.put("bno", bno);
        return session.delete(namespace+"deleteForAdmin", map);
	}

	@Override
	public int deleteAll() {
		return session.delete(namespace+"deleteAll");
	}

	@Override
	public List<BoardDto> list(SearchCriteria scri) throws Exception {
		return session.selectList(namespace+"list", scri);
	}

	@Override
	public int increaseViewCnt(Integer bno) throws Exception {
		return session.update(namespace+"increaseViewCnt", bno);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return session.selectOne(namespace + "listCount", scri);
	}
}
