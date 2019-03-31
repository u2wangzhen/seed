package com.u2.db.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	private Set<Seed_> seeds;
	private Map<String,Seed_> seeds_map;
	private Map<String,List<Fruit_>> fruits_list_in;
	private Map<String,Map<Long,Fruit_>> fruits_map_in;
	private Map<String,List<Fruit_>> fruits_list_out;
	private Map<String,Map<Long,Fruit_>> fruits_map_out;
	public Map<String, List<Fruit_>> getFruits_list_in() {
		return fruits_list_in;
	}

	public void setFruits_list_in(Map<String, List<Fruit_>> fruits_list_in) {
		this.fruits_list_in = fruits_list_in;
	}

	public Map<String, Map<Long, Fruit_>> getFruits_map_in() {
		return fruits_map_in;
	}

	public void setFruits_map_in(Map<String, Map<Long, Fruit_>> fruits_map_in) {
		this.fruits_map_in = fruits_map_in;
	}

	public Map<String, List<Fruit_>> getFruits_list_out() {
		return fruits_list_out;
	}

	public void setFruits_list_out(Map<String, List<Fruit_>> fruits_list_out) {
		this.fruits_list_out = fruits_list_out;
	}

	public Map<String, Map<Long, Fruit_>> getFruits_map_out() {
		return fruits_map_out;
	}

	public void setFruits_map_out(Map<String, Map<Long, Fruit_>> fruits_map_out) {
		this.fruits_map_out = fruits_map_out;
	}
	private JSONObject jsonObj;
	
	public JSONObject getJsonObj() {
		return jsonObj;
	}
	
	public Set<Seed_> getSeeds() {
		return seeds;
	}
	public void setSeeds(Set<Seed_> seeds) {
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
		if(seeds==null){seeds=new HashSet<Seed_>();}
		if(seeds_map==null){seeds_map=new HashMap<String, Seed_>();}
		seeds.add(s_);
		seeds_map.put(s_.getKey(), s_);
		jsonObj.put(s_.getKey(), s_.getValue());
		
	}

	public void addFruit(Fruit_ otherFruit) {
		// TODO Auto-generated method stub
		if(fruits_list_in==null){fruits_list_in=new HashMap<String, List<Fruit_>>();}
		List<Fruit_> list = fruits_list_in.get(otherFruit.getKey());
		if(list==null){list=new ArrayList<Fruit_>();fruits_list_in.put(otherFruit.getKey(), list);}
		list.add(otherFruit);
		
		if(fruits_map_in==null){fruits_map_in=new HashMap<String, Map<Long,Fruit_>>();}
		Map<Long, Fruit_> map = fruits_map_in.get(otherFruit.getKey());
		if(map==null){map=new HashMap<Long, Fruit_>();fruits_map_in.put(otherFruit.getKey(), map);}
		map.put(otherFruit.getId(), otherFruit);
		
		otherFruit.addOutFruit(this);
		
	}
	private void addOutFruit(Fruit_ fruit_) {
		// TODO Auto-generated method stub
		if(fruits_list_out==null){fruits_list_out=new HashMap<String, List<Fruit_>>();}
		List<Fruit_> list = fruits_list_out.get(fruit_.getKey());
		if(list==null){list=new ArrayList<Fruit_>();fruits_list_out.put(fruit_.getKey(), list);}
		list.add(fruit_);
		
		if(fruits_map_out==null){fruits_map_out=new HashMap<String, Map<Long,Fruit_>>();}
		Map<Long, Fruit_> map = fruits_map_out.get(fruit_.getKey());
		if(map==null){map=new HashMap<Long, Fruit_>();fruits_map_out.put(fruit_.getKey(), map);}
		map.put(fruit_.getId(), fruit_);
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
