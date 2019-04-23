package com.u2.db.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.u2.db.manager.TransactionManager;
import com.u2.model.Fruit;
import com.u2.model.Relation;
import com.u2.model.Seed;

public class BaseDao {
	private static BaseDao seedDataBaseHandler = new BaseDao();

	private BaseDao() {
	};

	public static BaseDao me() {
		return seedDataBaseHandler;
	}

	public synchronized boolean insertSeed(Seed seed, int l) throws SQLException {

		DruidPooledConnection c = TransactionManager.get().getConn();

		Statement s = c.createStatement();

		boolean i = s.execute("INSERT INTO T_SEED_" + l + " (ID,S_KEY,S_VALUE,S_FID) VALUES ('"+seed.getId()+"','" + seed.getKey() + "','"
				+ seed.getValue() + "'," + seed.getFid() + ")");
		s.close();
		return i;
	}
	
	public synchronized boolean insertRelation(Relation r) throws SQLException {

		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		boolean i = s.execute("INSERT INTO T_RELATION (ID,MAIN_ID,OTHER_ID) VALUES ('"+UUID.randomUUID().toString()+"'," + r.getMainId() + ","+ r.getOtherId() + ")");
		s.close();
		return i;
	}

	public List<Fruit> selectAllFruit() throws SQLException {
		List<Fruit> list = null;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery("select * from T_FRUIT");
		while (rs.next()) {
			Fruit f = new Fruit();
			Long id = rs.getLong(1);
			String key = rs.getString(2);
			f.setId(id);
			f.setKey(key);
			if (list == null) {
				list = new ArrayList<Fruit>();
			}
			list.add(f);
		}
		rs.close();
		s.close();
		c.close();
		return list;
	}
	
	public List<Relation> selectRelation(Long mid) throws SQLException {
		List<Relation> list = null;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery("select * from T_RELATION where main_id="+mid);
		while (rs.next()) {
			Relation r = new Relation();
			String id = rs.getString(1);
			Long mainId = rs.getLong(2);
			Long otherId = rs.getLong(3);
			r.setId(id);
			r.setMainId(mainId);
			r.setOtherId(otherId);
			if (list == null) {
				list = new ArrayList<Relation>();
			}
			list.add(r);
		}
		rs.close();
		s.close();
		c.close();
		return list;
	}

	public List<Seed> selectSeeds(Long fid, int t) throws SQLException {
		// TODO Auto-generated method stub
		List<Seed> list = null;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		list = select(s, fid, t);
		s.close();
		c.close();
		return list;
	}

	private List<Seed> select(Statement s, Long fid, int i) throws SQLException {
		// TODO Auto-generated method stub
		List<Seed> list = null;
		ResultSet rs = s.executeQuery("select * from T_SEED_" + i + " where s_fid=" + fid);
		while (rs.next()) {
			String id = rs.getString(1);
			String key = rs.getString(2);
			String value = rs.getString(3);
			Seed seed = new Seed();
			seed.setId(id);
			seed.setFid(fid);
			seed.setKey(key);
			seed.setValue(value);
			if (list == null) {
				list = new ArrayList<Seed>();
			}
			list.add(seed);
		}
		rs.close();
		return list;
	}

	public synchronized void insertFruit(Fruit fruit) throws SQLException {

		DruidPooledConnection c = TransactionManager.get().getConn();

		Statement s = c.createStatement();

		s.execute("INSERT INTO T_FRUIT (F_KEY) VALUES ('" + fruit.getKey() + "')");

		ResultSet r = s.executeQuery("select last_insert_id()");
		while (r.next()) {
			long id = r.getLong(1);
			fruit.setId(id);
		}
		r.close();
		s.close();
		// c.close();
	}

	/*
	 * public static void main(String[] args) throws SQLException {
	 * 
	 * Fruit fruit=new Fruit(); fruit.setKey("student");
	 * SeedDataBaseHandler.me().insertFruit(fruit);
	 * 
	 * Seed seed=new Seed(); seed.setKey("name"); seed.setValue("u2");
	 * seed.setFid(fruit.getId()); SeedDataBaseHandler.me().insertSeed(seed);
	 * 
	 * }
	 */
	public synchronized void updateSeed(String id, String newValue, int l) throws SQLException {
		// TODO Auto-generated method stub
		if (newValue == null) {
			newValue = "";
		}
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql = "update T_SEED_" + l + " set s_value='" + newValue + "' where id='" + id+"'";
		s.execute(sql);
		s.close();
	}

	public void deleteFruit(Long fid) throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql = "delete from T_FRUIT where id=" + fid;
		s.execute(sql);
		s.close();
	}
	
	public void deleteRelation(Long mainId) throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql = "delete from T_RELATION where main_Id=" + mainId;
		s.execute(sql);
		s.close();
	}

	public void deleteSeed(long fid, int l) throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = TransactionManager.get().getConn();
		Statement s = c.createStatement();
		String sql = "delete from T_SEED_" + l + " where s_fid=" + fid;
		s.execute(sql);
		s.close();
	}

	public boolean isExist(String tableName) throws SQLException {
		// TODO Auto-generated method stub
		boolean b = false;
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		// String tname = "t_seed_" + length;
		String sql = "show tables like '" + tableName + "'";
		ResultSet rs = s.executeQuery(sql);
		if (rs.next()) {
			b = true;
		}
		rs.close();
		s.close();
		c.close();
		return b;
	}

	public void createSeedTable(int length) throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = TransactionManager.get().getConn();
		boolean b = c == null;
		if (b) {
			c = DBPoolConnection.getInstance().getConnection();
		}

		Statement s = c.createStatement();//`id` varchar(36) NOT NULL,
		String tname = "t_seed_" + length;
		String sql = " " + "CREATE TABLE `" + tname + "` (" + "`id` varchar(36) NOT NULL,"
				+ "`S_key` varchar(32) DEFAULT NULL," + "`S_value` varchar(" + length + ") DEFAULT NULL,"
				+ "`S_fid` bigint(11) DEFAULT NULL," + " PRIMARY KEY (`id`)"
				+ ") ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;";
		s.execute(sql);

		s.close();
		if (b) {
			c.close();
		}
	}

	public synchronized void createFruitTable() throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		String sql = "CREATE TABLE `t_fruit` (" + "`ID` bigint(11) NOT NULL AUTO_INCREMENT,"
				+ "`F_KEY` varchar(32) DEFAULT NULL," + "PRIMARY KEY (`ID`)"
				+ ") ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;";

		s.execute(sql);
		s.close();
		c.close();

	}

	public synchronized void createRelationTable() throws SQLException {
		// TODO Auto-generated method stub
		DruidPooledConnection c = DBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		String sql = "CREATE TABLE `t_relation` (" + "`id` varchar(36) NOT NULL,"
				+ "`main_id` bigint(20) NOT NULL,"
				+ "`other_id` bigint(20) NOT NULL,"
				+ "PRIMARY KEY (`ID`)"
				+ ") ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;";

		s.execute(sql);
		s.close();
		c.close();
	}

}
