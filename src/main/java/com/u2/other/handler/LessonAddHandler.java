package com.u2.other.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.manager.TransactionManager;
import com.u2.handler.AddHandler;
import com.u2.handler.FruitHandler;
import com.u2.model.Fruit;
import com.u2.model.Seed;
import com.u2.web.SeedAction;

public class LessonAddHandler extends AddHandler{

	public LessonAddHandler(Map<String, String[]> param, String key, SeedAction action) {
		super(param, key, action);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String exec() {
		// TODO Auto-generated method stub
		Set<String> names = param.keySet();
		if(names!=null&&!names.isEmpty()){
			List<Seed> seeds=new ArrayList<Seed>();
			List<Long> other=null;
			List<Long> stu=null;
			for (String n : names) {
				
				
				if(n.endsWith("_fid")){
					if(n.startsWith("student")){
						 String[] ss = param.get(n);
						 for (String k : ss) {
							if(k!=null&&!"".equals(k)){
								if(stu==null){stu=new ArrayList<Long>();}
								stu.add(Long.valueOf(k));
							}
						}
					}
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
				if(stu!=null){
					for (Long sid : stu) {
						Fruit pf = new Fruit("price");
						List<Long> oth=new ArrayList<Long>();
						List<Seed> ps=new ArrayList<Seed>();
						ps.add(new Seed("price", "0"));
						ps.add(new Seed("remark", ""));
						oth.add(f.getId());
						oth.add(sid);
						FruitHandler.me().insertFruit(pf, ps, oth);
					}
				}
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
