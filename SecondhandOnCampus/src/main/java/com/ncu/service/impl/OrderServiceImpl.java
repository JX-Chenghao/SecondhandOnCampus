package com.ncu.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.OrderMapper;
import com.ncu.mapper.OrderitemMapper;
import com.ncu.pojo.Cart;
import com.ncu.pojo.CartItem;
import com.ncu.pojo.Goods;
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
           int id = orderMapper.insert(orderVO.getOrder());
           for( Orderitem item : orderVO.getOrderitems()) {
               item.setOrderId(id);
               orderitemMapper.insertSelective(item);
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

	@Override
	public List<OrderVO> separateCartToManyOrder(Cart cart, Integer payway,
			Integer clientUserId) {
        if(cart.getItems().size()==0){return null;}
        Collection<CartItem> items = cart.getItems();
        List<OrderVO> orderVOList= new ArrayList<OrderVO>();

        OrderVO orderVO=new OrderVO();
        Map<Integer,OrderVO> orderMap=new HashMap<Integer,OrderVO>();
        //购物车取出商品项
        for(CartItem item : items){
            //商家id一致的配为一个订单
            if(orderMap.containsKey(item.getGoods().getUserId())){
                orderVO = orderMap.get(item.getGoods().getUserId());
            }else{
                //放入订单  设置订单属性
            	orderVO=new OrderVO();
                Order order =setOrderAttr(item.getGoods().getUserId(),payway,clientUserId);
                orderVO.setOrder(order);
                orderMap.put(item.getGoods().getUserId(),orderVO);
            }
            //放入订单项  设置订单项属性
            Orderitem orderitem =setOrderitemAttr(item.getGoods(),item.getQuantity());
            orderVO.getOrderitems().add(orderitem);
        }
        //结束后 需要设置订单Order的总价
        setOrderTotalPriceAndPutOrderVOToList(orderMap,orderVOList);

        return orderVOList;
	}

    private void setOrderTotalPriceAndPutOrderVOToList(Map<Integer, OrderVO> orderMap, List<OrderVO> orderVOList) {
        for(Map.Entry<Integer,OrderVO> entry : orderMap.entrySet()){
            double sum=0;
            for(Orderitem orderitem   : entry.getValue().getOrderitems()){
                sum+=orderitem.getPrice();
            }
            entry.getValue().getOrder().setTotalPrice(sum);
            orderVOList.add(entry.getValue());
        }
    }

    private Orderitem setOrderitemAttr(Goods good,Integer quantity) {
        Orderitem orderitem = new Orderitem();
        orderitem.setGoodsId(good.getId());//所属订单ID在插入时设置
        orderitem.setPrice(good.getPrice()*quantity);
        orderitem.setQuantity(quantity);
		return orderitem;
    }

    private Order setOrderAttr(Integer cropId, Integer payway, Integer clientUserId) {
        Order order = new Order();
        order.setCropId(cropId);
        order.setOrderDate(new Date());
        order.setOrderState(0);
        order.setPayWay(payway);
        order.setUserId(clientUserId);
        return order;
    }


}
