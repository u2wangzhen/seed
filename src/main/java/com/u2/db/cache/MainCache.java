package com.u2.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.CubeI;
import com.u2.db.MainCacheI;
import com.u2.db.data.BaseDao;
import com.u2.db.manager.TableManager;
import com.u2.model.Fruit;
import com.u2.model.Relation;
import com.u2.model.Seed;
import com.u2.sys.SeedConfig;

public class MainCache implements MainCacheI {
	private static MainCache mainCache = new MainCache();

	private MainCache() {
	};

	private CubeI cubel = new Cube();

	public static MainCacheI me() {
		return mainCache;
	}

	public void init() {
		try {
			List<Fruit> fs= BaseDao.me().selectAllFruit();
			Hook hook=new Hook();
			if (fs != null && !fs.isEmpty()) {
				for (Fruit f : fs) {
					Fruit_ f_ = new Fruit_(f);
					cubel.add(f_);
					addSeeds(f_);
					List<Relation> rs = BaseDao.me().selectRelation(f.getId());
					if(rs!=null){
						hook.add(f_,rs);
					}
				}
			}
			hook.free();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void addSeeds(Fruit_ f) throws NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		Set<Integer> set = TableManager.me().findSeedsLength(f.getKey());
		for (Integer i : set) {
			List<Seed> list = BaseDao.me().selectSeeds(f.getId(),i);
			addSeeds(f,list);
		}
	}

	private void addSeeds(Fruit_ f, List<Seed> list) {
		// TODO Auto-generated method stub
		if(list!=null&&!list.isEmpty()){
			for (Seed s : list) {
				Seed_ s_=new Seed_(s);
				s_.setFruit(f);
				f.addSeed(s_);
			}
		}
	}

	public void delFruit(Fruit_ f) {
		// TODO Auto-generated method stub
		f.delRelation();
		cubel.remove(f.getId());
	}

	public void addFruit(Fruit f) throws NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		Fruit_ f_ = new Fruit_(f);
		cubel.add(f_);
		addSeeds(f_);
		buildRelation(f_);
	}

	private void buildRelation(Fruit_ f) throws SQLException {
		// TODO Auto-generated method stub
		List<Relation> rs = BaseDao.me().selectRelation(f.getId());
		if(rs!=null){
			for(Relation r:rs){
				Fruit_ other = MainCache.me().getFruit(r.getOtherId());
				f.addOther(other);
			}
		}
	}

	public List<Fruit_> getFruitList(String key) {
		// TODO Auto-generated method stub
		return cubel.getFruitsAsc(key);
	}
	
	public List<Fruit_> getFruitListDesc(String key) {
		// TODO Auto-generated method stub
		return cubel.getFruitsDesc(key);
	}

	public Fruit_ getFruit(Long id) {
		// TODO Auto-generated method stub
		return cubel.get(id);
	}

	public void refRelation(Fruit_ f) throws SQLException {
		// TODO Auto-generated method stub
		f.delRelation();
		buildRelation(f);
	}

}
