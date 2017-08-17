package com.test.dao;

import com.test.bean.ClassDao;
import java.util.List;

public interface ClassDaoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ClassDao record);

    ClassDao selectByPrimaryKey(Integer id);

    List<ClassDao> selectAll();

    int updateByPrimaryKey(ClassDao record);
    
    Integer getClassmax(Integer grade);
}