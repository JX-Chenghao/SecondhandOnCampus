package com.ncu.mapper;

import com.ncu.pojo.Sign;
import com.ncu.pojo.SignExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SignMapper {
    int countByExample(SignExample example);

    int deleteByExample(SignExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sign record);

    int insertSelective(Sign record);

    List<Sign> selectByExample(SignExample example);

    Sign selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sign record, @Param("example") SignExample example);

    int updateByExample(@Param("record") Sign record, @Param("example") SignExample example);

    int updateByPrimaryKeySelective(Sign record);

    int updateByPrimaryKey(Sign record);
}