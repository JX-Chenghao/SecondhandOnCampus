package com.ncu.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ncu.mapper.UserMapper;
import com.ncu.pojo.Category;
import com.ncu.pojo.User;
import com.ncu.pojo.UserExample;
import com.ncu.pojo.vo.CategoryVO;
import com.ncu.service.CategoryService;

public class CategoryServiceImplTest {

	    CategoryService categoryService;
		private ApplicationContext applicationContext;
		@Before
		public void setUp() throws Exception {
		 applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
		 categoryService=(CategoryService)applicationContext.getBean("categoryService");
		}
		
		
		@Test
		public void test() {
			List<CategoryVO> findAllCategoryDataWithIntroduce = categoryService.findAllCategoryDataWithIntroduce();
		    System.out.println(findAllCategoryDataWithIntroduce.size());
			for(CategoryVO c : findAllCategoryDataWithIntroduce){
		    	System.out.println(c.getFirstCategory().getName());
		    	for(Category cc : c.getSecondCategories()){
		    		System.out.println("-----"+cc.getName());
		    	}
		    }
		}

}
