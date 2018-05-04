package com.ncu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.AdminMapper;
import com.ncu.pojo.Admin;
import com.ncu.pojo.AdminExample;
import com.ncu.service.AdminService;

public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;

	@Override
	public Admin loginValidate(String account, String pwd) {
		AdminExample ex = new AdminExample();
		ex.createCriteria().andAccountEqualTo(account).andPwdEqualTo(pwd);
		List<Admin> admins = adminMapper.selectByExample(ex);
		return admins.size() == 0 ? null : admins.get(0);
	}

	

}
