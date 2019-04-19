package com.u2.sys;

import java.util.HashMap;
import java.util.Map;

import com.u2.other.action.TotalAction;
import com.u2.web.action.MainAction;
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
		map.put("main", MainAction.class);
		map.put("total", TotalAction.class);
	}
}
