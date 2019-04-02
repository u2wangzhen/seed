package com.u2.db.manager;

import java.sql.SQLException;
import java.util.Stack;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.cache.Seed_;
import com.u2.db.data.DBPoolConnection;
import com.u2.model.Fruit;

public class TransactionManager {
	
	private static ThreadLocal<TransactionManager> local=new ThreadLocal<TransactionManager>();
	private static ThreadLocal<Stack<Fruit>> fruit_local=new ThreadLocal<Stack<Fruit>>();
	private static ThreadLocal<Stack<SeedUpdate>> seed_local=new ThreadLocal<Stack<SeedUpdate>>();
	private static ThreadLocal<Stack<Fruit_>> del_local=new ThreadLocal<Stack<Fruit_>>();
	private static ThreadLocal<Stack<Fruit_>> relation_local=new ThreadLocal<Stack<Fruit_>>();
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
	
	public static Stack<Fruit_> getRelationlocal(){
		Stack<Fruit_> list = relation_local.get();
		if(list==null){
			list=new Stack<Fruit_>();
			relation_local.set(list);
		}
		return list;
	}
	
	public static Stack<Fruit> getFruitlistlocal(){
		Stack<Fruit> list = fruit_local.get();
		if(list==null){
			list=new Stack<Fruit>();
			fruit_local.set(list);
		}
		return list;
	}
	
	public static Stack<Fruit_> getDellocal(){
		Stack<Fruit_> list = del_local.get();
		if(list==null){
			list=new Stack<Fruit_>();
			del_local.set(list);
		}
		return list;
	}
	
	public static Stack<SeedUpdate> getSeedlocal(){
		
		Stack<SeedUpdate> list=seed_local.get();
		if(list==null){
			list=new Stack<SeedUpdate>();
			seed_local.set(list);
		}
		return list;
	}
	
	public static void pushSeed(Seed_ s,String v){
		getSeedlocal().push(new SeedUpdate(s,v));
	}
	
	public static void pushDel(Fruit_ f) {
		// TODO Auto-generated method stub
		getDellocal().push(f);
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
			Stack<Fruit_> rl = relation_local.get();
			while(rl!=null&&!rl.isEmpty()){
				Fruit_ f = rl.pop();
				MainCache.me().refRelation(f);
				
			}
			Stack<SeedUpdate> stack=seed_local.get();
			while(stack!=null&&!stack.isEmpty()){
				stack.pop().update();
			}
			
			Stack<Fruit_> dl = del_local.get();
			while(dl!=null&&!dl.isEmpty()){
				Fruit_ f = dl.pop();
				MainCache.me().delFruit(f);
				
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
		fruit_local.remove();
		seed_local.remove();
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static class SeedUpdate{
		private Seed_ s;
		private String newValue;
		private SeedUpdate(Seed_ s,String newValue){
			this.s=s;
			this.newValue=newValue;
		}
		private void update(){
			s.setValue(newValue);
			s.getFruit().refSeedJsonObj(s);
		}
	}
	
}
