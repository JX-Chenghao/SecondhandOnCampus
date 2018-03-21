package com.ncu.pojo.vo;

import com.ncu.pojo.Goods;

public class SignVO {
    private Integer userId;
    private Integer signId;
    private Goods    goods;
   
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getSignId() {
		return signId;
	}
	public void setSignId(Integer signId) {
		this.signId = signId;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
      
}
