package com.u2.web.handler;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;

public class PageHandler extends Handler {

	public PageHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
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
