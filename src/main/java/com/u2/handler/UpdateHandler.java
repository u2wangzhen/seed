package com.u2.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Seed;

public class UpdateHandler extends Handler{

	public UpdateHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		String id=param("id");
		if(id!=null&&!"".equals(id)){
				try {
					
					Fruit_ f = MainCache.me().getFruit( Long.valueOf(id));
					Map<String, Seed_> seeds = f.getSeeds();
					
					if (seeds!=null&&!seeds.isEmpty()){
						TransactionManager.get().open();
						Set<String> names = param.keySet();
						List<Long> other=null;
						for(String n:names){
							if("id".equals(n)){
								continue;
							}
							if(n.endsWith("_fid")){
								 String[] ss = param.get(n);
								 for (String k : ss) {
									if(k!=null&&!"".equals(k)){
										if(other==null){other=new ArrayList<Long>();}
										other.add(Long.valueOf(k));
									}
								}
							}else{
								if(seeds.get(n)!=null){
									if(!seeds.get(n).equalsValue(param.get(n)[0])){
										Seed newSeed=new Seed();
										newSeed.setId(seeds.get(n).getId());
										newSeed.setKey(seeds.get(n).getKey());
										newSeed.setValue(param.get(n)[0]);
										FruitHandler.me().updateSeed(f, newSeed);
									}
								}
								
							}
							
						}
						if(other!=null){
							FruitHandler.me().updateFruit(f,other);
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
