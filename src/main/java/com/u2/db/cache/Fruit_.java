package com.u2.db.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.u2.model.Fruit;

public class Fruit_ extends Fruit {

	public Fruit_(Fruit f){
		setId(f.getId());
		setKey(f.getKey());
		jsonObj=new JSONObject();
		jsonObj.put("key", getKey());
		jsonObj.put("id", getId());
	}
	private List<Seed_> seeds;
	private Map<String,Seed_> seeds_map;
	private Map<String,List<Fruit_>> fruits_list;
	private Map<String,Map<Long,Fruit_>> fruits_map;
	private JSONObject jsonObj;
	
	public JSONObject getJsonObj() {
		return jsonObj;
	}
	public Map<String, Map<Long, Fruit_>> getFruits_map() {
		return fruits_map;
	}
	public void setFruits_map(Map<String, Map<Long, Fruit_>> fruits_map) {
		this.fruits_map = fruits_map;
	}
	public Map<String, List<Fruit_>> getFruits_list() {
		return fruits_list;
	}
	public void setFruits_list(Map<String, List<Fruit_>> fruits_list) {
		this.fruits_list = fruits_list;
	}
	public List<Seed_> getSeeds() {
		return seeds;
	}
	public void setSeeds(List<Seed_> seeds) {
		this.seeds = seeds;
	}
	public Map<String, Seed_> getSeeds_map() {
		return seeds_map;
	}
	public void setSeeds_map(Map<String, Seed_> seeds_map) {
		this.seeds_map = seeds_map;
	}

	public void addSeed(Seed_ s_) {
		// TODO Auto-generated method stub
		if(seeds==null){seeds=new ArrayList<Seed_>();}
		if(seeds_map==null){seeds_map=new HashMap<String, Seed_>();}
		seeds.add(s_);
		seeds_map.put(s_.getKey(), s_);
		jsonObj.put(s_.getKey(), s_.getValue());
		
	}

	public void addFruit(Fruit_ otherFruit) {
		// TODO Auto-generated method stub
		if(fruits_list==null){fruits_list=new HashMap<String, List<Fruit_>>();}
		List<Fruit_> list = fruits_list.get(otherFruit.getKey());
		if(list==null){list=new ArrayList<Fruit_>();fruits_list.put(otherFruit.getKey(), list);}
		list.add(otherFruit);
		
		if(fruits_map==null){fruits_map=new HashMap<String, Map<Long,Fruit_>>();}
		Map<Long, Fruit_> map = fruits_map.get(otherFruit.getKey());
		if(map==null){map=new HashMap<Long, Fruit_>();fruits_map.put(otherFruit.getKey(), map);}
		map.put(otherFruit.getId(), otherFruit);
		
	}
	public Seed_ getSeed(String key) {
		// TODO Auto-generated method stub
		return seeds_map.get(key);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getKey()+":"+getId();
	}
	public void refSeedJsonObj(Seed_ s) {
		// TODO Auto-generated method stub
		
			jsonObj.put(s.getKey(), s.getValue());
		
		
	}
}
