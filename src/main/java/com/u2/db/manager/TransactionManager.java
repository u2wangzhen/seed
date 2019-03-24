package com.u2.db.manager;

import java.sql.SQLException;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.data.DBPoolConnection;

public class TransactionManager {
	
	private static ThreadLocal<TransactionManager> local=new ThreadLocal<TransactionManager>();

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
	
	public DruidPooledConnection getConn(){
		return conn;
	}
	
	public void commit(){
		try {
			conn.commit();
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
