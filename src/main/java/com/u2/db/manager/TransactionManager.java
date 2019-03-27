package com.u2.db.manager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.data.DBPoolConnection;
import com.u2.model.Fruit;

public class TransactionManager {
	
	private static ThreadLocal<TransactionManager> local=new ThreadLocal<TransactionManager>();
	private static ThreadLocal<Stack<Fruit>> fruit_local=new ThreadLocal<Stack<Fruit>>();

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
	
	public static Stack<Fruit> getFruitlistlocal(){
		Stack<Fruit> list = fruit_local.get();
		if(list==null){
			list=new Stack<Fruit>();
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
			Stack<Fruit> list = fruit_local.get();
			while(list!=null&&!list.isEmpty()){
				Fruit f = list.pop();
				MainCache.me().addFruit(f);
				
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
