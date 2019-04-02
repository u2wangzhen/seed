package com.u2.db.cache;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.u2.model.Fruit;

public class Fruit_ extends Fruit {

	public Fruit_(Fruit f) {
		setId(f.getId());
		setKey(f.getKey());
		jsonObj = new JSONObject();
		jsonObj.put("key", getKey());
		jsonObj.put("id", getId());
	}

	private Map<String, Seed_> seeds;
	private Map<String, Set<Fruit_>> otherFruits;
	private Map<String, Set<Fruit_>> citedFruits;
	private int[] indexs;
	private JSONObject jsonObj;


	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		super.setId(id);
		if (id != null && id > 0) {
			indexs = Cube.buildIndex(id);
		}
	}

	public int[] getIndexs() {
		return indexs;
	}
	public Map<String, Set<Fruit_>> getOtherFruits() {
		return otherFruits;
	}
	public Set<Fruit_> getOtherFruits(String otherKey) {
		if(otherFruits==null){return null;}
		return otherFruits.get(otherKey);
	}
	
	public Map<String, Set<Fruit_>> getCitedFruits() {
		return citedFruits;
	}
	public Set<Fruit_> getCitedFruits(String otherKey) {
		if(citedFruits==null){return null;}
		return citedFruits.get(otherKey);
	}


	public JSONObject getJsonObj() {
		return jsonObj;
	}

	public Map<String, Seed_> getSeeds() {
		return seeds;
	}

	public void addSeed(Seed_ s_) {
		// TODO Auto-generated method stub
		if (seeds == null) {
			seeds = new HashMap<String, Seed_>();
		}
		seeds.put(s_.getKey(), s_);
		jsonObj.put(s_.getKey(), s_.getValue());

	}

	public Seed_ getSeed(String key) {
		// TODO Auto-generated method stub
		return seeds.get(key);
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getKey() + ":" + getId();
	}

	public void refSeedJsonObj(Seed_ s) {
		// TODO Auto-generated method stub
		jsonObj.put(s.getKey(), s.getValue());
	}

	public void addOther(Fruit_ other) {
		// TODO Auto-generated method stub
		if(otherFruits==null){
			otherFruits=new HashMap<String, Set<Fruit_>>();
		}
		Set<Fruit_> set = otherFruits.get(other.getKey());
		if(set==null){set=new HashSet<Fruit_>();otherFruits.put(other.getKey(), set);}
		set.add(other);
		other.cited(this);
	}
	
	
	public void cited(Fruit_ other) {
		// TODO Auto-generated method stub
		if(citedFruits==null){
			citedFruits=new HashMap<String, Set<Fruit_>>();
		}
		Set<Fruit_> set = citedFruits.get(other.getKey());
		if(set==null){set=new HashSet<Fruit_>();citedFruits.put(other.getKey(), set);}
		set.add(other);
		
	}

	public void delRelation() {
		// TODO Auto-generated method stub
		if(otherFruits!=null){
			Set<String> ks = otherFruits.keySet();
			for (String k : ks) {
				Set<Fruit_> set = otherFruits.get(k);
				for (Fruit_ f : set) {
					f.removeOther(this.getKey(),this);
				}
				set.clear();
			}
		}
	}

	private void removeOther(String key, Fruit_ f) {
		// TODO Auto-generated method stub
		if(citedFruits!=null){
			citedFruits.get(key).remove(f);
		}
	}
}
