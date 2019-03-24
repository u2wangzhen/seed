package com.u2.db.table;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.sys.SeedConfig;

public class TableManager {

	private static TableManager info=new TableManager();
	private TableManager(){};
	public static TableManager me(){
		return info;
	}
	
	public Map<String,Map<String,Integer>> map=new HashMap<String,Map<String,Integer>>();
	
	public int findLength(String fkey,String skey){
		int length=getValueLength(fkey,skey);
		if(length==0){throw new RuntimeException("not find this '"+fkey+"."+skey+"' length");}
		return length;
	}
	
	public Map<String,Integer> findSeedsLength(String fkey){
		return map.get(fkey);
	}
	
	private int getValueLength(String fkey, String skey) {
		// TODO Auto-generated method stub
		if(map.isEmpty()){
			initSys();
			
		}
		if(map.isEmpty()){return 0;}
		if(map.get(fkey)==null){
			initOther();
		}
		if(map.get(fkey)==null){return 0;}
		int length=map.get(fkey).get(skey);
		return length;
	}
	private void initSys() {
		// TODO Auto-generated method stub
		Map<String, Integer> mm = map.get(SeedConfig.SYS_KEY);
		if(mm==null){mm=new HashMap<String, Integer>();map.put(SeedConfig.SYS_KEY, mm);}
		mm.put(SeedConfig.SYS_FKEY, 16);
		mm.put(SeedConfig.SYS_SKEY, 16);
		mm.put(SeedConfig.SYS_VLENGTH, 16);
		
	}
	
	private void initOther() {
		// TODO Auto-generated method stub
		List<Fruit_> list = MainCache.me().getFruitList(SeedConfig.SYS_KEY);
		for (Fruit_ f : list) {
			String fkey = f.getSeeds_map().get(SeedConfig.SYS_FKEY).getValue();
			String skey = f.getSeeds_map().get(SeedConfig.SYS_SKEY).getValue();
			String vlength = f.getSeeds_map().get(SeedConfig.SYS_VLENGTH).getValue();
			Map<String, Integer> m = map.get(fkey);
			if(m==null){m=new HashMap<String, Integer>();map.put(fkey, m);}
			m.put(skey, Integer.valueOf(vlength));
		}
		
	}
	/*public void getTableName(String fkey,String skey,int l){
		int length = getValueLength(fkey, skey);
		if(l>length){
			int newLength=scope(l);
		}
	}
	
	private int scope(int l) {
		// TODO Auto-generated method stub
		if(l>0&&l<=8){
			return 8;
		}
		
		if(l>8&&l<=16){
			return 16;
		}
		
		if(l>16&&l<=32){
			return 32;
		}
		if(l>8&&l<=16){
			return 16;
		}
		
		if(l>32&&l<=64){
			return 64;
		}
		
		if(l>64&&l<=128){
			return 128;
		}
		
		return 255;
	}*/
	/*private void init() {
		// TODO Auto-generated method stub
		DruidPooledConnection conn=null;
		try {
			conn = DBPoolConnection.getInstance().getConnection();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery("select * from t_papa");
			
			while(rs.next()){
				String fkey = rs.getString(2);
				String sKey=rs.getString(3);
				int vlength=rs.getInt(4);
				Map<String, Integer> m = map.get(fkey);
				if(m==null){
					m=new HashMap<String, Integer>();
					map.put(fkey, m);
				}
				m.put(sKey, vlength);
			}
			rs.close();
			s.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	}*/
	
}
