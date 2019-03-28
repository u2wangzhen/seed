package com.u2.web.handler;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;

public class GetAllHandler extends Handler {

	public GetAllHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		JSONArray array=new JSONArray();
		List<Fruit_> list = MainCache.me().getFruitList(key);
		for (Fruit_ f : list) {
			array.add(f.getJsonObj());
		}
		return array.toJSONString();
	}

}
