package com.dicowa.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dicowa.board.domain.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Inject
	SqlSession session;
	
	@Override
	public void register(MemberDto memberDto) throws Exception {
		System.out.println("회원가입");
		session.insert("memberMapper.register", memberDto);
		
	}

	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		System.out.println("로그인");
		return session.selectOne("memberMapper.login", memberDto);
	}

	@Override
	public void memberUpdate(MemberDto memberDto) throws Exception {
		
		session.update("memberMapper.memberUpdate" , memberDto);
	}

	@Override
	public int idChk(MemberDto memberDto) throws Exception {
		int result = session.selectOne("memberMapper.idChk", memberDto);
		return result;
	}

}
