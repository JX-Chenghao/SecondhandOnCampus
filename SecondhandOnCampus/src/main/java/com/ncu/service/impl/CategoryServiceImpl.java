package com.ncu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.CategoryMapper;
import com.ncu.pojo.Category;
import com.ncu.pojo.CategoryExample;
import com.ncu.pojo.vo.CategoryVO;
import com.ncu.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> findAllSecondCategoryData() {
		CategoryExample example = new CategoryExample();
		example.createCriteria().andParentIdIsNotNull();
		return categoryMapper.selectByExample(example);
	}

	@Override
	public List<CategoryVO> findAllCategoryDataWithIntroduce() {
		List<CategoryVO> categoryVOs=new ArrayList<CategoryVO>();
		CategoryExample example = new CategoryExample();
		List<Category> categories = categoryMapper.selectByExampleWithBLOBs(example);
		//O(m+n)
		Map<Integer,List<Category>> map=new HashMap<Integer, List<Category>>();
		for(Category c :categories){
			if(c.getParentId()==null){  //为一级目录ID则放入一级列表
				CategoryVO categoryVO = new CategoryVO();
				categoryVO.setFirstCategory(c);
				categoryVOs.add(categoryVO);
				continue;
			}
			if(map.get(c.getParentId())!=null){ //为二级目录ID则放入映射集
					map.get(c.getParentId()).add(c);
					continue;
			}
			ArrayList<Category> cs = new ArrayList<Category>();
			cs.add(c);
			map.put(c.getParentId(),cs);
		}
		//这时 已存在 一个 一级目录列表 和  一个 以所属一级目录ID为key,value为一个此ID下属所有二级目录列表，的映射集，匹配就行
		for(CategoryVO categoryVO: categoryVOs){
			categoryVO.setSecondCategories(map.get(categoryVO.getFirstCategory().getId()));
		}
		
		return categoryVOs;
	}

}
