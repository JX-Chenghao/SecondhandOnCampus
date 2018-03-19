package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Goods;
import com.ncu.pojo.PageBean;

public interface GoodsService {
    /*商品分頁*/
	PageBean<Goods> getGoodsByPage(int currPage);
   /*保存商品*/
    boolean saveGoods(Goods goods, int userId, int categoryId);
   /*修改商品*/
    boolean updateGoods(Goods goods);
    /*移除商品*/
    boolean removeGoods(int goodsId);
    /*商品詳細信息*/
    Goods getDetailOfGoods(Integer id);
    /*列出用戶收藏商品*/
    List<Goods> listGoodsForCollection(Integer userId);
    /*列出用戶自身商品*/
    List<Goods> listGoodsForUser(Integer userId, Integer auditState);
}