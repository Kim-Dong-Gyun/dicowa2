package com.dicowa.main;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dicowa.board.dao.BoardDao;
import com.dicowa.board.domain.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoImplTest {
	
	@Autowired
	BoardDao boardDao;
	
	@Test
	public void insertTestData() throws Exception{
//		boardDao.deleteAll();
		for(int i=1; i<50; i++) {
			BoardDto boardDto = new BoardDto("title"+i, "no content", "green");
			boardDao.insert(boardDto);
		}
	}
}
