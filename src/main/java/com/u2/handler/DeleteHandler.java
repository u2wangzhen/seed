package com.u2.handler;

import java.util.Map;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TransactionManager;
import com.u2.web.SeedAction;

public class DeleteHandler extends Handler {

	public DeleteHandler(Map<String, String[]> param, String key, SeedAction action) {
		super(param, key,action);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
		String id=param("id");
		if(id!=null&&!"".equals(id)){
			//Fruit_ f = MainCache.me().getFruit(key, Long.valueOf(id));
			Fruit_ f = MainCache.me().getFruit( Long.valueOf(id));
			if(f.getCitedFruits()!=null&&!f.getCitedFruits().isEmpty()){
				return "{\"success\":"+false+",\"message\":\"删除失败，被引用！\"}";
			}else{
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
			
		}
		return "{\"success\":"+true+",\"message\":\"删除成功！\"}";
	}

}
