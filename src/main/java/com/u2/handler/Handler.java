package com.u2.handler;

import java.util.Map;

import com.u2.web.SeedAction;

abstract class Handler {

	protected Map<String,String[]> param;
	protected String key;
	protected SeedAction action;
	
	public Handler(Map<String, String[]> param, String key) {
		this(param,key,null);
	}
	public Handler(Map<String, String[]> param, String key,SeedAction action) {
		this.param = param;
		this.key = key;
		this.action=action;
	}

	protected String param(String key){
		if(param!=null&&!param.isEmpty()){
			String[] p = param.get(key);
			if(p!=null&&p.length>0){
				return p[0];
			}
		}
		return null;
	}
	public abstract String exec();
}
