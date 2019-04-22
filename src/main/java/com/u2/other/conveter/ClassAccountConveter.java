package com.u2.other.conveter;

import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.u2.converter.DefaultConverter;
import com.u2.db.cache.Fruit_;

public class ClassAccountConveter extends DefaultConverter{

	public ClassAccountConveter(String key) {
		super(key);
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public JSONObject fruit2Form(Fruit_ f) {
		// TODO Auto-generated method stub
		JSONObject obj = super.fruit2Form(f);
		
		Set<Fruit_> set = f.getCitedFruits("recharge");
		double i=0;
		if(set!=null&&!set.isEmpty()){
			for (Fruit_ t : set) {
				i+=Double.valueOf(t.getSeed("times").getValue());
			}
		}
		double j=0;
		Set<Fruit_> ss = f.getOtherFruits("student");
		Fruit_ stu=null;
		for (Fruit_ s : ss) {
			stu=s;
		}
		
		Set<Fruit_> ts = f.getOtherFruits("lesson");
		
		
		Set<Fruit_> ps = stu.getCitedFruits("period");
		for (Fruit_ p : ps) {
			Set<Fruit_> pl = p.getOtherFruits("lesson");
			Fruit_ les=null;
			for (Fruit_ s : pl) {
				les=s;
			}
			if(ts.contains(les)){
				j+=Double.valueOf(p.getSeed("phour").getValue());
			}
		}
		
		obj.put("rest", i-j);
		return obj;
	}

}
