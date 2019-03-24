package com.u2.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;

public class SysAction extends SeedAction{

	
	public String toAdd(){
		return "/sys/add.jsp";
	}
	public String toList(){
		return "/sys/list.jsp";
	}
	public String getAll(){
		String str="";
		
		
		JSONArray array=new JSONArray();
		List<Fruit_> list = MainCache.me().getFruitList(key);
		//List<Map<String,String>> ll=new ArrayList<Map<String,String>>();
		for (Fruit_ f : list) {
			JSONObject obj=new JSONObject();
			obj.put("id", f.getId().toString());
			List<Seed_> ss = f.getSeeds();
			if(ss!=null&&!ss.isEmpty()){
				for (Seed_ s : ss) {
					obj.put(s.getKey(), s.getValue());
				}
			}
			array.add(obj);
			
		}
		//array.containsAll(ll);
		str=array.toJSONString();
		return str;
	}
}
