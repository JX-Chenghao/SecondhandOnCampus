package com.ncu.pojo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart{
	private Map<Integer, CartItem> cart = new HashMap<Integer, CartItem>();

	public boolean add(Goods goods,Integer quantity){
		CartItem item = cart.get(goods.getId());
		if(item!=null && (item.getQuantity() == goods.getQuantity())){
			return false;
		}
		if(item!=null && quantity!=null && (item.getQuantity()+quantity > goods.getQuantity())){
			return false;
		}
		if(item == null){
			cart.put(goods.getId(), new CartItem(goods));
		}else{
			if(quantity!=null){ 
				item.setQuantity(item.getQuantity() + quantity);
			}else{
				item.setQuantity(item.getQuantity() + 1);
			}
		}
		return true;
	}
	public void remove(int goodsId){
		cart.remove(goodsId);
	}
	public void changeQuantity(int goodsId,int quantity){
		CartItem item = cart.get(goodsId);
		if(item != null){
			int count = quantity;
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
