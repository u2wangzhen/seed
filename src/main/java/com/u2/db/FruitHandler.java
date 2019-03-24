package com.u2.db;

import java.sql.SQLException;
import java.util.List;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.data.BaseDao;
import com.u2.db.table.TableManager;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class FruitHandler {

	private static FruitHandler fruitHandler = new FruitHandler();

	private FruitHandler() {
	}

	public static FruitHandler me() {
		return fruitHandler;
	}

	public boolean insertFruit(Fruit f, List<Seed> seeds) throws SQLException {

		boolean b = true;
		b &= BaseDao.me().insertFruit(f);
		if (seeds != null && !seeds.isEmpty()) {
			for (Seed seed : seeds) {
				seed.setFid(f.getId());
				int l = TableManager.me().findLength(f.getKey(), seed.getKey());
				b &= BaseDao.me().insertSeed(seed, l);
			}
		}
		MainCache.me().addFruit(f);

		return b;
	}

	public boolean updateSeed(Fruit f, Seed newSeed) throws SQLException {
		boolean b = true;

		Fruit_ f_ = MainCache.me().getFruit(f.getKey(), f.getId());
		Seed_ s_ = f_.getSeed(newSeed.getKey());
		int l = TableManager.me().findLength(f_.getKey(), s_.getKey());
		b &= BaseDao.me().updateSeed(s_.getId(), newSeed.getValue(), l);
		if (b) {
			s_.setValue(newSeed.getValue());
		}

		return b;
	}

	public boolean deleteFruit(Fruit f) throws SQLException {
		boolean b = true;

		b &= BaseDao.me().deleteFruit(f);
		Fruit_ f_ = MainCache.me().getFruit(f.getKey(), f.getId());
		MainCache.me().getFruitList(f.getKey()).remove(f_);
		MainCache.me().getFruitMAP(f.getKey()).remove(f.getId());
		f_ = null;

		return b;
	}

}
