package com.usol.solshop.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.usol.solshop.model.admin.dao.AdminDAO;
import com.usol.solshop.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;

	@Override
	public String loginCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return adminDao.loginCheck(dto);
	}

}
