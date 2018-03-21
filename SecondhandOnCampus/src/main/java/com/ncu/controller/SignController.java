package com.ncu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.User;
import com.ncu.service.SignService;

@Controller 
@RequestMapping("/user/sign")  
public class SignController {

	@Autowired
	SignService signService;
	
    //添加收藏
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,String> add(Integer userId, Integer goodsId) throws Exception {
    	Map<String, String> resMap=new HashMap<String, String>();
        boolean res=signService.saveSign(userId, goodsId);
        if(res) {
        	resMap.put("res", "success");
        }else{
        	resMap.put("res", "collected");
        }
        return resMap;
    }
    //移除收藏
    @RequestMapping("/remove")
    public String remove(Integer userId, Integer signId, HttpServletRequest request,Model model) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        if(user != null && user.getId().equals(userId)){
             signService.removeSign(signId);
             model.addAttribute("userId", user.getId());
            return "redirect:/goods/showCollection.action";
        }
            return "redirect:/user/index.action";
    }
}
