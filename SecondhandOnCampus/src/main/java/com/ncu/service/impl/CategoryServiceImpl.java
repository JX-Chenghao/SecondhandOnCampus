package com.ncu.service.impl;

import java.util.List;

import org.apache.log4j.lf5.viewer.categoryexplorer.CategoryElement;
import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.CategoryMapper;
import com.ncu.pojo.Category;
import com.ncu.pojo.CategoryExample;
import com.ncu.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> findAllCategoryData() {
		return categoryMapper.selectByExample(new CategoryExample());
	}

	@Override
	public List<Category> findAllCategoryDataWithIntroduce() {
		return categoryMapper.selectByExampleWithBLOBs(new CategoryExample());
	}

}
