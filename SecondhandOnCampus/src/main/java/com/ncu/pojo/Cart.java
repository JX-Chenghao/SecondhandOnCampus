package com.ncu.pojo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart{
	private Map<Integer, CartItem> cart = new HashMap<Integer, CartItem>();

	public void add(Goods goods){
		CartItem item = cart.get(goods.getId());
		if(item == null)
			cart.put(goods.getId(), new CartItem(goods));
		else
			item.setQuantity(item.getQuantity() + 1);
	}
	public void remove(int goodsId){
		cart.remove(goodsId);
	}
	public void changeQuantity(int goodsId,int quantity){
		CartItem item = cart.get(goodsId);
		if(item != null){
			int count = item.getQuantity() + quantity;
			if(count < 1)
				cart.remove(goodsId);
			else
				item.setQuantity(count);
		}
	}
	public double getTotal(){
		double total = 0;
		for(CartItem item : getItems()){
			total += item.getTotal();
		}
		return total;
	}
	public Collection<CartItem> getItems(){
		return cart.values();
	}
}
