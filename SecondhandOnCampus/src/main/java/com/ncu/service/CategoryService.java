package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Category;
import com.ncu.pojo.Evaluate;

public interface CategoryService {
      /*查询全部类型数据,包括介绍*/
	  List<Category> findAllCategoryDataWithIntroduce();
	  /*查询全部类型数据，不包括介绍*/
	  List<Category> findAllCategoryData();
	 
}
