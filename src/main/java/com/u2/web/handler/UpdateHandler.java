package com.u2.web.handler;

import java.util.List;
import java.util.Map;

import com.u2.db.FruitHandler;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class UpdateHandler extends Handler{

	public UpdateHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		String id=param.get("id")[0];
		if(id!=null&&!"".equals(id)){
				try {
					
					Fruit_ f = MainCache.me().getFruit(key, Long.valueOf(id));
					
					List<Seed_> seeds = f.getSeeds();
					
					
					if(seeds!=null&&!seeds.isEmpty()){
						TransactionManager.get().open();
						for (Seed_ s : seeds) {
							if(!s.equalsValue(param.get(s.getKey())[0])){
								Seed newSeed=new Seed();
								newSeed.setId(s.getId());
								newSeed.setKey(s.getKey());
								newSeed.setValue(param.get(s.getKey())[0]);
								FruitHandler.me().updateSeed(f, newSeed);
							}
						}
						TransactionManager.get().commit();
					}

				} catch (Exception e) {
					// TODO Auto-generated catch block
					TransactionManager.get().rollback();
				}finally {
					TransactionManager.get().close();
				}
		}
		
		
		return "{\"success\":"+true+",\"message\":\"保存成功！\"}";
	}

}
