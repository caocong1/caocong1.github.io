package com.test.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.test.dao.ClassDaoMapper;
import com.test.service.ClassService;
import com.test.bean.ClassDao;

@Service
public class ClassServiceImpl  implements ClassService{
	
	@Resource
	private ClassDaoMapper cla;
	
	@Override
	public List<ClassDao> getClassby() {
		List<ClassDao> result;
	    result = cla.selectAll();
		return result;
	}
	
	@Override
	public Integer getClassmax(Integer grade){
		return cla.getClassmax(grade);
	}

}
