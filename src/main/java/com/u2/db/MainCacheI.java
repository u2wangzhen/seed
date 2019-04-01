package com.u2.db;

import java.sql.SQLException;
import java.util.List;

import com.u2.db.cache.Fruit_;
import com.u2.model.Fruit;

public interface MainCacheI {

	public void delFruit(Fruit_ f);
	public void addFruit(Fruit f) throws NumberFormatException, SQLException;
	public List<Fruit_> getFruitList(String key);
	public List<Fruit_> getFruitListDesc(String key);
	public Fruit_ getFruit(Long id);
}
