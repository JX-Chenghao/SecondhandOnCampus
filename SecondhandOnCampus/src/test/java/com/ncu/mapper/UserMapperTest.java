package com.ncu.mapper;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncu.pojo.User;
import com.ncu.pojo.UserExample;
import com.ncu.pojo.UserExample.Criteria;

public class UserMapperTest {
    UserMapper userMapper;
	private ApplicationContext applicationContext;
	@Before
	public void setUp() throws Exception {
	 applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	 userMapper=(UserMapper)applicationContext.getBean("userMapper");
	}

	@Test
	public void testCountByExample() {
		
		UserExample uExample=new UserExample();

		int countByExample = userMapper.countByExample(uExample);
		System.out.println(countByExample);
	}

	@Test
	public void testInsert() {
		User user = new User();
		user.setAliasName("x");
		user.setEmail("x");
		user.setPhoneNumber("11");
		user.setPwd("xx");
		user.setRealName("aa");
		user.setSex("nan");
		user.setSno("123");
		userMapper.insert(user);
	}

	@Test
	public void testSelectByExample() {
		UserExample uExample=new UserExample();
		uExample.createCriteria().andAliasNameLike("%hao%");
		List<User> lists = userMapper.selectByExample(uExample);
		for(User s: lists){
			System.out.println(s.toString());
		}
	}

	/*不为空就更新，所以不需要查询出来，直接构造对象，有id 就行*/
	@Test
	public void testUpdateByPrimaryKeySelective() {   
		fail("Not yet implemented");
	}
    /*全部更新，那么必须要全部查询出来*/	
	@Test
	public void testUpdateByPrimaryKey() {
		User u = userMapper.selectByPrimaryKey(1);
		u.setAliasName("Chenghao");
		userMapper.updateByPrimaryKey(u);
	}

}
