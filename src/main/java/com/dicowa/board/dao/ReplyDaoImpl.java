package com.dicowa.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dicowa.board.domain.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSession session;
	
	String namespace = "com.dicowa.board.dao.ReplyDao.";
	
	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		
		return session.selectList(namespace+"readReply", bno);
	}

	@Override
	public List<ReplyDto> readReplyE(int bno) throws Exception {
	
		return session.selectList(namespace + "readReplyE", bno);
	}

	@Override
	public List<ReplyDto> readReplyN(int bno) throws Exception {
		
		return session.selectList(namespace + "readReplyN", bno);
	}

	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		session.insert(namespace + "writeReply", dto);
		
	}

	@Override
	public void writeReplyN(ReplyDto dto) throws Exception {
		session.insert(namespace + "writeReplyN", dto);
		
	}

	@Override
	public void writeReplyE(ReplyDto dto) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + "writeReplyE", dto);
	}

	@Override
	public void updateReply(ReplyDto dto) throws Exception {
		session.update(namespace + "updateReply", dto);
		
	}
	
	@Override
	public void updateReplyN(ReplyDto dto) throws Exception {
		session.update(namespace + "updateReplyN", dto);
		
	}

	@Override
	public void updateReplyE(ReplyDto dto) throws Exception {
		session.update(namespace + "updateReplyE", dto);
		
	}
	
	
	@Override
	public void deleteReply(ReplyDto dto) throws Exception {
		session.delete(namespace + "deleteReply", dto);
		
	}

	@Override
	public void deleteReplyN(ReplyDto dto) throws Exception {
		session.delete(namespace + "deleteReplyN", dto);
		
	}

	@Override
	public void deleteReplyE(ReplyDto dto) throws Exception {
		session.delete(namespace + "deleteReplyE",dto);
		
	}
	
	
	
	@Override
	public ReplyDto selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectReply", rno);
	}	

	@Override
	public ReplyDto selectReplyN(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectReplyN", rno);
	}

	@Override
	public ReplyDto selectReplyE(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectReplyE", rno);
	}
	
}
