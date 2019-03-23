package com.u2.db;

import java.sql.SQLException;
import java.util.List;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.data.BaseDao;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class FruitHandler {
	
	private static FruitHandler fruitHandler=new FruitHandler();
	private FruitHandler(){}
	public static FruitHandler me(){return fruitHandler;}

	public boolean insertFruit(Fruit f, List<Seed> seeds) {

		boolean b = true;
		try {
			b &= BaseDao.me().insertFruit(f);
			if (seeds != null && !seeds.isEmpty()) {
				for (Seed seed : seeds) {
					seed.setFid(f.getId());
					b &= BaseDao.me().insertSeed(seed);
				}
			}
			MainCache.me().addFruit(f);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			b = false;
			e.printStackTrace();
		}
		return b;
	}
	
	public boolean updateSeed(Fruit f,Seed newSeed){
		boolean b=true;
		
		Fruit_ f_ = MainCache.me().getFruit(f.getKey(), f.getId());
		Seed_ s_=f_.getSeed(newSeed.getKey());
		try {
			b&=BaseDao.me().updateSeed(s_.getId(),newSeed.getValue());
			if(b){
				s_.setValue(newSeed.getValue());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	public boolean deleteFruit(Fruit f){
		boolean b=true;
		try {
			b&=BaseDao.me().deleteFruit(f);
			Fruit_ f_ = MainCache.me().getFruit(f.getKey(), f.getId());
			MainCache.me().getFruitList(f.getKey()).remove(f_);
			MainCache.me().getFruitMAP(f.getKey()).remove(f.getId());
			f_=null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

}
