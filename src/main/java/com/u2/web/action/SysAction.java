package com.u2.web.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.sys.SeedConfig;
import com.u2.web.SeedAction;

public class SysAction extends SeedAction{

	public String getfkeys(){
		JSONArray array=new JSONArray();
		
		List<Fruit_> list = MainCache.me().getFruitList(key);
		if(list!=null&&!list.isEmpty()){
			Set<String> set=new HashSet<String>();
			for (Fruit_ f : list) {
				String fkey=f.getSeed(SeedConfig.SYS_FKEY).getValue();
				if(!set.contains(fkey)){
					array.add(f.getJsonObj());
					set.add(fkey);
				}
			}
			
		}
		return array.toJSONString();
	}
}
