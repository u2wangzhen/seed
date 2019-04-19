package com.u2.util;

import java.util.Set;

import com.u2.db.cache.Fruit_;

public class FruitUtil {

	public static Fruit_ index1(Set<Fruit_> set){
		if(set!=null&&!set.isEmpty()){
			for (Fruit_ fruit_ : set) {
				return fruit_;
			}
		}
		return null;
	}
}
