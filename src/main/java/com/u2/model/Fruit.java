package com.u2.model;

import java.util.List;
import java.util.Map;

public class Fruit {

	private String id;
	private String key;
	private List<Seed> seeds;
	private Map<String,Seed> seeds_map;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public List<Seed> getSeeds() {
		return seeds;
	}
	public void setSeeds(List<Seed> seeds) {
		this.seeds = seeds;
	}
	public Map<String, Seed> getSeeds_map() {
		return seeds_map;
	}
	public void setSeeds_map(Map<String, Seed> seeds_map) {
		this.seeds_map = seeds_map;
	}
	
}
