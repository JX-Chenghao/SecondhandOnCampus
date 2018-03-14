package com.ncu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.GoodsMapper;
import com.ncu.pojo.Goods;
import com.ncu.pojo.GoodsExample;
import com.ncu.pojo.PageBean;
import com.ncu.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsMapper goodsMapper;
	
	@Override
	public PageBean<Goods> getGoodsByPage(int currPage) {
		
		
		PageBean<Goods> pageBean = new PageBean<Goods>();
		 
		GoodsExample ex=new GoodsExample();
		//当前页
		pageBean.setCurrPage(currPage);
		//每页记录数
		final int pageSize=12; 
		pageBean.setPageSize(pageSize);
		//总记录数
		final int totalCount =goodsMapper.countByExample(ex); 
		pageBean.setTotalCount(totalCount);
        //总页数
        final int totalPage = PageBean.countTatalPage(pageSize, totalCount);
        pageBean.setTotalPage(totalPage);
       
        
        /*查询数据库*/
        
        //当前页开始记录
        final int offset = PageBean.countOffset(pageSize, currPage); 
        // 每页记录数
        final int length = pageSize; 
        //当前页    此函数   若传入0  则当作1（即首次进入页面时）
        final int currentPage = PageBean.countCurrentPage(currPage); 
        
      
        //记录集合
        ex.setStartRow(offset);
        ex.setPageSize(pageSize);
        final List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
        pageBean.setList(goodsList);
        
		return pageBean;
	}

}
