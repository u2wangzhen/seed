package com.u2.db.init;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TransactionManager;
import com.u2.handler.FruitHandler;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class InitData {
	private InitData(){}
	private static InitData me=new InitData();
	public static InitData me(){return me;}
	
	
	public void init() throws SQLException{
		
		List<Long> other=new ArrayList<Long>();
		
		
		TransactionManager.get().open();
		Fruit menu=new Fruit("menu");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", "系统"));
		FruitHandler.me().insertFruit(menu, m_s, null);
		
		TransactionManager.get().commit();
		
		
		List<Fruit_> ms = MainCache.me().getFruitList("menu");
		for (Fruit_ ff : ms) {
			other.add(ff.getId());
		}
		
		
		TransactionManager.get().open();
		
		Fruit f1=new Fruit("model");
		List<Seed> s1=new ArrayList<Seed>();
		s1.add(new Seed("name", "账号"));
		s1.add(new Seed("path", "/account"));
		FruitHandler.me().insertFruit(f1, s1, other);
		
		Fruit f2=new Fruit("model");
		List<Seed> s2=new ArrayList<Seed>();
		s2.add(new Seed("name", "角色"));
		s2.add(new Seed("path", "/role"));
		FruitHandler.me().insertFruit(f2, s2, other);
		
		
		Fruit f3=new Fruit("model");
		List<Seed> s3=new ArrayList<Seed>();
		s3.add(new Seed("name", "菜单"));
		s3.add(new Seed("path", "/menu"));
		FruitHandler.me().insertFruit(f3, s3, other);
		
		Fruit f4=new Fruit("model");
		List<Seed> s4=new ArrayList<Seed>();
		s4.add(new Seed("name", "模块"));
		s4.add(new Seed("path", "/model"));
		FruitHandler.me().insertFruit(f4, s4, other);
		
		
		Fruit f5=new Fruit("model");
		List<Seed> s5=new ArrayList<Seed>();
		s5.add(new Seed("name", "数据"));
		s5.add(new Seed("path", "/fruit"));
		FruitHandler.me().insertFruit(f5, s5, other);
		
		TransactionManager.get().commit();
		
		
		
		
		
		
	}
	
}
