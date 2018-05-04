package com.ncu.pojo.vo;

import com.ncu.pojo.Goods;

public class GoodsVO {
     private Goods goods;
     private boolean newMsg;
     private int   msgNum;
     private String[] fileName;
     
	public String[] getFileName() {
		return fileName;
	}
	public void setFileName(String[] fileName) {
		this.fileName = fileName;
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public boolean getNewMsg() {
		return newMsg;
	}
	public void setNewMsg(boolean newMsg) {
		this.newMsg = newMsg;
	} 
     
      
}
