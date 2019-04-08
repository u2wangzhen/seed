package com.u2.handler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.Seed_;
import com.u2.db.data.BaseDao;
import com.u2.db.manager.TableManager;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Relation;
import com.u2.model.Seed;

public class FruitHandler {

	private static FruitHandler fruitHandler = new FruitHandler();

	private FruitHandler() {
	}

	public static FruitHandler me() {
		return fruitHandler;
	}

	public boolean insertFruit(Fruit f, List<Seed> seeds,List<Long> other) throws SQLException {

		boolean b = true;
		BaseDao.me().insertFruit(f);
		if (seeds != null && !seeds.isEmpty()) {
			for (Seed seed : seeds) {
				seed.setFid(f.getId());
				int l = TableManager.me().findLength(f.getKey(), seed.getKey());
				BaseDao.me().insertSeed(seed, l);
			}
		}
		if(other!=null){
			for (Long oid : other) {
				BaseDao.me().insertRelation(new Relation(f.getId(), oid));
			}
		}
		TransactionManager.getFruitlistlocal().push(f);
		return b;
	}

	public boolean updateSeed(Fruit_ f_, Seed newSeed) throws SQLException {
		boolean b = true;

		// Fruit_ f_ = MainCache.me().getFruit(f.getKey(), f.getId());
		Seed_ s_ = f_.getSeed(newSeed.getKey());
		int l = TableManager.me().findLength(f_.getKey(), s_.getKey());
		BaseDao.me().updateSeed(s_.getId(), newSeed.getValue(), l);

		TransactionManager.pushSeed(s_, newSeed.getValue());

		return b;
	}

	public synchronized boolean deleteFruit(Fruit_ f) throws SQLException {
		boolean b = true;
		BaseDao.me().deleteRelation(f.getId());
		Set<Integer> ls = TableManager.me().findSeedsLength(f.getKey());
		for (Integer l : ls) {
			BaseDao.me().deleteSeed(f.getId(), l);
		}

		BaseDao.me().deleteFruit(f.getId());

		TransactionManager.pushDel(f);
		return b;
	}

	public void updateFruit(Fruit_ f, List<Long> other) throws SQLException {
		// TODO Auto-generated method stub
		BaseDao.me().deleteRelation(f.getId());
		for (Long otherId : other) {
			BaseDao.me().insertRelation(new Relation(f.getId(), otherId));
		}
		TransactionManager.getRelationlocal().push(f);
	}

}
