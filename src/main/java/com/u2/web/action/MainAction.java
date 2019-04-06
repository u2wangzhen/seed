package com.u2.web.action;

import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.MainCacheI;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TableManager;
import com.u2.web.SeedAction;

public class MainAction extends SeedAction{

	public String toMain(){
		
		return "/WEB-INF/page/main/main.jsp";
	}
	public String home(){
		
		return "/WEB-INF/page/main/home.jsp";
	}
	public String getAllFruit(){
		Set<String> set = TableManager.me().findAllFruitKey();
		JSONArray array=new JSONArray();
		for(String k:set){
			
			List<Fruit_> list = MainCache.me().getFruitList(k);
			if(list!=null&&!list.isEmpty()){
				for (Fruit_ f : list) {
					JSONObject obj=new JSONObject();
					obj.put("id", f.getId());
					obj.put("key", f.getKey());
					obj.put("jsonStr", f.getJsonObj().toJSONString());		
					array.add(obj);
				}
			}
		}
	
		
		return array.toJSONString();
	}
}
