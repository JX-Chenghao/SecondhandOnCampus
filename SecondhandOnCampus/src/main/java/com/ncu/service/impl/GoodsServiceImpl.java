package com.ncu.service.impl;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.common.FileSaveUtils;
import com.ncu.mapper.GoodsMapper;
import com.ncu.mapper.MessageMapper;
import com.ncu.mapper.SignMapper;
import com.ncu.pojo.Goods;
import com.ncu.pojo.GoodsExample;
import com.ncu.pojo.Message;
import com.ncu.pojo.MessageExample;
import com.ncu.pojo.PageBean;
import com.ncu.pojo.Sign;
import com.ncu.pojo.SignExample;
import com.ncu.pojo.vo.GoodsVO;
import com.ncu.pojo.vo.SignVO;
import com.ncu.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	SignMapper signMapper;
	@Autowired
	MessageMapper messageMapper;

	@Override
	public PageBean<Goods> getGoodsByPage(int currPage, Integer categoryId) {

		PageBean<Goods> pageBean = new PageBean<Goods>();

		GoodsExample ex = new GoodsExample();
		// 当前页
		pageBean.setCurrPage(currPage);
		// 每页记录数
		final int pageSize = 12;
		pageBean.setPageSize(pageSize);
		// 总记录数
		if (categoryId != null) {
			ex.createCriteria().andCategoryIdEqualTo(categoryId);
		}
		final int totalCount = goodsMapper.countByExample(ex);
		pageBean.setTotalCount(totalCount);
		// 总页数
		final int totalPage = PageBean.countTatalPage(pageSize, totalCount);
		pageBean.setTotalPage(totalPage);

		/* 查询数据库 */

		// 当前页开始记录
		final int offset = PageBean.countOffset(pageSize, currPage);
		// 每页记录数
		final int length = pageSize;
		// 当前页 此函数 若传入0 则当作1（即首次进入页面时）
		final int currentPage = PageBean.countCurrentPage(currPage);

		// 记录集合
		ex.setStartRow(offset);
		ex.setPageSize(pageSize);
		ex.setOrderByClause("publish_date desc");
		ex.createCriteria().andQuantityGreaterThan(0);
		final List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		pageBean.setList(goodsList);

		return pageBean;
	}

	@Override
	public boolean saveGoods(Goods goods, int userId, int categoryId) {
		if (goods != null) {
			// 未審核商品
			goods.setAuditState(0);
			// 未賣出狀態
			goods.setGoodsState(0);
			goods.setUserId(userId);
			goods.setCategoryId(categoryId);
			goods.setPublishDate(new Date());
			goodsMapper.insert(goods);
			return true;
		}
		return false;
	}

	@Override
	public boolean updateGoods(Goods goods) {
		if (goods != null) {
			goodsMapper.updateByPrimaryKeySelective(goods);
			return true;
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
		/* 收藏表 */
		SignExample ex = new SignExample();
		ex.createCriteria().andUserIdEqualTo(userId);
		List<Sign> signList = signMapper.selectByExample(ex);
		List<SignVO> signGoodsList = new ArrayList<SignVO>();
		for (Sign sign : signList) {
			SignVO signVO = new SignVO();
			signVO.setGoods(goodsMapper.selectByPrimaryKey(sign.getGoodsId()));
			signVO.setSignId(sign.getId());
			signVO.setUserId(sign.getUserId());

			signGoodsList.add(signVO);
		}
		return signGoodsList;
	}

	@Override
	public List<GoodsVO> listGoodsForUser(Integer userId, Integer auditState) {
		GoodsExample ex = new GoodsExample();
		if (auditState != null) {
			// 查詢所有自身還未審核商品0
			// 查詢所有自身已通過商品1
			// 查詢所有自身未通過商品2
			ex.createCriteria().andAuditStateEqualTo(auditState)
					.andUserIdEqualTo(userId);
		} else {
			ex.createCriteria().andUserIdEqualTo(userId);
		}
		List<GoodsVO> goodsListRes = new ArrayList<GoodsVO>();
		List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		GoodsVO goodsVO;
		for (Goods g : goodsList) {
			goodsVO = new GoodsVO();
			goodsVO.setGoods(g);
			if (auditState.equals(1)) {
				MessageExample msgex = new MessageExample();
				msgex.createCriteria().andGoodsIdEqualTo(g.getId())
						.andStatusEqualTo(0);
				List<Message> m = messageMapper.selectByExample(msgex);
				if (m.size() > 0) {
					goodsVO.setNewMsg(true);
					goodsVO.setMsgNum(m.size());
				}
			}
			goodsListRes.add(goodsVO);
		}
		return goodsListRes;
	}

	@Override
	public List<Goods> listGoodsForUser(Integer userId) {
		GoodsExample ex = new GoodsExample();
		// 已通过
		ex.createCriteria().andAuditStateEqualTo(1).andUserIdEqualTo(userId);
		List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		return goodsList;
	}

	@Override
	public List<Goods> findOtherGoodsOfUser(Integer userId,
			Integer excludeGoodsId) {
		// 已通過商品
		List<Goods> goodsList = listGoodsForUser(userId);

		Iterator<Goods> iterator = goodsList.iterator();
		while (iterator.hasNext()) {
			Goods g = iterator.next();
			if (g.getId().equals(excludeGoodsId)) {
				iterator.remove();
			}
		}

		return goodsList;
	}

	@Override
	public Goods findGoodsById(Integer id) {
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer findGoodsQuantityById(Integer id) {
		Integer quantity = findGoodsById(id).getQuantity();
		return quantity;
	}

	@Override
	public int findGoodsCount(int status) {
		GoodsExample ex = new GoodsExample();
		ex.createCriteria().andAuditStateEqualTo(status);
		return goodsMapper.countByExample(ex);
	}

	@Override
	public List<GoodsVO> findGoodsForAuditing() {
		GoodsExample ex = new GoodsExample();
		ex.createCriteria().andAuditStateEqualTo(0);
		List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		List<GoodsVO> goodsVOs=new ArrayList<GoodsVO>();
		GoodsVO goodsVO;
		for (Goods g : goodsList) {
			goodsVO=new GoodsVO();
			goodsVO.setGoods(g);
			String replaceAll = g.getPicturePath().replace("/", "\\");
			String path = FileSaveUtils.getSavePath() + replaceAll;
			File f = new File(path);
			if (f.exists()) {
				String[] fileNames = f.list(new FilenameFilter() {
					@Override
					public boolean accept(File dir, String name) {
						return !name.startsWith("thumbnail");// 不返回缩略图的名字
					}
				});
				goodsVO.setFileName( fileNames);
			}
			goodsVOs.add(goodsVO);
		}

		return goodsVOs;
	}

	@Override
	public PageBean<Goods> getGoodsByPage(int currPage, String likeStr) {
		PageBean<Goods> pageBean = new PageBean<Goods>();

		GoodsExample ex = new GoodsExample();
		// 当前页
		pageBean.setCurrPage(currPage);
		// 每页记录数
		final int pageSize = 12;
		pageBean.setPageSize(pageSize);
		// 总记录数
		ex.createCriteria().andNameLike("%"+likeStr+"%");
		final int totalCount = goodsMapper.countByExample(ex);
		pageBean.setTotalCount(totalCount);
		// 总页数
		final int totalPage = PageBean.countTatalPage(pageSize, totalCount);
		pageBean.setTotalPage(totalPage);

		/* 查询数据库 */

		// 当前页开始记录
		final int offset = PageBean.countOffset(pageSize, currPage);
		// 每页记录数
		final int length = pageSize;
		// 当前页 此函数 若传入0 则当作1（即首次进入页面时）
		final int currentPage = PageBean.countCurrentPage(currPage);

		// 记录集合
		ex.setStartRow(offset);
		ex.setPageSize(pageSize);
		ex.setOrderByClause("publish_date desc");
		ex.createCriteria().andQuantityGreaterThan(0);
		final List<Goods> goodsList = goodsMapper.selectByExampleWithBLOBs(ex);
		pageBean.setList(goodsList);

		return pageBean;
	}

}
