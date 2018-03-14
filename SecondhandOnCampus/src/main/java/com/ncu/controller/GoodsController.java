package com.ncu.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.common.RegularExpressionUtil;
import com.ncu.common.StringUtil;
import com.ncu.pojo.Goods;
import com.ncu.pojo.PageBean;
import com.ncu.pojo.User;
import com.ncu.service.GoodsService;
import com.ncu.service.UserService;


@Controller 
@RequestMapping("/goods")  
public class GoodsController {
    @Autowired
	GoodsService goodsService;
    
    //分页展示商品
    @RequestMapping("/showGoodsByPage")
    public ModelAndView showGoodsByPage(HttpServletRequest request){
    	
    	ModelAndView modelAndView=new ModelAndView();
    	int currentPage;
    	if(request.getParameter("currentPage")!=null)
    		currentPage=Integer.parseInt(request.getParameter("currentPage"));
    	else
    		currentPage=1;
    	
    	PageBean<Goods> pageBeanForGoods = goodsService.getGoodsByPage(currentPage);
    	System.out.println(pageBeanForGoods.toString());
    	modelAndView.addObject("pageBeanForGoods", pageBeanForGoods);
    	modelAndView.setViewName("goods");
		return modelAndView;
		
    }
	
  
}



