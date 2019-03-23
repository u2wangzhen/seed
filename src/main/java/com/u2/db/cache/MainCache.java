package com.u2.db.cache;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.u2.db.data.BaseDao;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class MainCache {
	private static MainCache mainCache=new MainCache();
	private MainCache(){
		cache_map=new HashMap<String,Map<Long,Fruit_>>();
		cache_list=new HashMap<String, List<Fruit_>>();
		init();
	};
	private void init() {
		// TODO Auto-generated method stub
		try {
			List<Fruit> fs = BaseDao.me().selectAllFruit();
			for (Fruit f : fs) {
				Fruit_ f_ = new Fruit_(f);
				initCacheMap(f_);
				initList(f_);
				initSeeds(f_);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void initSeeds(Fruit_ f) throws SQLException {
		// TODO Auto-generated method stub
		List<Seed> list = BaseDao.me().selectSeeds(f.getId());
		if(list!=null&&!list.isEmpty()){
			List<Seed_> seeds=new ArrayList<Seed_>();
			for (Seed s : list) {
				Seed_ s_=new Seed_(s);
				s_.setFruit(f);
				f.addSeed(s_);
				if(s.getKey().endsWith("_fid")){
					Long otherFid = Long.valueOf(s.getValue());
					String otherKey=s.getKey().substring(0, s.getKey().indexOf("_"));
					Fruit_ otherFruit = cache_map.get(otherKey).get(otherFid);
					f.addFruit(otherFruit);
				}
				seeds.add(s_);
			}
			f.setSeeds(seeds);
		}
	}
	private void initList(Fruit_ f) {
		// TODO Auto-generated method stub
		List<Fruit_> list = cache_list.get(f.getKey());
		if(list==null){list=new ArrayList<Fruit_>();
		cache_list.put(f.getKey(), list);
		}
		list.add(f);
	}
	private void initCacheMap(Fruit_ f) {
		// TODO Auto-generated method stub
		Map<Long, Fruit_> map = cache_map.get(f.getKey());
		if(map==null){
			map=new HashMap<Long, Fruit_>();
			cache_map.put(f.getKey(), map);
		}
		map.put(f.getId(), f);
	}
	public static MainCache me(){
		return mainCache;
	}
	
	private Map<String,Map<Long,Fruit_>> cache_map;
	private Map<String,List<Fruit_>> cache_list;
	
	public List<Fruit_> getFruitList(String key){
		return cache_list.get(key);
	}
	
	public Map<Long,Fruit_> getFruitMAP(String key){
		return cache_map.get(key);
	}
	
	public Fruit_ getFruit(String key,Long id){
		return cache_map.get(key).get(id);
	}
	public void addFruit(Fruit f) throws SQLException {
		// TODO Auto-generated method stub
		Fruit_ f_ = new Fruit_(f);
		initCacheMap(f_);
		initList(f_);
		initSeeds(f_);
	}
	
}
