package com.dicowa.board.service;

import com.dicowa.board.domain.MemberDto;

public interface MemberService {
	
	public void register(MemberDto memberDto) throws Exception;
	
	public MemberDto login(MemberDto memberDto) throws Exception;
	
	public void memberUpdate(MemberDto memberDto) throws Exception;
	
	public int idChk(MemberDto memberDto) throws Exception;
	
	
}
