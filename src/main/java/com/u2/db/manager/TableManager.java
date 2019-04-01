package com.u2.db.manager;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.TableManagerI;
import com.u2.db.data.BaseDao;

public class TableManager implements TableManagerI{

	private static TableManagerI tableManager = new TableManager();

	private TableManager() {};

	public static TableManagerI me() {
		return tableManager;
	}

	private Map<String, FruitTemplate> map = new HashMap<String, FruitTemplate>();

	private Map<String, Set<String>> map_skey_set = new HashMap<String, Set<String>>();
	
	private Map<String, Set<Integer>> map_slength_set = new HashMap<String, Set<Integer>>();

	private Set<Integer> exist = new HashSet<Integer>();
	
	

	public int findLength(String fkey, String skey) {
		
		return 0;
	}

	public Set<Integer> findSeedsLength(String fkey){
		
		return null;
	}
	
	public Set<String> findSeedskey(String fkey){
		
		return map_skey_set.get(fkey);
	}

	

	public void init() {
		try {
			initFruitTable();
			initFruitTemplate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void initFruitTemplate() {
		// TODO Auto-generated method stub
		map.put("user", new FruitTemplate("user").add(new SeedTemplate("name", 8))
												.add(new SeedTemplate("age", 2))
												.add(new SeedTemplate("password", 16)));
		
		
	}

	private void initFruitTable() throws SQLException {
		// TODO Auto-generated method stub
		if (!BaseDao.me().isExist("t_fruit")) {
			BaseDao.me().createFruitTable();
		}
	}
	private synchronized void isExist(int length) throws SQLException {
		// TODO Auto-generated method stub
		if (!exist.contains(length)) {
			boolean b = BaseDao.me().isExist("t_seed_" + length);
			if (!b) {
				BaseDao.me().createSeedTable(length);
			}
			exist.add(length);
		}

	}

	private class FruitTemplate{
		String key;
		Set<SeedTemplate> seeds;
		FruitTemplate(String key){
			this.key=key;
			this.seeds=new HashSet<SeedTemplate>();
		}
		FruitTemplate add(SeedTemplate s){
			this.seeds.add(s);
			return this;
		}
	}
	private class SeedTemplate{
		String key;
		Integer length; 
		SeedTemplate(String key,Integer length){
			this.key=key;
			this.length=length;
		}
	}
}
