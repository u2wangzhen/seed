package com.u2.converter;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public abstract class Converter {

	protected Map<String,String[]> param;
	protected String key;
	
	protected Fruit fruit;
	protected List<Seed> seeds;
	protected List<Long> others;
	protected Map<String,List<Long>> other_map;
	public Converter(String key){
		this.key=key;
	}
	public Converter  form2Fruit(Map<String,String[]> param) {
		this.param = param;
		form2Fruit();
		return this;
	}
	
	protected abstract void form2Fruit();
	public abstract JSONObject fruit2Form(Fruit_ f);
	
	public Fruit getFruit() {
		return fruit;
	}
	public List<Seed> getSeeds() {
		return seeds;
	}
	public List<Long> getOthers() {
		return others;
	}
	public List<Long> getOthersBykey(String key) {
		if(other_map!=null){
			return other_map.get(key);
		}
		return null;
	}
	
	
}
