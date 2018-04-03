package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Cart;
import com.ncu.pojo.vo.OrderVO;

public interface OrderService {
     boolean save(OrderVO orderVO);
     List<OrderVO> findOrderByCropId(Integer cropId);
     List<OrderVO> findOrderByClientId(Integer clientId);
     boolean updateOrderStatus(int orderId,int status);
     List<OrderVO> separateCartToManyOrder(Cart cart,Integer payway,Integer clientUserId);
}
