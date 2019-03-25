package com.usol.solshop.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.usol.solshop.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.loginCheck", dto);
		if (name == null) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public MemberDTO insert(MemberDTO dto) {
		return sqlSession.selectOne("member.insert", dto);
	}

}
