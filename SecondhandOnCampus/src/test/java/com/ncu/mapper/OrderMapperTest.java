package com.ncu.mapper;

import static org.junit.Assert.fail;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncu.pojo.Order;

public class OrderMapperTest {

    OrderMapper orderMapper;
	private ApplicationContext applicationContext;
	@Before
	public void setUp() throws Exception {
	 applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	 orderMapper=(OrderMapper)applicationContext.getBean("orderMapper");
	}
	@Test
	public void testInsert() {
		Order order = new Order();
		order.setCropId(1);
		order.setGetWay(1);
		order.setOrderDate(new Date());
		order.setOrderState(1);
		order.setUserId(1);
		order.setTotalPrice(1D);
		order.setPayWay(1);
		order.setOrderNumber("sss");
		orderMapper.insertSelective(order);
	}

	@Test
	public void testInsertSelective() {
		fail("Not yet implemented");
	}

}
