package com.ncu.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.MessageMapper;
import com.ncu.mapper.UserMapper;
import com.ncu.pojo.Message;
import com.ncu.pojo.MessageExample;
import com.ncu.pojo.vo.MessageVO;
import com.ncu.service.MessageService;

public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageMapper messageMapper;
	@Autowired
	UserMapper userMapper;

	@Override
	public void saveMessage(Message message) {
		  message.setMessageDate(new Date());
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

	@Override
	public List<MessageVO> findMessageOfGoods(Integer goodsId) {
		List<MessageVO> messageVOs=new ArrayList<MessageVO>();
		MessageExample ex = new MessageExample();
		ex.createCriteria().andGoodsIdEqualTo(goodsId);
		List<Message> messages = messageMapper.selectByExample(ex);
		MessageVO messageVO=null;
		for(Message m: messages){
			messageVO=new MessageVO();
			//找到留言的用户名
			String userAliasname=userMapper.selectByPrimaryKey(m.getUserId()).getAliasName();
			messageVO.setUserAliasname(userAliasname);
			//查看每条留言是否有回复，有则查询出来
			ex.clear();
			ex.createCriteria().andParentMessageEqualTo(m.getId());
			List<Message> replyMessages = messageMapper.selectByExample(ex);
			if(replyMessages.size()>0){
			   messageVO.setReplyMessage(replyMessages.get(0));
			   messageVO.setReplyStatus(1);
			}else{
				 messageVO.setReplyStatus(0);
			}
			messageVO.setMessage(m);
			messageVOs.add(messageVO);
		}
		return messageVOs;
	}
	
	

}
