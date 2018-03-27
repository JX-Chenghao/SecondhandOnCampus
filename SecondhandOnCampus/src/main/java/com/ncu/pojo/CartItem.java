package com.ncu.pojo;

import java.io.Serializable;

public class CartItem implements Serializable {
	private Goods goods;
	private int quantity = 1;

	public CartItem() {
	}

	public CartItem(Goods goods) {
		this.goods = goods;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return goods.getPrice() * quantity;
	}

}
