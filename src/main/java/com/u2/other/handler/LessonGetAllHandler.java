package com.u2.other.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TransactionManager;
import com.u2.handler.FruitHandler;
import com.u2.handler.GetAllHandler;
import com.u2.model.Fruit;
import com.u2.model.Seed;
import com.u2.web.SeedAction;

public class LessonGetAllHandler extends GetAllHandler{

	public LessonGetAllHandler(Map<String, String[]> param, String key, SeedAction action) {
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
				
				JSONObject obj = (JSONObject) (f.getJsonObj()).clone();
				
				Map<String, Set<Fruit_>> ofm = f.getOtherFruits();
				if(ofm!=null&&!ofm.isEmpty()){
					Set<String> set = ofm.keySet();
					for (String key : set) {
						Set<Fruit_> s = ofm.get(key);
						if(s!=null&&!s.isEmpty()){
							JSONArray l=new JSONArray();
							for (Fruit_ ff : s) {
								l.add(ff.getJsonObj().clone());
							}
							obj.put(key+"_s", l);
						}
					}
				}
				array.add(obj);
			}
		}
		return array.toJSONString();
	}

}
