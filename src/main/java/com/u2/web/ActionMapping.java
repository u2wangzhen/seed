package com.u2.web;

import java.util.HashMap;
import java.util.Map;

import com.u2.test.UserAction;

public class ActionMapping{

	private static ActionMapping am=new ActionMapping();
	private ActionMapping(){init();}
	public static ActionMapping me(){return am;}
	private Map<String,Class<?>> map=new HashMap<String,Class<?>>();
	public Class<?> getActionClass(String key){
		return map.get(key);
	}
	
	private void init() {
		// TODO Auto-generated method stub
		//map.put("test", UserAction.class);
		///map.put("index", IndexAction.class);
		map.put("user", UserAction.class);
		map.put("sysconf", SysAction.class);
		map.put("main", MainAction.class);
	}
}
