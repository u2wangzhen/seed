package com.u2.web.handler;

import java.util.Map;

public abstract class Handler {

	protected Map<String,String[]> param;
	protected String key;
	
	public Handler(Map<String, String[]> param, String key) {
		this.param = param;
		this.key = key;
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
