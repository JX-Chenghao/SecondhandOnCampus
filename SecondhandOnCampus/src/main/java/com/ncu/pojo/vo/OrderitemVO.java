package com.ncu.pojo.vo;

import com.ncu.pojo.Orderitem;

public class OrderitemVO {
	private Orderitem orderitem;
	private String goodName;
	private String goodUsedMonth;
	private String goodPicPath;
	private String goodCoverPic;
	

	public String getGoodPicPath() {
		return goodPicPath;
	}

	public void setGoodPicPath(String goodPicPath) {
		this.goodPicPath = goodPicPath;
	}

	public String getGoodCoverPic() {
		return goodCoverPic;
	}

	public void setGoodCoverPic(String goodCoverPic) {
		this.goodCoverPic = goodCoverPic;
	}

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
