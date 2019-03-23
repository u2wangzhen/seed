package com.u2.db.cache;

import com.u2.model.Seed;

public class Seed_ extends Seed{

	private Fruit_ fruit;

	public Seed_(Seed s) {
		// TODO Auto-generated constructor stub
		setId(s.getId());
		setKey(s.getKey());
		setValue(s.getValue());
		setFid(s.getFid());
	}

	public final Fruit_ getFruit() {
		return fruit;
	}

	public final void setFruit(Fruit_ fruit) {
		this.fruit = fruit;
	}
	
}
