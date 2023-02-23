package com.dicowa.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dicowa.board.dao.ReplyDao;
import com.dicowa.board.domain.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao dao;

	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		
		return dao.readReply(bno);
	}

	@Override
	public List<ReplyDto> readReplyE(int bno) throws Exception {
		
		return dao.readReplyE(bno);
	}

	@Override
	public List<ReplyDto> readReplyN(int bno) throws Exception {

		return dao.readReplyN(bno);
	}

	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		dao.writeReply(dto);
		
	}

	@Override
	public void writeReplyN(ReplyDto dto) throws Exception {
		dao.writeReplyN(dto);
		
	}

	@Override
	public void writeReplyE(ReplyDto dto) throws Exception {
		//
		dao.writeReplyE(dto);
		
	}
	
	//댓 수정
	@Override
	public void updateReply(ReplyDto dto) throws Exception {
		dao.updateReply(dto);
		
	}
	
	@Override
	public void updateReplyN(ReplyDto dto) throws Exception {
		dao.updateReplyN(dto);
		
	}

	@Override
	public void updateReplyE(ReplyDto dto) throws Exception {
		dao.updateReplyE(dto);
		
	}
	
	
	//댓 삭제
	@Override
	public void deleteReply(ReplyDto dto) throws Exception {
		dao.deleteReply(dto);
		
	}
	
	@Override
	public void deleteReplyN(ReplyDto dto) throws Exception {
		dao.deleteReplyN(dto);
		
	}

	@Override
	public void deleteReplyE(ReplyDto dto) throws Exception {
		dao.deleteReplyE(dto);
		
	}
	
	
	// 선택된 댓글조회
	@Override
	public ReplyDto selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(rno);
	}

	@Override
	public ReplyDto selectReplyN(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReplyN(rno);
	}

	@Override
	public ReplyDto selectReplyE(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReplyE(rno);
	}
	
	
}
