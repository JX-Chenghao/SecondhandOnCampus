package com.ncu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ncu.mapper.EvaluateMapper;
import com.ncu.pojo.Evaluate;
import com.ncu.pojo.EvaluateExample;
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

	@Override
	public List<Evaluate> findEvaluateOfUserCrop(Integer userId) {
		EvaluateExample ex = new EvaluateExample();
		ex.createCriteria().andCropIdEqualTo(userId);
		return evaluateMapper.selectByExample(ex);
	}

}
