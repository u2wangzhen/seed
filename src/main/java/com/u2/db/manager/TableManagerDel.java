/*package com.u2.db.manager;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.data.BaseDao;
import com.u2.sys.SeedConfig;

public class TableManagerDel {

	private static TableManagerDel info = new TableManagerDel();

	private TableManagerDel() {
	};

	public static TableManagerDel me() {
		return info;
	}

	private Map<String, Map<String, Integer>> map = new HashMap<String, Map<String, Integer>>();

	private Map<String, Set<String>> map_skey_set = new HashMap<String, Set<String>>();

	private Set<Integer> exist = new HashSet<Integer>();

	public int findLength(String fkey, String skey) throws NumberFormatException, SQLException {
		int length = getValueLength(fkey, skey);
		if (length == 0) {
			throw new RuntimeException("not find this '" + fkey + "." + skey + "' length");
		}
		return length;
	}

	public Map<String, Integer> findSeedsLength(String fkey) throws NumberFormatException, SQLException {
		if (map.get(fkey) == null) {
			initOther();
		}
		return map.get(fkey);
	}
	
	public Set<String> findSeedskey(String fkey) throws NumberFormatException, SQLException{
		if(map_skey_set.get(fkey)==null){initOther();}
		return map_skey_set.get(fkey);
	}

	private int getValueLength(String fkey, String skey) throws NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		if (map.get(fkey) == null) {
			initOther();
		}
		if (map.get(fkey) == null) {
			return 0;
		}
		int length = map.get(fkey).get(skey);
		return length;
	}

	public void init() {
		try {
			initFruitTable();
			initSys();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void initFruitTable() throws SQLException {
		// TODO Auto-generated method stub
		if (!BaseDao.me().isExist("t_fruit")) {
			BaseDao.me().createFruitTable();
		}
	}

	private void initSys() throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Integer> mm = map.get(SeedConfig.SYS_KEY);
		
		if (mm == null) {
			mm = new HashMap<String, Integer>();
			map.put(SeedConfig.SYS_KEY, mm);
		}

		addSeedLength(mm, SeedConfig.SYS_FKEY, 16);
		addSeedLength(mm, SeedConfig.SYS_SKEY, 32);
		addSeedLength(mm, SeedConfig.SYS_VLENGTH, 8);

		Map<String, Integer> mmm = map.get(SeedConfig.FTL_KEY);
		if (mmm == null) {
			mmm = new HashMap<String, Integer>();
			map.put(SeedConfig.FTL_KEY, mmm);
		}

		addSeedLength(mmm, SeedConfig.FTL_FKEY, 16);
		addSeedLength(mmm, SeedConfig.FTL_SEARCH_SEEDS, 64);
		addSeedLength(mmm, SeedConfig.FTL_STATUS, 2);

	}

	private void addSeedLength(Map<String, Integer> mm, String key, int length) throws SQLException {
		isExist(length);
		mm.put(key, length);
	}

	private synchronized void isExist(int length) throws SQLException {
		// TODO Auto-generated method stub
		if (!exist.contains(length)) {
			boolean b = BaseDao.me().isExist("t_seed_" + length);
			if (!b) {
				BaseDao.me().createSeedTable(length);
			}
			exist.add(length);
		}

	}

	private void initOther() throws NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		List<Fruit_> list = MainCache.me().getFruitList(SeedConfig.SYS_KEY);
		for (Fruit_ f : list) {
			String fkey = f.getSeeds_map().get(SeedConfig.SYS_FKEY).getValue();
			String skey = f.getSeeds_map().get(SeedConfig.SYS_SKEY).getValue();
			String vlength = f.getSeeds_map().get(SeedConfig.SYS_VLENGTH).getValue();
			Map<String, Integer> m = map.get(fkey);
			if (m == null) {
				m = new HashMap<String, Integer>();
				map.put(fkey, m);
			}
			
			addSeedLength(m, skey, Integer.valueOf(vlength));
			
			Set<String> mm = map_skey_set.get(fkey);
			if(mm==null){
				mm=new HashSet<String>();
				map_skey_set.put(fkey, mm);
			}
			mm.add(skey);
		}

	}
	
	 * public void getTableName(String fkey,String skey,int l){ int length =
	 * getValueLength(fkey, skey); if(l>length){ int newLength=scope(l); } }
	 * 
	 * private int scope(int l) { // TODO Auto-generated method stub
	 * if(l>0&&l<=8){ return 8; }
	 * 
	 * if(l>8&&l<=16){ return 16; }
	 * 
	 * if(l>16&&l<=32){ return 32; } if(l>8&&l<=16){ return 16; }
	 * 
	 * if(l>32&&l<=64){ return 64; }
	 * 
	 * if(l>64&&l<=128){ return 128; }
	 * 
	 * return 255; }
	 
	
	 * private void init() { // TODO Auto-generated method stub
	 * DruidPooledConnection conn=null; try { conn =
	 * DBPoolConnection.getInstance().getConnection(); Statement s =
	 * conn.createStatement(); ResultSet rs = s.executeQuery(
	 * "select * from t_papa");
	 * 
	 * while(rs.next()){ String fkey = rs.getString(2); String
	 * sKey=rs.getString(3); int vlength=rs.getInt(4); Map<String, Integer> m =
	 * map.get(fkey); if(m==null){ m=new HashMap<String, Integer>();
	 * map.put(fkey, m); } m.put(sKey, vlength); } rs.close(); s.close(); }
	 * catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally{ if(conn!=null){ try { conn.close(); }
	 * catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 * 
	 * } }
	 

}
*/