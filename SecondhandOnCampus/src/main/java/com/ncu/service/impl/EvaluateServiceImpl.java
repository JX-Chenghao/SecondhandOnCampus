package com.ncu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.EvaluateMapper;
import com.ncu.pojo.Evaluate;
import com.ncu.service.EvaluateService;

public class EvaluateServiceImpl implements EvaluateService {

	@Autowired
	EvaluateMapper evaluateMapper;
	
	@Override
	public boolean saveEvaluate(Evaluate evaluate) {
	   evaluateMapper.insert(evaluate);
	   return true;
	}

	@Override
	public void removeEvaluate(Integer evaluateId) {
      evaluateMapper.deleteByPrimaryKey(evaluateId);
	}

}
