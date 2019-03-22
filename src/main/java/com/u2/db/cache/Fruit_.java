package com.u2.db.cache;

import java.util.List;
import java.util.Map;

import com.u2.model.Fruit;

public class Fruit_ extends Fruit {

	private Map<String,List<Fruit>> fruits_map;

	public Map<String, List<Fruit>> getFruits_map() {
		return fruits_map;
	}

	public void setFruits_map(Map<String, List<Fruit>> fruits_map) {
		this.fruits_map = fruits_map;
	}

}
