package com.u2.db.cache;

import java.util.HashMap;
import java.util.Map;

public class MainCache {
	private static MainCache mainCache=new MainCache();
	private MainCache(){
		cache=new HashMap<String,Fruit_>();
	};
	public static MainCache me(){
		return mainCache;
	}
	
	private Map<String,Fruit_> cache;
	
	public Fruit_ getFruit(String key){
		return cache.get(key);
	}
	
}
