package com.ncu.service;

import com.ncu.pojo.Message;

public interface MessageService {
      /*添加留言*/
	  void saveMessage(Message message);
	  /* 删除留言*/
	  void removeMessage(Integer messageId);
	  /*更改留言状态 0未被回复  1 已被回复*/
	  void editMessageStatus(Integer messageId);
}
