package com.u2.web.handler;

import java.util.Map;

public abstract class Handler {

	protected Map<String,String[]> param;
	protected String key;
	
	public Handler(Map<String, String[]> param, String key) {
		this.param = param;
		this.key = key;
	}

	public abstract String exec();
}
