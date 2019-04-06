package com.u2.handler;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;

public class PageHandler extends SearchHandler {

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
		
		if(search!=null){
			list=filterFruit(list);
		}
		JSONArray array=new JSONArray();
		int size=0;
		if(list!=null&&!list.isEmpty()){
			size=list.size();
			int f=(page-1)*rows;
			for(int i=f;i<(f+rows);i++){
				if(i>=list.size()){
					break;
				}
				Fruit_ fruit = list.get(i);
				JSONObject obj = (JSONObject) (fruit.getJsonObj()).clone();
				
				Map<String, Set<Fruit_>> ofm = fruit.getOtherFruits();
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
		JSONObject obj=new JSONObject();
		obj.put("total", size);
		obj.put("rows", array);
		return obj.toJSONString();
	}

}
