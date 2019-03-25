package com.u2.db.manager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.data.DBPoolConnection;
import com.u2.model.Fruit;

public class TransactionManager {
	
	private static ThreadLocal<TransactionManager> local=new ThreadLocal<TransactionManager>();
	private static ThreadLocal<List<Fruit>> fruit_local=new ThreadLocal<List<Fruit>>();

	private DruidPooledConnection conn;
	
	private TransactionManager(){
		
			
	};
	
	public void open(){
		try {
			conn=DBPoolConnection.getInstance().getConnection();
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static TransactionManager get(){
		TransactionManager t = local.get();
		if(t==null){
			t=new TransactionManager();
			local.set(t);
		}
		return t;
	}
	
	public static List<Fruit> getFruitlistlocal(){
		List<Fruit> list = fruit_local.get();
		if(list==null){
			list=new ArrayList<Fruit>();
			fruit_local.set(list);
		}
		return list;
	}
	
	public DruidPooledConnection getConn(){
		return conn;
	}
	
	public void commit(){
		try {
			conn.commit();
			List<Fruit> list = fruit_local.get();
			if(list!=null&&!list.isEmpty()){
				for (Fruit fruit : list) {
					MainCache.me().addFruit(fruit);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void rollback(){
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(){
		local.remove();
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
