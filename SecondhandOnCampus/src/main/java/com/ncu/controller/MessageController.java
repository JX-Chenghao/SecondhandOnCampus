package com.ncu.controller;

import java.util.HashMap;
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
@RequestMapping("/user/message")  
public class MessageController {
	@Autowired
	MessageService messageService;
	
    //用户留言
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,String> add(Message message) throws Exception {
    	Map<String, String> resMap=new HashMap<String, String>();
        messageService.saveMessage(message);
        resMap.put("res", "success");
        return resMap;
    }
    //商家回复留言
    @RequestMapping("/reply")
    @ResponseBody
    public Map<String,String> reply(Message message,Integer messageId) throws Exception {
    	Map<String, String> resMap=new HashMap<String, String>();
    	//设置父留言 即回复的是哪一条留言
    	message.setParentMessage(messageId);
        messageService.saveMessage(message);
        //更改父留言的状态
        messageService.editMessageStatus(messageId);
        resMap.put("res", "success");
        return resMap;
    }
    //移除留言（管理员）
    @RequestMapping("/remove")
    public ModelAndView remove(Integer messageId) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
        messageService.removeMessage(messageId);
        modelAndView.setViewName("X");
        return modelAndView;
    }
	}
