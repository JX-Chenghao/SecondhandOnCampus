package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Category;
import com.ncu.pojo.vo.CategoryVO;

public interface CategoryService {
      /*查询全部类型数据,包括1级2级目录 及介绍*/
	  List<CategoryVO> findAllCategoryDataWithIntroduce();
	  /*查询全部类型数据，不包括介绍*/
	  List<Category> findAllSecondCategoryData();
}
