package com.u2.web.handler;
import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import com.u2.db.FruitHandler;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class AddHandler extends Handler{

	public AddHandler(Map<String, String[]> param, String key) {
		super(param, key);
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		Set<String> names = param.keySet();
		if(names!=null&&!names.isEmpty()){
			List<Seed> seeds=new ArrayList<Seed>();
			for (String n : names) {
				Seed s = new Seed(n,param.get(n)[0]);
				seeds.add(s);
			}
			try {
				TransactionManager.get().open();
				FruitHandler.me().insertFruit(new Fruit(key), seeds);
				TransactionManager.get().commit();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				TransactionManager.get().rollback();
			}finally {
				TransactionManager.get().close();
			}
		}
		
		return "ok";
	}
}
