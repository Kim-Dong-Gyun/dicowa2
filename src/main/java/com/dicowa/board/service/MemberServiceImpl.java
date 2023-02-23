package com.dicowa.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dicowa.board.dao.MemberDao;
import com.dicowa.board.domain.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDao memberDao;

	@Override
	public void register(MemberDto memberDto) throws Exception {
		memberDao.register(memberDto);
		
	}

	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		
		return memberDao.login(memberDto);
	}

	@Override
	public void memberUpdate(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		memberDao.memberUpdate(memberDto);
	}

	@Override
	public int idChk(MemberDto memberDto) throws Exception {
		int result = memberDao.idChk(memberDto);
		return result;
	}
	
	
}
