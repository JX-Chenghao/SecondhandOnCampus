package com.ncu.service;

import javax.servlet.http.HttpServletRequest;

import com.ncu.pojo.User;

public interface UserService {
	/**
	 * 登录验证
	 * @param user_account
	 * @param pwd
	 * @return 用户对象
	 */
    User loginValidate(String user_account, String pwd );
    /**
     * 注册用户
     * @param request
     * @return 数值 1代表成功注册  2代表学号已被注册3代表用户名已被使用4代表手机号已被注册 5 学号不存在于学校数据库
     */
	int register(HttpServletRequest request);
}
