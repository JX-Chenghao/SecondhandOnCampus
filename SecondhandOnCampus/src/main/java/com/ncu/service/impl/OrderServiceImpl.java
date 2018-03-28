package com.ncu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.OrderMapper;
import com.ncu.mapper.OrderitemMapper;
import com.ncu.pojo.Order;
import com.ncu.pojo.OrderExample;
import com.ncu.pojo.Orderitem;
import com.ncu.pojo.OrderitemExample;
import com.ncu.pojo.vo.OrderVO;
import com.ncu.service.OrderService;

public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderitemMapper orderitemMapper;

    @Override
    public boolean save(OrderVO orderVO) {
       orderMapper.insert(orderVO.getOrder());
       for(Orderitem item : orderVO.getOrderitems()){
           orderitemMapper.insert(item);
       }
       return true;
    }

    @Override
    public List<OrderVO> findOrderByCropId(Integer cropId) {
    	List<OrderVO> orderVOs=new ArrayList<OrderVO>();
        OrderExample ex=new OrderExample();
        ex.createCriteria().andCropIdEqualTo(cropId);
        List<Order> orders = orderMapper.selectByExample(ex);
        OrderitemExample example = new OrderitemExample();
        OrderVO orderVO=new OrderVO();
        for(Order o : orders){
        	
        	example.createCriteria().andOrderIdEqualTo(o.getId());
        	List<Orderitem> items = orderitemMapper.selectByExample(example);
        	example.clear();
        	orderVO.setOrder(o);
        	orderVO.setOrderitems(items);
        	orderVOs.add(orderVO);
        }
        return orderVOs;
    }

    @Override
    public List<OrderVO> findOrderByClientId(Integer clientId) {
    	List<OrderVO> orderVOs=new ArrayList<OrderVO>();
        OrderExample ex=new OrderExample();
        ex.createCriteria().andUserIdEqualTo(clientId);
        List<Order> orders = orderMapper.selectByExample(ex);
        OrderitemExample example = new OrderitemExample();
        OrderVO orderVO=new OrderVO();
        for(Order o : orders){
        	
        	example.createCriteria().andOrderIdEqualTo(o.getId());
        	List<Orderitem> items = orderitemMapper.selectByExample(example);
        	example.clear();
        	orderVO.setOrder(o);
        	orderVO.setOrderitems(items);
        	orderVOs.add(orderVO);
        }
        return orderVOs;
    }

    @Override
    public boolean updateOrderStatus(int orderId,int status) {
        OrderExample ex = new OrderExample();
        ex.createCriteria().andOrderStateEqualTo(status);
        Order order = new Order();
        order.setId(orderId);
        orderMapper.updateByExampleSelective(order, ex);
        return true;
    }






}
