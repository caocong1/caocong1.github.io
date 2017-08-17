package com.test.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.service.ClassService;

import net.sf.json.JSONObject;

import com.alibaba.fastjson.JSON;
import com.test.bean.ClassDao;

@Controller
@RequestMapping(value = "/")
public class BaseController {
	
	@Resource
	private ClassService cla;
	
	@RequestMapping(value="class.do")
	public String test(Model model)
	{
		return "class";	
	}
	
	@RequestMapping(value="/getclass.do")
	@ResponseBody
    public void getclass(HttpServletResponse response,HttpServletRequest request) throws IOException{ 
        List<ClassDao> list = new ArrayList<ClassDao>(); 
        list = cla.getClassby();
        Map<String, Object> jsonMap = new HashMap<String, Object>();
        jsonMap.put("list", list);
        JSONObject result = JSONObject.fromObject(jsonMap);
//        String result = JSON.toJSONString(list);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(result.toString());
        writer.flush();
    }
	
	@RequestMapping(value="/{grade}getclass.do")
	@ResponseBody
    public void getclassmax(@PathVariable() Integer grade,HttpServletResponse response,HttpServletRequest request) throws Exception{ 
        Integer result = cla.getClassmax(grade);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(result.toString());
        writer.flush();
    }
}
