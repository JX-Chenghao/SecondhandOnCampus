package com.ncu.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ncu.common.FileSaveUtils;
import com.ncu.common.StringUtil;
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

	@Override
	public int register(HttpServletRequest request) {
		User user = new User();
		user.setAliasName(StringUtil.messyCodetoChineseStr(request.getParameter("aliasname")));
		user.setPhoneNumber(StringUtil.messyCodetoChineseStr(request.getParameter("phone_number")));
		user.setPwd(StringUtil.messyCodetoChineseStr(request.getParameter("pwd")));
		user.setSno(StringUtil.messyCodetoChineseStr(request.getParameter("sno")));
		//信息是否已被注册
		if(isExistUser(user)!=1)
			return isExistUser(user);
		//学号是否存在于学校数据库
		if(isSnoExistSchoolDB(user.getSno())){
	       /* 还可以补充学校数据库中的学生信息如 性别，真实姓名等*/
		}else{
			return 5;
		}
		userMapper.insertSelective(user);
		return 1;
	}
	private boolean isSnoExistSchoolDB(String sno){
		return true;
	}
	
	//信息是否已被注册
    private int isExistUser(User user) {
		//学号是否已被注册
    	if(findUserByAttribute(user.getSno(),"sno")!=null)                   return 2;
		//用户名是否重复
    	if(findUserByAttribute(user.getAliasName(),"aliasname")!=null)       return 3;
		//手机号是否已被用户注册
    	if(findUserByAttribute(user.getPhoneNumber(),"phone_number")!=null)  return 4;
    	return 1;
	}
    /**
     * 
     * @param value    属性值
     * @param attributeType  所查找的属性类型
     * @return 用户对象
     */
	private User findUserByAttribute(String value,String attributeType) {
		UserExample ex = new UserExample();
		//根据用户别名查找用户
		if(attributeType.equals("aliasname"))
		    ex.createCriteria().andAliasNameEqualTo(value);
		//根据用户学号查找用户
		else if(attributeType.equals("sno"))
			ex.createCriteria().andSnoEqualTo(value);
		//根据用户手机号查找用户
		else if(attributeType.equals("phone_number"))
			ex.createCriteria().andPhoneNumberEqualTo(value);

		List<User> users = userMapper.selectByExample(ex);
		if(users.size()!=0)
			return users.get(0);
		return null;
	}

	@Override
	public boolean updateUserInfo(String realName,String sex, String email,Integer id) {
		//ajax get
		User user=new User();
		user.setRealName(StringUtil.messyCodetoChineseStr(realName));
		user.setSex(StringUtil.messyCodetoChineseStr(sex));
		user.setEmail(StringUtil.messyCodetoChineseStr(email));
		user.setId(id);
		userMapper.updateByPrimaryKeySelective(user);
		return true;
	}

	@Override
	public boolean updateTradeInfo(String alipayNumber, String shippingAddress,Integer id) {
        //ajax post
		User user=new User();
		user.setAlipayNumber(alipayNumber);
		user.setShippingAddress(shippingAddress);
		user.setId(id);
		userMapper.updateByPrimaryKeySelective(user);
		return true;
	}

	@Override
	public boolean updatePWD(String real_oldPwd,String pwd_old, String pwd_new,Integer id) {
		//ajax post
		if(real_oldPwd.equals(pwd_old)){
		    	User user=new User();
		    	user.setPwd(pwd_new);
		    	user.setId(id);
		    	userMapper.updateByPrimaryKeySelective(user);
		    	return true;
		    }else{
		    	return false;
		    }
			
	}

	@Override
	public String saveHeadImg(MultipartFile pic_file,String store_path, String id) {
		String saveFileName = FileSaveUtils.saveFile(pic_file, store_path, id).getName();
		User user = new User();
		user.setId(Integer.parseInt(id));
		user.setHeadImg(saveFileName);
		userMapper.updateByPrimaryKeySelective(user);
		return saveFileName;
		
	}
	
}
