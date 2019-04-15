package com.u2.other.handler;

import java.util.Map;

import com.u2.handler.AddHandler;
import com.u2.web.SeedAction;

public class StudentAddHandler extends AddHandler{


	public StudentAddHandler(Map<String, String[]> param, String key, SeedAction action) {
		super(param, key, action);
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		System.out.println("hello handler");
		return "{\"success\":"+true+",\"message\":\"保存成功！\"}";
	}

}
