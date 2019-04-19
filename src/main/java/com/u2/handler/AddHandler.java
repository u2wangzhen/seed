package com.u2.handler;
import java.util.Map;

import com.u2.converter.Converter;
import com.u2.converter.ConverterFactory;
import com.u2.db.manager.TransactionManager;
import com.u2.web.SeedAction;

public class AddHandler extends Handler{

	

	public AddHandler(Map<String, String[]> param, String key, SeedAction action) {
		// TODO Auto-generated constructor stub
		super(param, key,action);
	}

	@Override
	public String exec() {
		// TODO Auto-generated method stub
			try {
				TransactionManager.get().open();
				Converter c = ConverterFactory.me().converter(key).form2Fruit(param);
				FruitHandler.me().insertFruit(c.getFruit(), c.getSeeds(),c.getOthers());
				TransactionManager.get().commit();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				TransactionManager.get().rollback();
			}finally {
				TransactionManager.get().close();
			}
		
		
		return "{\"success\":"+true+",\"message\":\"保存成功！\"}";
	}
}
