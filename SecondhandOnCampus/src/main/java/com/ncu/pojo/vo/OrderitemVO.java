package com.ncu.pojo.vo;

import com.ncu.pojo.Orderitem;

public class OrderitemVO {
	private Orderitem orderitem;
	private String goodName;
	private String goodUsedMonth;

	public Orderitem getOrderitem() {
		return orderitem;
	}

	public void setOrderitem(Orderitem orderitem) {
		this.orderitem = orderitem;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getGoodUsedMonth() {
		return goodUsedMonth;
	}

	public void setGoodUsedMonth(String goodUsedMonth) {
		this.goodUsedMonth = goodUsedMonth;
	}

	@Override
	public String toString() {
		return "OrderitemVO [orderitem=" + orderitem + ", goodName=" + goodName
				+ ", goodUsedMonth=" + goodUsedMonth + "]";
	}



}
