package com.ncu.service;

public interface SignService {
	boolean saveSign(Integer userId, Integer goodsId);
	boolean removeSign(Integer signId);
}
