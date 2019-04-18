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
		map.put("account", new FruitTemplate().add("name", 8)
												.add("account", 16)
												.add("password", 128)
												.addRelationKey("role"));
		
		map.put("role", new FruitTemplate().add("name", 8)
				.addRelationKey("model"));
		
		map.put("menu", new FruitTemplate().add("name", 32,true)
				.addSubKey("menu").addSubKey("model")
				.addParentKey("menu")
				);
		map.put("model", new FruitTemplate().add("name", 32,true)
				.add("path",64).addParentKey("menu")
				);
		
		
		map.put("student", new FruitTemplate().add("name", 16,true)
												.add("sex", 2,true)
												.add("school", 64)
												.add("birthday",16)
												.add("remark", 255)
												.add("createTime", 16));
		
		map.put("lesson", new FruitTemplate().add("name", 64,true)
												.add("subject", 8,true)
												.add("grade", 4,true)
												.add("createTime", 16)
												.add("tprice",16)
												.add("bprice",16)
												.addRelationKey("teacher")
												.addRelationKey("student")
												.addSubKey("price")
												);
		
		map.put("teacher", new FruitTemplate().add("name", 16,true)
										.add("sex", 2,true)
										.add("subject", 8,true)
										.add("birthday",16)
										.add("remark", 255)
										);
		
		map.put("price", new FruitTemplate().add("price", 16)
				.add("remark", 255)
				.addParentKey("lesson")
				.addRelationKey("student")
				);
		
		map.put("period", new FruitTemplate().add("pdate",16,true)
				.add("phour",4)
				.add("startTime",24)
				.add("endTime",24)
				.addRelationKey("lesson")
				.addRelationKey("student")
				.add("remark",255));
		map.put("classaccount", new FruitTemplate().add("name",64,true)
				.addRelationKey("student")
				.addRelationKey("lesson")
				.addSubKey("recharge")
				);
		map.put("recharge", new FruitTemplate().add("times",4)
				.add("date", 16, true)
				.add("remark", 255)
				.addParentKey("classaccount")
				);
		
	}
	/*private void initRelation(){
		
		//buildRelation("user","student");
	}*/

	private static TableManagerI tableManager = new TableManager();

	private TableManager() {};

	public static TableManagerI me() {
		return tableManager;
	}

	private Map<String, FruitTemplate> map = new HashMap<String, FruitTemplate>();
	//private Map<String,Set<String>> relation_map=new HashMap<String, Set<String>>();
	private Set<Integer> exist = new HashSet<Integer>();
	
	/*private void buildRelation(String mainKey, String otherKey){
		Set<String> set = relation_map.get(mainKey);
		if(set==null){set=new HashSet<String>();relation_map.put(mainKey, set);}
		set.add(otherKey);
	}*/

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
	public List<String> findSubKeys(String fkey){
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.subKeys;
	}
	
	public List<String> findRelationKeys(String fkey){
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.relationKeys;
	}
	public String findParentKeys(String fkey){
		FruitTemplate f = map.get(fkey);
		if(f==null){
			throw new RuntimeException("not found "+fkey);
		}
		return f.parentKey;
	}
	
	public void init() {
		try {
			initFruitTable();
			initRelationTable();
			initFruitTemplate();
			//initRelation();
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
		String parentKey;
		List<String> subKeys;
		List<String> relationKeys;
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
		
		FruitTemplate add(String k,Integer l){
			SeedTemplate s=new SeedTemplate(k, l);
			return add(s);
		}
		
		FruitTemplate add(String k,Integer l,boolean like){
			SeedTemplate s=new SeedTemplate(k, l,like);
			return add(s);
		}
		
		FruitTemplate addParentKey(String pk){
			this.parentKey=pk;
			return this;
		}
		FruitTemplate addSubKey(String k){
			if(this.subKeys==null){
				this.subKeys=new ArrayList<String>();
			}
			subKeys.add(k);
			return this;
		}
		
		FruitTemplate addRelationKey(String k){
			if(this.relationKeys==null){
				this.relationKeys=new ArrayList<String>();
			}
			relationKeys.add(k);
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
	public Set<String> findAllFruitKey() {
		// TODO Auto-generated method stub
		return map.keySet();
	}
	
	
}
