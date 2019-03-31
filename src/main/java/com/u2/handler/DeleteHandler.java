package com.u2.handler;

import java.util.Map;

import com.u2.db.FruitHandler;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TransactionManager;

public class DeleteHandler extends Handler {

	public DeleteHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		String id=param("id");
		if(id!=null&&!"".equals(id)){
			Fruit_ f = MainCache.me().getFruit(key, Long.valueOf(id));
			try {
				TransactionManager.get().open();
				FruitHandler.me().deleteFruit(f);
				TransactionManager.get().commit();
			}catch (Exception e) {
				// TODO Auto-generated catch block
				TransactionManager.get().rollback();
			}finally {
				TransactionManager.get().close();
			}
		}
		return "{\"success\":"+true+",\"message\":\"删除成功！\"}";
	}

}
