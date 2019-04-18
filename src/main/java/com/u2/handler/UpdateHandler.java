package com.u2.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.converter.Converter;
import com.u2.converter.ConverterFactory;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Seed;
import com.u2.web.SeedAction;

public class UpdateHandler extends Handler{

	public UpdateHandler(Map<String, String[]> param, String key, SeedAction action) {
		super(param, key,action);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		String id=param("id");
		if(id!=null&&!"".equals(id)){
				try {
					Converter c = ConverterFactory.me().converter(key).form2Fruit(param);
					//Fruit_ f = MainCache.me().getFruit( Long.valueOf(id));
					Fruit_ f=(Fruit_) c.getFruit();
					Map<String, Seed_> seeds = f.getSeeds();
					
					if (seeds!=null&&!seeds.isEmpty()){
						TransactionManager.get().open();
						//Set<String> names = param.keySet();
						//List<Long> other=null;
						List<Seed> ps = c.getSeeds();
						for(Seed s:ps){
							/*if("id".equals(n)){
								continue;
							}*/
							/*if(n.endsWith("_fid")){
								 String[] ss = param.get(n);
								 for (String k : ss) {
									if(k!=null&&!"".equals(k)){
										if(other==null){other=new ArrayList<Long>();}
										other.add(Long.valueOf(k));
									}
								}
							}else{*/
								if(seeds.get(s.getKey())!=null){
									if(!seeds.get(s.getKey()).equalsValue(s.getValue())){
										s.setId(seeds.get(s.getKey()).getId());
										FruitHandler.me().updateSeed(f, s);
									}
								}
								
							//}
							
						}
						if(c.getOthers()!=null){
							FruitHandler.me().updateFruit(f,c.getOthers());
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
