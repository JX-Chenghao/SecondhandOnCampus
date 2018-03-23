package com.ncu.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.GoodsMapper;
import com.ncu.mapper.SignMapper;
import com.ncu.pojo.Goods;
import com.ncu.pojo.GoodsExample;
import com.ncu.pojo.PageBean;
import com.ncu.pojo.Sign;
import com.ncu.pojo.SignExample;
import com.ncu.pojo.vo.SignVO;
import com.ncu.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	SignMapper signMapper;
	
	
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

	@Override
	public boolean saveGoods(Goods goods, int userId, int categoryId) {
		if(goods!=null){
			//未審核商品
			goods.setAuditState(0);
			//未賣出狀態
			goods.setGoodsState(0);
			goods.setUserId(userId);
			goods.setCategoryId(categoryId);
			goodsMapper.insert(goods);
			return  true;
		}
		return false;
	}

	@Override
	public boolean updateGoods(Goods goods) {
		if(goods!=null){
			//未審核商品
			goods.setAuditState(0);
			goodsMapper.updateByPrimaryKeySelective(goods);
			return  true;
		}
		return false;
	}

	@Override
	public boolean removeGoods(int goodsId) {
		goodsMapper.deleteByPrimaryKey(goodsId);
		return true;
	}

	@Override
	public Goods getDetailOfGoods(Integer id) {
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<SignVO> listGoodsForCollection(Integer userId) {
		/*收藏表*/
		SignExample ex = new SignExample();
		ex.createCriteria().andUserIdEqualTo(userId);
		List<Sign> signList = signMapper.selectByExample(ex);
		List<SignVO> signGoodsList=new ArrayList<SignVO>();
		for(Sign sign : signList){
			SignVO signVO = new SignVO();
			signVO.setGoods(goodsMapper.selectByPrimaryKey(sign.getGoodsId()));
			signVO.setSignId(sign.getId());
			signVO.setUserId(sign.getUserId());
			
			signGoodsList.add(signVO);
		}
		return signGoodsList;
	}

	@Override
	public List<Goods> listGoodsForUser(Integer userId, Integer auditState) {
		GoodsExample ex=new GoodsExample();
		if(auditState != null){
			//查詢所有自身還未審核商品0
			//查詢所有自身已通過商品1
			//查詢所有自身未通過商品2
			ex.createCriteria().andAuditStateEqualTo(auditState).andUserIdEqualTo(userId);
		}else{
			ex.createCriteria().andUserIdEqualTo(userId);
		}

		List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		return goodsList;
	}

	@Override
	public List<Goods> findOtherGoodsOfUser(Integer userId,
			Integer excludeGoodsId) {
		//已通過商品
		List<Goods> goodsList = listGoodsForUser(userId, 1);
		for(Goods g:goodsList){
			if(g.getId().equals(excludeGoodsId)){
				
			}
		}
		Iterator<Goods> iterator = goodsList.iterator();
		while(iterator.hasNext()){
			Goods g=iterator.next();
			if(g.getId().equals(excludeGoodsId)){
				iterator.remove();
			}
		}
		
		return goodsList;
	}

}
