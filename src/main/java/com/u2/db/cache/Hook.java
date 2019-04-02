package com.u2.db.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.model.Relation;

public class Hook {
	
	private Map<Fruit_,List<Relation>> map=new HashMap<Fruit_,List<Relation>>();

	public void add(Fruit_ f_, List<Relation> rs) {
		// TODO Auto-generated method stub
		map.put(f_, rs);
	}

	public void free() {
		// TODO Auto-generated method stub
		Set<Fruit_> set = map.keySet();
		if(!set.isEmpty()){
			
			for (Fruit_ f : set) {
				List<Relation> list = map.get(f);
				
				for(Relation r:list){
					Fruit_ other = MainCache.me().getFruit(r.getOtherId());
					f.addOther(other);
				}
			}
		}
	}
	
	

}
