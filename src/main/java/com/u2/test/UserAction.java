package com.u2.test;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.web.SeedAction;

public class UserAction extends SeedAction{



	public String getUser() {
		// TODO Auto-generated method stub
		return "{data:1}";
	}
	
	public String getPageList() {
		// TODO Auto-generated method stub
		int page=Integer.valueOf(param("page")==null?"1":param("page"));
		int rows=Integer.valueOf(param("rows")==null?"10":param("rows"));
		
		List<Fruit_> list = MainCache.me().getFruitList(key);
		JSONArray array=new JSONArray();
		int f=(page-1)*rows;
		for(int i=f;i<(f+rows);i++){
			if(i>=list.size()){
				break;
			}
			Fruit_ fruit = list.get(i);
			array.add(fruit.getJsonObj());
		}
		
		JSONObject obj=new JSONObject();
		obj.put("total", list.size());
		obj.put("rows", array);
		return obj.toJSONString();
	}

}
