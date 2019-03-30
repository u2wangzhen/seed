package com.u2.web.action;

import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.web.SeedAction;

public class DefaultAction extends SeedAction{

	public String toAdd(){
		return "add.jsp";
	}
	public String toEdit(){
		String id=param("id");
		if(id!=null&&!"".equals(id)){
			Fruit_ f = MainCache.me().getFruit(key,Long.valueOf(id));
			JSONObject obj = f.getJsonObj();
			Set<String> set = obj.keySet();
			for (String seedKey : set) {
				request.setAttribute(seedKey, obj.get(seedKey));
			}
		}
		return "edit.jsp";
	}
}
