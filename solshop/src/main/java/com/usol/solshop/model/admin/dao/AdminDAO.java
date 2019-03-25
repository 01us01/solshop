package com.usol.solshop.model.admin.dao;

import com.usol.solshop.model.member.dto.MemberDTO;

public interface AdminDAO {
	public String loginCheck(MemberDTO dto);
}
