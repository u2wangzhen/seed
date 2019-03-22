package com.u2.db.data;

import java.sql.SQLException;
import java.sql.Statement;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.model.Seed;

public class SeedDataBaseHandler {
	private static SeedDataBaseHandler seedDataBaseHandler=new SeedDataBaseHandler();
	private SeedDataBaseHandler(){};
	public static SeedDataBaseHandler me(){
		return seedDataBaseHandler;
	}

	public boolean insertSeed(Seed seed) throws SQLException{
		
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		
		Statement s = c.createStatement();
		
		boolean i = s.execute("INSERT INTO T_SEED_32 (S_KEY,S_VALUE,S_FID) VALUES ('"+seed.getKey()+"','"+seed.getValue()+"',"+seed.getFid()+")");
		
		return i;
	}
	public static void main(String[] args) throws SQLException {
		
		Seed seed=new Seed();
		seed.setKey("name");
		seed.setValue("u2");
		seed.setFid("1");
		SeedDataBaseHandler.me().insertSeed(seed);
		
	}
}
