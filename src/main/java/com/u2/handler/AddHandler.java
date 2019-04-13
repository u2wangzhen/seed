package com.u2.handler;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Seed;
import com.u2.web.SeedAction;

public class AddHandler extends Handler{

	

	public AddHandler(Map<String, String[]> param, String key, SeedAction action) {
		// TODO Auto-generated constructor stub
		super(param, key,action);
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		Set<String> names = param.keySet();
		if(names!=null&&!names.isEmpty()){
			List<Seed> seeds=new ArrayList<Seed>();
			List<Long> other=null;
			for (String n : names) {
				if(n.endsWith("_fid")){
					 String[] ss = param.get(n);
					 for (String k : ss) {
						if(k!=null&&!"".equals(k)){
							if(other==null){other=new ArrayList<Long>();}
							other.add(Long.valueOf(k));
						}
					}
				}else{
					Seed s = new Seed(n,param.get(n));
					seeds.add(s);
				}
			}
			try {
				TransactionManager.get().open();
				Fruit f = new Fruit(key);
				action.beforeAdd(seeds);
				FruitHandler.me().insertFruit(f, seeds,other);
				TransactionManager.get().commit();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				TransactionManager.get().rollback();
			}finally {
				TransactionManager.get().close();
			}
		}
		
		return "{\"success\":"+true+",\"message\":\"保存成功！\"}";
	}
}
