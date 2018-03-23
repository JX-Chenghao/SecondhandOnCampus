package com.ncu.pojo.vo;

import com.ncu.pojo.Message;

public class MessageVO {
     Message message;
     String  userAliasname;
     Message replyMessage;
     boolean replyStatus=false;
     
	public String getUserAliasname() {
		return userAliasname;
	}
	public void setUserAliasname(String userAliasname) {
		this.userAliasname = userAliasname;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Message getReplyMessage() {
		return replyMessage;
	}
	public void setReplyMessage(Message replyMessage) {
		this.replyMessage = replyMessage;
	}
	public boolean isReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(boolean replyStatus) {
		this.replyStatus = replyStatus;
	}
     
}
