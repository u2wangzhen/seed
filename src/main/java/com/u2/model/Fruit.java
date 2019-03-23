package com.u2.model;


public class Fruit {

	private Long id;
	private String key;
	public Fruit(){}
	public Fruit(String key) {
		// TODO Auto-generated constructor stub
		this.key=key;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	
}
