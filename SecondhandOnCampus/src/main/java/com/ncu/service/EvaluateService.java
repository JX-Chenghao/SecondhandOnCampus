package com.ncu.service;

import com.ncu.pojo.Evaluate;

public interface EvaluateService {
      /*添加评论*/
	  boolean saveEvaluate(Evaluate evaluate);
	  /* 删除评论*/
	  void removeEvaluate(Integer evaluateId);
}
