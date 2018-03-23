package com.ncu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.Evaluate;
import com.ncu.pojo.Message;
import com.ncu.service.EvaluateService;
import com.ncu.service.MessageService;

@Controller 
@RequestMapping("/user/evaluate")  
public class EvaluateController {

	@Autowired
	EvaluateService evaluateService;
	
    //添加评价
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,String> add(Evaluate evaluate) throws Exception {
    	Map<String, String> resMap=new HashMap<String, String>();
        evaluateService.saveEvaluate(evaluate);
        resMap.put("res", "success");
        return resMap;
    }
    //查询此商品的卖家 评论
    @RequestMapping("/query")
    @ResponseBody
    public List<Evaluate> query(Integer userId) throws Exception {
    	List<Evaluate> evaluates =null;
    	if(userId!=null)
           evaluates = evaluateService.findEvaluateOfUserCrop(userId);
        return evaluates;
    }
    //移除评价（管理员）
    @RequestMapping("/remove")
    public ModelAndView remove(Integer evaluateId) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
        evaluateService.removeEvaluate(evaluateId);
        modelAndView.setViewName("X");
        return modelAndView;
    }

}
