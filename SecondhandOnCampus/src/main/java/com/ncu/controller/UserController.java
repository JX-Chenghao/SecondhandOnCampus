package com.ncu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller 
@RequestMapping("/user")  
public class UserController {

    //进入登录页面
    @RequestMapping("/loginView")  
    public ModelAndView loginView(String tel,String password)throws Exception{  
        ModelAndView modelAndview=new ModelAndView();
        modelAndview.setViewName("login");
        return modelAndview; 
    }
    
   
}



