package com.usol.solshop.model.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.usol.solshop.model.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.login_check", dto);
	}

	
}
