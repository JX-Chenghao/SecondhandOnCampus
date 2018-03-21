package com.ncu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.SignMapper;
import com.ncu.pojo.Sign;
import com.ncu.pojo.SignExample;
import com.ncu.service.SignService;

public class SignServiceImpl implements SignService {
    @Autowired
    SignMapper signMapper;
    @Override
    public boolean saveSign(Integer userId, Integer goodsId) {
    	if(IsCollectedByUser(userId, goodsId)){
    		return false;
    	}
        Sign sign = new Sign();
        sign.setUserId(userId);
        sign.setGoodsId(goodsId);
        signMapper.insert(sign);
        return true;
    }

    private boolean IsCollectedByUser(Integer userId, Integer goodsId){
    	SignExample ex=new SignExample();
    	ex.createCriteria().andGoodsIdEqualTo(goodsId).andUserIdEqualTo(userId);
    	List<Sign> sign = signMapper.selectByExample(ex);
    	if(sign.size()==0){
    		return false;
    	}
    	return true;
    }
    
    @Override
    public boolean removeSign(Integer signId) {
        signMapper.deleteByPrimaryKey(signId);
        return true;
    }
}
