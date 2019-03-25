package com.usol.solshop.service.member;

import javax.servlet.http.HttpSession;

import com.usol.solshop.model.member.dto.MemberDTO;

public interface MemberService {

	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public MemberDTO viewMember(String userid);
	public MemberDTO insert(MemberDTO dto);
}
