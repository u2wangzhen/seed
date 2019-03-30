package com.u2.web.handler;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;

public class GetAllHandler extends SearchHandler {

	public GetAllHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		JSONArray array=new JSONArray();
		List<Fruit_> list = MainCache.me().getFruitList(key);
		
		if(search!=null){
			list=filterFruit(list);
		}
		if(list!=null&&!list.isEmpty()){
			for (Fruit_ f : list) {
				array.add(f.getJsonObj());
			}
		}
		
		return array.toJSONString();
	}

}
