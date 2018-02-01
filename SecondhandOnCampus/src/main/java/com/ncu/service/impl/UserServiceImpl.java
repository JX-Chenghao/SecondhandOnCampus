package com.ncu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.UserMapper;
import com.ncu.pojo.User;
import com.ncu.pojo.UserExample;
import com.ncu.pojo.UserExample.Criteria;
import com.ncu.service.UserService;

public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	@Override
	public User loginValidate(String user_account, String pwd) {
		UserExample ex = new UserExample();
		ex.createCriteria().andSnoEqualTo(user_account).andPwdEqualTo(pwd);
		List<User> users = userMapper.selectByExample(ex);
		if(users.size()==0){
			ex.clear();	
			ex.createCriteria().andAliasNameEqualTo(user_account).andPwdEqualTo(pwd);
			users = userMapper.selectByExample(ex);
		}
		return users.size()==0 ?   null :users.get(0);	
	}

}
