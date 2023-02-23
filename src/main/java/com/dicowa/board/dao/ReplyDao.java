package com.dicowa.board.dao;

import java.util.List;

import com.dicowa.board.domain.ReplyDto;

public interface ReplyDao {

	//댓글 조회
	public List<ReplyDto> readReply(int bno) throws Exception;
	
	public List<ReplyDto> readReplyE(int bno) throws Exception;
	
	public List<ReplyDto> readReplyN(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyDto dto) throws Exception;
	
	public void writeReplyN(ReplyDto dto) throws Exception;
	
	public void writeReplyE(ReplyDto dto) throws Exception;
	
	//댓글 수정
	public void updateReply(ReplyDto dto) throws Exception;
	
	public void updateReplyN(ReplyDto dto) throws Exception;
	
	public void updateReplyE(ReplyDto dto) throws Exception;
	
	
	// 댓글 삭제
	public void deleteReply(ReplyDto dto) throws Exception;
	
	public void deleteReplyN(ReplyDto dto) throws Exception;
	
	public void deleteReplyE(ReplyDto dto) throws Exception;
	
	// 선택된 댓글 조회
	public ReplyDto selectReply(int rno) throws Exception;
	
	public ReplyDto selectReplyN(int rno) throws Exception;
	
	public ReplyDto selectReplyE(int rno) throws Exception;
	
	
}
