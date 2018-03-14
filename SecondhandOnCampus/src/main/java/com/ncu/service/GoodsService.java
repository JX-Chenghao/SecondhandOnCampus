package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Goods;
import com.ncu.pojo.PageBean;

public interface GoodsService {

	PageBean<Goods> getGoodsByPage(int currPage);

}
