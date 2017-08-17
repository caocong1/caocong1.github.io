package com.test.service;

import java.util.List;

import com.test.bean.ClassDao;

public interface ClassService {

	List<ClassDao> getClassby();

	Integer getClassmax(Integer grade);
}
