package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Cart;
import com.ncu.pojo.Order;
import com.ncu.pojo.vo.OrderVO;

public interface OrderService {
     boolean save(OrderVO orderVO);
     List<OrderVO> findOrderByCropId(Integer cropId,Integer orderStatus);
     List<OrderVO> findOrderByClientId(Integer clientId,Integer orderStatus);
     boolean updateOrderStatus(int orderId,int status);
     List<OrderVO> separateCartToManyOrder(Cart cart,Integer payway,Integer clientUserId);
	 void deleteOrderById(Integer id);
	int findOrderCount();
	List<OrderVO> findOrderByNotSendGoods();
	List<OrderVO> findOrderByNotGetGoods();
	OrderVO findOrderById(Integer orderId);
}
