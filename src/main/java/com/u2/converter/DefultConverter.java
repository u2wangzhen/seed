package com.u2.converter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class DefultConverter extends Converter{

	public DefultConverter(String key) {
		super(key);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void form2Fruit() {
		// TODO Auto-generated method stub
		if(param!=null&&!param.isEmpty()){
			
			Set<String> set = param.keySet();
			
			for (String k : set) {
				if(k.equals("id")){
					String id = param.get(k)[0];
					if(id!=null&&!"".equals(id)){
						this.fruit=MainCache.me().getFruit(Long.valueOf(id));
					}
				}else if(k.endsWith("_fid")){
					
					String otherkey=k.split("_fid")[0];
					
					if(other_map==null){other_map=new HashMap<String, List<Long>>();}
					List<Long> l = other_map.get(otherkey);
					if(l==null){l=new ArrayList<Long>();other_map.put(otherkey, l);}
					
					String[] ss = param.get(k);
					 for (String s : ss) {
						if(s!=null&&!"".equals(s)){
							if(others==null){others=new ArrayList<Long>();}
							Long otherId=0L;
							if(s!=null&&!s.equals("")){
								otherId=Long.valueOf(s);
							}
							others.add(otherId);
							l.add(otherId);
						}
					}
				}else{
					if(seeds==null){seeds=new ArrayList<Seed>();}
					Seed s = new Seed(k,param.get(k));
					seeds.add(s);
				}
			}
			if(fruit==null){
				fruit=new Fruit(key);
			}
		}
	}

	@Override
	public JSONObject fruit2Form(Fruit_ f) {
		// TODO Auto-generated method stub
		JSONObject obj = (JSONObject) f.getJsonObj().clone();
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
		return obj;
	}	
}
