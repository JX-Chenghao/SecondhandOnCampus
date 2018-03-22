package com.ncu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.EvaluateMapper;
import com.ncu.mapper.MessageMapper;
import com.ncu.pojo.Evaluate;
import com.ncu.pojo.Message;
import com.ncu.service.EvaluateService;
import com.ncu.service.MessageService;

public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageMapper messageMapper;

	@Override
	public void saveMessage(Message message) {
          messageMapper.insertSelective(message);		
	}

	@Override
	public void removeMessage(Integer messageId) {
		messageMapper.deleteByPrimaryKey(messageId);
	}

	@Override
	public void editMessageStatus(Integer messageId) {
		Message message = new Message();
		message.setId(messageId);
		message.setStatus(1);
		messageMapper.updateByPrimaryKeySelective(message);
	}
	
	

}
