package com.ncu.service;

import java.util.List;

import com.ncu.pojo.Evaluate;

public interface EvaluateService {
      /*添加评论*/
	  boolean saveEvaluate(Evaluate evaluate);
	  /* 删除评论*/
	  void removeEvaluate(Integer evaluateId);
	  /*查看商家评论*/
	  List<Evaluate> findEvaluateOfUserCrop(Integer userId);
}
