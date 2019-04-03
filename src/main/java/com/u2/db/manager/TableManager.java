package com.u2.db.manager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.TableManagerI;
import com.u2.db.data.BaseDao;

public class TableManager implements TableManagerI{
	
	
	private void initFruitTemplate() {
		// TODO Auto-generated method stub
		map.put("user", new FruitTemplate().add(new SeedTemplate("name", 8))
												.add(new SeedTemplate("age", 2))
												.add(new SeedTemplate("password", 16)));
		
		map.put("student", new FruitTemplate()
												.add(new SeedTemplate("name", 16,true))
												.add(new SeedTemplate("sex", 2,true))
												.add(new SeedTemplate("school", 64))
												.add(new SeedTemplate("remark", 255))
												.add(new SeedTemplate("createTime", 16)));
		map.put("lesson", new FruitTemplate().add(new SeedTemplate("name", 64,true))
												.add(new SeedTemplate("subject", 8,true))
												.add(new SeedTemplate("grade", 4,true))
												.add(new SeedTemplate("createTime", 16))
												);
		
		
	}
	private void initRelation(){
		
		buildRelation("user","student");
	}

	private static TableManagerI tableManager = new TableManager();

	private TableManager() {};

	public static TableManagerI me() {
		return tableManager;
	}

	private Map<String, FruitTemplate> map = new HashMap<String, FruitTemplate>();
	private Map<String,Set<String>> relation_map=new HashMap<String, Set<String>>();
	private Set<Integer> exist = new HashSet<Integer>();
	
	private void buildRelation(String mainKey, String otherKey){
		Set<String> set = relation_map.get(mainKey);
		if(set==null){set=new HashSet<String>();relation_map.put(mainKey, set);}
		set.add(otherKey);
	}

	public int findLength(String fkey, String skey) {
		
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.sk_sl.get(skey);
	}

	public Set<Integer> findSeedsLength(String fkey){
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.lengths;
	}
	
	public Set<String> findSeedskey(String fkey){
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.sk_sl.keySet();
	}
	public Set<String> findSearchSeedKeys(String fkey) {
		// TODO Auto-generated method stub
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.searchKeys;
	}
	
	public List<String> findSeedskeyList(String fkey) {
		// TODO Auto-generated method stub
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.skeys;
	}
	public void init() {
		try {
			initFruitTable();
			initRelationTable();
			initFruitTemplate();
			initRelation();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	private void initRelationTable() throws SQLException {
		// TODO Auto-generated method stub
		if (!BaseDao.me().isExist("t_relation")) {
			BaseDao.me().createRelationTable();
		}
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
		
		Set<SeedTemplate> seeds;
		Set<Integer> lengths;
		Map<String,Integer> sk_sl;
		Set<String> searchKeys;
		List<String> skeys;
		FruitTemplate(){
			this.seeds=new HashSet<SeedTemplate>();
			this.sk_sl=new HashMap<String,Integer>();
			this.lengths=new HashSet<Integer>();
			this.searchKeys=new HashSet<String>();
			this.skeys=new ArrayList<String>();
		}
		FruitTemplate add(SeedTemplate s){
			this.seeds.add(s);
			this.sk_sl.put(s.key, s.length);
			this.lengths.add(s.length);
			this.skeys.add(s.key);
			if(s.like){
				searchKeys.add(s.key);
			}
			try {
				isExist(s.length);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return this;
		}
	}
	private class SeedTemplate{
		String key;
		Integer length;
		boolean like;
		SeedTemplate(String key,Integer length){
			this(key,length,false);
		}
		SeedTemplate(String key,Integer length,boolean like){
			this.key=key;
			this.length=length;
			this.like=like;
		}
	}
	/*public static void main(String[] args) {
		Set<Integer> s=new HashSet<Integer>();
		s.add(1);
		s.add(1);
		System.out.println(s.size());
	}*/
	
	
}
