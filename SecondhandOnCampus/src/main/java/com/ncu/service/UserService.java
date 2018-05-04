package com.ncu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

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
    /**
     * 修改用户信息-个人/交易/密码 信息
     * @param info  用户Id  /real_oldPwd 真正的旧密码，传来的 旧密码 与新密码
     * @return true 成功  false 失败
     */
	boolean updateUserInfo(String realName,String sex,String email,Integer id);
	boolean updateTradeInfo(String alipayNumber,String shippingAddress,Integer id);
	boolean updatePWD(String real_oldPwd,String pwd_old,String pwd_new,Integer id);
	/**
	 * 保存头像
	 * @param pic_file  文件
	 * @param store_path 存储路径
	 * @param id       userId
	 */
	String saveHeadImg(MultipartFile pic_file, String store_path,String id);
	User findUserById(Integer userID);
	int findUserCount();
	List<User> findAllUser();
}
