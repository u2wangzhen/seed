package com.u2.web;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;

public class SysAction extends SeedAction{

	public String getAll(){
		String str="";
		JSONArray array=new JSONArray();
		List<Fruit_> list = MainCache.me().getFruitList(key);
		//List<Map<String,String>> ll=new ArrayList<Map<String,String>>();
		for (Fruit_ f : list) {
			array.add(f.getJsonObj());
		}
		str=array.toJSONString();
		return str;
	}
}
