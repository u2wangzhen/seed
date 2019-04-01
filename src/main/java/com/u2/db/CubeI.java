package com.u2.db;

import java.util.List;

import com.u2.db.cache.Fruit_;

public interface CubeI {

	public List<Fruit_> getFruitsAsc(String key);
	public List<Fruit_> getFruitsDesc(String key);
	public void add(Fruit_ fruit);
	public Fruit_ get(Long id);
	public void remove(Long id);
}
