package com.ncu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    
}



