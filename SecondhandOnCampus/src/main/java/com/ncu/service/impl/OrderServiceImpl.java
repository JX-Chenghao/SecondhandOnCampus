package com.ncu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.aliyuncs.exceptions.ClientException;
import com.ncu.common.SmsSendMessage;
import com.ncu.mapper.EvaluateMapper;
import com.ncu.mapper.GoodsMapper;
import com.ncu.mapper.OrderMapper;
import com.ncu.mapper.OrderitemMapper;
import com.ncu.mapper.UserMapper;
import com.ncu.pojo.Cart;
import com.ncu.pojo.CartItem;
import com.ncu.pojo.Evaluate;
import com.ncu.pojo.EvaluateExample;
import com.ncu.pojo.Goods;
import com.ncu.pojo.Order;
import com.ncu.pojo.OrderExample;
import com.ncu.pojo.Orderitem;
import com.ncu.pojo.OrderitemExample;
import com.ncu.pojo.User;
import com.ncu.pojo.vo.OrderVO;
import com.ncu.pojo.vo.OrderitemVO;
import com.ncu.service.OrderService;

public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	OrderitemMapper orderitemMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	EvaluateMapper evaluateMapper;

	@Override
	public boolean save(OrderVO orderVO) {
		orderMapper.insertSelective(orderVO.getOrder());
		boolean res = true;
		for (OrderitemVO itemVO : orderVO.getOrderitemVOs()) {

			Goods g = new Goods();
			g.setId(itemVO.getOrderitem().getGoodsId());
			synchronized (g) {
				g = goodsMapper.selectByPrimaryKey(g.getId());
				if (g.getQuantity() >= itemVO.getOrderitem().getQuantity()) {
					g.setQuantity(g.getQuantity()
							- itemVO.getOrderitem().getQuantity());

					itemVO.getOrderitem()
							.setOrderId(orderVO.getOrder().getId());
					orderitemMapper.insertSelective(itemVO.getOrderitem());
				} else {
					res = false;
				}
				goodsMapper.updateByPrimaryKeySelective(g);
			}
			// System.out.println(itemVO.toString());
		}

		if (!res) {
			Order odr = orderMapper.selectByPrimaryKey(orderVO.getOrder()
					.getId());
			odr.setOrderState(-1);
			orderMapper.updateByPrimaryKeySelective(odr);
			return false;
		}
		return true;
	}

	@Override
	public List<OrderVO> findOrderByCropId(Integer cropId, Integer orderStatus) {
		List<OrderVO> orderVOs = new ArrayList<OrderVO>();
		OrderExample ex = new OrderExample();
		ex.createCriteria().andCropIdEqualTo(cropId)
				.andOrderStateEqualTo(orderStatus);
		ex.setOrderByClause("order_date desc");
    
		return findOrder(orderVOs, ex);
	}

	@Override
	public List<OrderVO> findOrderByClientId(Integer clientId,
			Integer orderStatus) {
		List<OrderVO> orderVOs = new ArrayList<OrderVO>();
		OrderExample ex = new OrderExample();
		if (orderStatus != null) {
			ex.createCriteria().andUserIdEqualTo(clientId)
					.andOrderStateEqualTo(orderStatus);
		} else {
			ex.createCriteria().andUserIdEqualTo(clientId);
		}
		ex.setOrderByClause("order_date desc");
		return findOrder(orderVOs, ex);
	}

	private List<OrderVO> findOrder(List<OrderVO> orderVOs, OrderExample ex) {
		List<Order> orders = orderMapper.selectByExample(ex);
		OrderitemExample example = new OrderitemExample();
		OrderVO orderVO = null;
		for (Order o : orders) {
			orderVO = new OrderVO();
			example.createCriteria().andOrderIdEqualTo(o.getId());
			List<OrderitemVO> items = orderitemMapper.selectByExample(example);
			for (OrderitemVO itemVO : items) {
				Goods good = goodsMapper.selectByPrimaryKey(itemVO
						.getOrderitem().getGoodsId());
				itemVO.setGoodPicPath(good.getPicturePath());
				itemVO.setGoodCoverPic(good.getCoverPic());
				itemVO.setGoodName(good.getName());
			}
			example.clear();
			EvaluateExample ex1 = new EvaluateExample();
			ex1.createCriteria().andOrderIdEqualTo(o.getId());
			List<Evaluate> evaluate = evaluateMapper.selectByExample(ex1);
			if (evaluate.size() > 0) {
				orderVO.setEvaluateContent(evaluate.get(0).getContent());
			}
	        System.out.println(o.toString());
			orderVO.setOrder(o);
			orderVO.setOrderitemVOs(items);
			orderVOs.add(orderVO);
		}
		return orderVOs;
	}

	@Override
	public boolean updateOrderStatus(int orderId, int status) {
		OrderExample ex = new OrderExample();
		ex.createCriteria().andOrderStateEqualTo(status);
		Order order = new Order();
		
		if(status==1){
			order.setOverDate(new Date());
			order.setOrderState(2);
		}else if(status==0){
			order.setOrderState(1);
			order.setSendDate(new Date());
		}else{
			return false;
		}
		order.setId(orderId);
		orderMapper.updateByPrimaryKeySelective(order);
		
		//发短信
		Order o = orderMapper.selectByPrimaryKey(orderId);
		User client = userMapper.selectByPrimaryKey(o.getUserId());
		if(status==0){
			try {
				SmsSendMessage.sendSms(client.getPhoneNumber(), o.getOrderNumber(), null,o.getGetWay());
			} catch (ClientException e) {
				e.printStackTrace();
			}
		}
		
		return true;
	}

	@Override
	public List<OrderVO> separateCartToManyOrder(Cart cart, Integer payway,
			Integer clientUserId) {
		if (cart.getItems().size() == 0) {
			return null;
		}
		Collection<CartItem> items = cart.getItems();
		List<OrderVO> orderVOList = new ArrayList<OrderVO>();
		OrderVO orderVO = new OrderVO();
		Map<Integer, OrderVO> orderMap = new HashMap<Integer, OrderVO>();
		// 购物车取出商品项
		for (CartItem item : items) {
			// 商家id一致的配为一个订单
			if (orderMap.containsKey(item.getGoods().getUserId())) {
				orderVO = orderMap.get(item.getGoods().getUserId());
			} else {
				// 放入订单 设置订单属性
				orderVO = new OrderVO();
				Order order = setOrderAttr(item.getGoods().getUserId(), payway,
						clientUserId);
				// 设置商家名
				User crop = userMapper.selectByPrimaryKey(order.getCropId());
				orderVO.setCropName(crop.getAliasName());
				orderVO.setOrder(order);
				orderMap.put(item.getGoods().getUserId(), orderVO);
			}
			// 放入订单项 设置订单项属性
			Orderitem orderitem = setOrderitemAttr(item.getGoods(),
					item.getQuantity());
			OrderitemVO orderitemVO = new OrderitemVO();
			orderitemVO.setOrderitem(orderitem);
			// 设置商品名
			Goods good = goodsMapper.selectByPrimaryKey(orderitem.getGoodsId());
			orderitemVO.setGoodName(good.getName());
			orderitemVO.setGoodUsedMonth(good.getUsedMonth() + "");
			orderitemVO.setGoodCoverPic(good.getCoverPic());
			orderitemVO.setGoodPicPath(good.getPicturePath());

			orderVO.getOrderitemVOs().add(orderitemVO);
		}
		// 结束后 需要设置订单Order的总价
		setOrderTotalPriceAndPutOrderVOToList(orderMap, orderVOList);

		return orderVOList;
	}

	private void setOrderTotalPriceAndPutOrderVOToList(
			Map<Integer, OrderVO> orderMap, List<OrderVO> orderVOList) {
		for (Map.Entry<Integer, OrderVO> entry : orderMap.entrySet()) {
			double sum = 0;
			for (OrderitemVO orderitem : entry.getValue().getOrderitemVOs()) {
				sum += orderitem.getOrderitem().getPrice();
			}
			entry.getValue().getOrder().setTotalPrice(sum);
			orderVOList.add(entry.getValue());
		}
	}

	private Orderitem setOrderitemAttr(Goods good, Integer quantity) {
		Orderitem orderitem = new Orderitem();
		orderitem.setGoodsId(good.getId());// 所属订单ID在插入时设置
		orderitem.setPrice(good.getPrice() * quantity);
		orderitem.setQuantity(quantity);
		return orderitem;
	}

	private Order setOrderAttr(Integer cropId, Integer payway,
			Integer clientUserId) {
		Order order = new Order();
		order.setCropId(cropId);
		order.setOrderDate(new Date());
		order.setPayWay(payway);
		order.setUserId(clientUserId);
		return order;
	}

	@Override
	public void deleteOrderById(Integer id) {
		OrderitemExample ex = new OrderitemExample();
		ex.createCriteria().andOrderIdEqualTo(id);
		List<OrderitemVO> items = orderitemMapper.selectByExample(ex);
		for(OrderitemVO i :items){
			orderitemMapper.deleteByPrimaryKey(i.getOrderitem().getId());
		}
		orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int findOrderCount() {
		return orderMapper.countByExample(null);
	}

	@Override
	public List<OrderVO> findOrderByNotSendGoods() {
		OrderExample ex = new OrderExample();
		ex.createCriteria().andOrderStateEqualTo(0);
		return fillOrderVOForAdmin(ex);
	}



	@Override
	public List<OrderVO> findOrderByNotGetGoods() {
		OrderExample ex = new OrderExample();
		ex.createCriteria().andOrderStateEqualTo(1);
		return fillOrderVOForAdmin(ex);
	}
	private List<OrderVO> fillOrderVOForAdmin(OrderExample ex) {
		List<Order> orders = orderMapper.selectByExample(ex);
		List<OrderVO> orderVos=new ArrayList<OrderVO>();
		 OrderVO orderVo;
		for(Order o : orders){
			orderVo=new OrderVO();
			orderVo.setOrder(o);
			User crop = userMapper.selectByPrimaryKey(o.getCropId());
			User client = userMapper.selectByPrimaryKey(o.getUserId());
			orderVo.setCropName(crop.getAliasName());
			orderVo.setCropPhone(crop.getPhoneNumber());
			orderVo.setClientName(client.getAliasName());
			orderVo.setClientPhone(client.getPhoneNumber());
			if(o.getSendDate()!=null){
				try {
					orderVo.setOverdueDays(daysBetween(o.getSendDate(),new Date()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			orderVos.add(orderVo);
		}
		return orderVos;
	}

	@Override
	public OrderVO findOrderById(Integer orderId) {
		OrderVO orderVO=new OrderVO();
		Order order = orderMapper.selectByPrimaryKey(orderId);
		orderVO.setOrder(order);
		User crop = userMapper.selectByPrimaryKey(order.getCropId());
		User client = userMapper.selectByPrimaryKey(order.getUserId());
		orderVO.setCropName(crop.getAliasName());
		orderVO.setCropPhone(crop.getPhoneNumber());
		orderVO.setClientName(client.getAliasName());
		orderVO.setClientPhone(client.getPhoneNumber());
		if(order.getSendDate()!=null){
			try {
				orderVO.setOverdueDays(daysBetween(order.getSendDate(),new Date()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return orderVO;
	}
	
	public static Integer daysBetween(Date fdate,Date adate) throws ParseException    
    {    
        Calendar cal = Calendar.getInstance();    
        cal.setTime(fdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(adate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    }

	@Override
	public OrderVO findOrderByNum(String orderNumber) {
		OrderVO orderVO=new OrderVO();
		OrderExample ex = new OrderExample();
		ex.createCriteria().andOrderNumberEqualTo(orderNumber).andOrderStateNotEqualTo(2);
		List<Order> orders = orderMapper.selectByExample(ex);
		if(orders.size() == 0){
			return null;
		}
		Order order=orders.get(0);
		orderVO.setOrder(order);
		User crop = userMapper.selectByPrimaryKey(order.getCropId());
		User client = userMapper.selectByPrimaryKey(order.getUserId());
		orderVO.setCropName(crop.getAliasName());
		orderVO.setCropPhone(crop.getPhoneNumber());
		orderVO.setClientName(client.getAliasName());
		orderVO.setClientPhone(client.getPhoneNumber());
		if(order.getSendDate()!=null){
			try {
				orderVO.setOverdueDays(daysBetween(order.getSendDate(),new Date()));
				System.out.println(orderVO.getOverdueDays()+"天");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return orderVO;
	}    
}
