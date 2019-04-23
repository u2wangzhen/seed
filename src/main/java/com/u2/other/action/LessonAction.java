package com.u2.other.action;

import java.sql.SQLException;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.manager.TransactionManager;
import com.u2.handler.FruitHandler;
import com.u2.model.Seed;
import com.u2.util.FruitUtil;
import com.u2.web.SeedAction;

public class LessonAction extends SeedAction {
	
	public String end(){
		boolean b=false;
		String id=param("id");
		if(id!=null&&!id.equals("")){
			try {
			TransactionManager.get().open();
			Fruit_ f = MainCache.me().getFruit(Long.valueOf(id));
			Seed_ end = f.getSeed("end");
			if(end==null){
				Seed s=new Seed("end","1");
				FruitHandler.me().insertSeed(s,f);
				Seed_ ss = new Seed_(s);
				ss.setFruit(f);
				f.addSeed(ss);
			}else{
				FruitHandler.me().updateSeed(f, new Seed("end", "1"));
			}
			b=true;
			TransactionManager.get().commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				TransactionManager.get().rollback();
			}finally {
				TransactionManager.get().close();
			}
		}
		return FruitUtil.outMassage(b);
	}

}
