package com.ncu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.common.RegularExpressionUtil;
import com.ncu.common.StringUtil;
import com.ncu.pojo.User;
import com.ncu.service.UserService;


@Controller 
@RequestMapping("/user")  
public class UserController {
    @Autowired
	UserService userService;
    //进入登录注册页面
    @RequestMapping("/index")  
    public ModelAndView index()throws Exception{  
        ModelAndView modelAndview=new ModelAndView();
        modelAndview.setViewName("index");
        return modelAndview; 
    }
    //登录
    @RequestMapping("/login")  
    public ModelAndView login(@RequestParam String user_account,@RequestParam String pwd,HttpServletRequest request)throws Exception{ 
    	ModelAndView modelAndview=new ModelAndView();
    	User user = userService.loginValidate(user_account, pwd);
    	if(user!=null){
    		request.getSession().setAttribute("user", user);
            modelAndview.setViewName("main");
           
    	}else{
    		modelAndview.setViewName("index");
    	}
    	 return modelAndview; 

    }
    //退出登录
    @RequestMapping("/loginout")  
    public String loginout(HttpServletRequest request)throws Exception{ 
    	//注销session
    	request.getSession().invalidate();
    	return "redirect:/user/index.action";
    }
    //注册
    @RequestMapping("/register")  
    @ResponseBody
    public Map<String, String> register(HttpServletRequest request)throws Exception{ 
    	Map<String, String> resMap=new HashMap<String, String>();
    	//注册信息是否合法
    	if(IsIegalToRegisterInfo(request,resMap)){
    		int res=userService.register(request);
    		if(res==1){
    		  resMap.put("res", "success");
    		}else if(res==2){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "学号已被注册");
    		}else if(res==3){
      		  resMap.put("res", "fail");
      		  resMap.put("failInfo", "用户名已被使用");
      		}else if(res==4){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "手机号已被注册 ");
    		}else if(res==5){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "学号不存在");
    		}
    	}else{
    		resMap.put("res", "fail");
    	}
    	return resMap;
    }
	private boolean IsIegalToRegisterInfo(HttpServletRequest request,Map<String, String> resMap) {
		if(!RegularExpressionUtil.isUserSno(request.getParameter("sno"))){
			resMap.put("failInfo", "学号不规范");
			return false;
		}
		if(!RegularExpressionUtil.isUserAliasName(StringUtil.messyCodetoChineseStr(request.getParameter("aliasname")))){
			resMap.put("failInfo", "用户名不能超过15个字符");
			return false;
		}
		if(!RegularExpressionUtil.isUserPwd(request.getParameter("pwd"))){
			resMap.put("failInfo", "密码应大于6位小于16位字符");
			return false;
		}
		if(!RegularExpressionUtil.isUserMobileNumber(request.getParameter("phone_number"))){
			resMap.put("failInfo", "手机号格式不规范");
			return false;
		}
		return true;
	}
}



