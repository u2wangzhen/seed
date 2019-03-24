package com.u2.db.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Seed;

public class BaseDao {
	private static BaseDao seedDataBaseHandler=new BaseDao();
	private BaseDao(){};
	public static BaseDao me(){
		return seedDataBaseHandler;
	}

	public synchronized boolean insertSeed(Seed seed,int l) throws SQLException{
		
		DruidPooledConnection c = TransactionManager.get().getConn();
		
		Statement s = c.createStatement();
		
		boolean i = s.execute("INSERT INTO T_SEED_"+l+" (S_KEY,S_VALUE,S_FID) VALUES ('"+seed.getKey()+"','"+seed.getValue()+"',"+seed.getFid()+")");
		s.close();
		return i;
	}
	
	public List<Fruit> selectAllFruit() throws SQLException{
		List<Fruit> list=null;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery("select * from T_FRUIT");
		while(rs.next()){
			Fruit f = new Fruit();
			Long id = rs.getLong(1);
			String key=rs.getString(2);
			f.setId(id);
			f.setKey(key);
			if(list==null){list=new ArrayList<Fruit>();}
			list.add(f);
		}
		rs.close();
		s.close();
		c.close();
		return list;
	}
	
	public List<Seed> selectSeeds(Long fid,int t) throws SQLException {
		// TODO Auto-generated method stub
		List<Seed> list=null;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		list=select(s,fid,t);
		/*list.addAll(select(s, fid, 32));
		list.addAll(select(s, fid, 64));
		list.addAll(select(s, fid, 128));
		list.addAll(select(s, fid, 256));*/
		s.close();
		c.close();
		return list;
	}
	
	private List<Seed> select(Statement s, Long fid, int i) throws SQLException {
		// TODO Auto-generated method stub
		List<Seed> list=null;
		ResultSet rs = s.executeQuery("select * from T_SEED_"+i+" where s_fid="+fid);
		while(rs.next()){
			long id = rs.getLong(1);
			String key = rs.getString(2);
			String value = rs.getString(3);
			Seed seed=new Seed();
			seed.setFid(fid);
			seed.setId(id);
			seed.setKey(key);
			seed.setValue(value);
			if(list==null){list=new ArrayList<Seed>();}
			list.add(seed);
		}
		rs.close();
		return list;
	}
	public synchronized boolean insertFruit(Fruit fruit) throws SQLException{
		
		DruidPooledConnection c = TransactionManager.get().getConn();
		
		Statement s = c.createStatement();
		
		boolean i = s.execute("INSERT INTO T_FRUIT (F_KEY) VALUES ('"+fruit.getKey()+"')");
		
		ResultSet r = s.executeQuery("select last_insert_id()");
		while(r.next()){
			long id=r.getLong(1);fruit.setId(id);
		}
		r.close();
		s.close();
		//c.close();
		return i;
	}
	/*public static void main(String[] args) throws SQLException {
		
		Fruit fruit=new Fruit();
		fruit.setKey("student");
		SeedDataBaseHandler.me().insertFruit(fruit);
		
		Seed seed=new Seed();
		seed.setKey("name");
		seed.setValue("u2");
		seed.setFid(fruit.getId());
		SeedDataBaseHandler.me().insertSeed(seed);
		
	}*/
	public synchronized boolean  updateSeed(Long id,String newValue,int l) throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql="update T_SEED_"+l+" set s_value='"+newValue+"' where id="+id;
		boolean i = s.execute(sql);
		s.close();
		return i;
	}
	public boolean deleteFruit(Fruit f) throws SQLException {
		// TODO Auto-generated method stub
		boolean i=true;
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql="delete from T_FRUIT where id='"+f.getId();
		String sql2="delete from T_SEED_32 where s_fid='"+f.getId();
		i&= s.execute(sql2);
		i&= s.execute(sql);
		s.close();
		return i;
	}
	
}
