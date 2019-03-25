package com.usol.solshop.model.member.dao;

import com.usol.solshop.model.member.dto.MemberDTO;

public interface MemberDAO {

	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public MemberDTO insert(MemberDTO dto);
	
}
