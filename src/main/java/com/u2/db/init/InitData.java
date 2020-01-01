package com.u2.db.init;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.mysql.fabric.xmlrpc.base.Array;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.data.DBPoolConnection;
import com.u2.db.data.WiseDBPoolConnection;
import com.u2.db.manager.TransactionManager;
import com.u2.handler.FruitHandler;
import com.u2.model.Fruit;
import com.u2.model.Seed;
import com.u2.search.Search;

public class InitData {
	private InitData(){}
	private static InitData me=new InitData();
	public static InitData me(){return me;}
	
	
	public void init() throws SQLException{
		
		Long yy_id=insertMenu("应用");
		
		Long kw_id=insertMenu("课务",yy_id);
			TransactionManager.get().open();
			insertModel("课程","/lesson",kw_id);
			insertModel("课时","/period",kw_id);
			TransactionManager.get().commit();
		
		Long zy_id=insertMenu("资源",yy_id);
			TransactionManager.get().open();
			insertModel("老师","/teacher",zy_id);
			insertModel("学生","/student",zy_id);
			TransactionManager.get().commit();
		
		Long zh_id=insertMenu("账户",yy_id);
			TransactionManager.get().open();
			insertModel("课时账户","/classaccount",zh_id);
			TransactionManager.get().commit();
		
		Long tj_id=insertMenu("统计");
			TransactionManager.get().open();
			insertModel("薪资收入","/total/toSalary",tj_id);
			TransactionManager.get().commit();
		
		Long xt_id=insertMenu("系统");
		
		TransactionManager.get().open();
		insertModel("账号","/account",xt_id);
		insertModel("角色","/role",xt_id);
		insertModel("菜单","/menu",xt_id);
		insertModel("模块","/model",xt_id);
		insertModel("数据","/fruit",xt_id);
		TransactionManager.get().commit();
		
		
	}
	
	public void initData() throws SQLException{
		System.out.println("open:"+System.currentTimeMillis());
		//学生导入System.out.println("success:"+System.currentTimeMillis());
				initStudent();
				//老师导入
				initTeacher();
				
				//课程导入
				initLesson();
				System.out.println("success:"+System.currentTimeMillis());
	}


	private void initLesson() throws SQLException {
		// TODO Auto-generated method stub
		List<Fruit_> list = MainCache.me().getFruitList("lesson");
		if(list!=null&&list.size()>0){
			//什么也不做
		}else{
			String sql="select c.name,c.subject,c.type,c.grade,c.teacher_name,c.start_time,c.del_flag,g.teacher_price,g.class_fee,c.id from t_curriculum c ,t_curriculum_config g where g.cid=c.id order by c.start_time asc";
			DruidPooledConnection c = WiseDBPoolConnection.getInstance().getConnection();
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				String name=rs.getString(1);
				
				String subject=rs.getString(2);
				String type=rs.getInt(3)==0?"初":"高";
				int g=rs.getInt(4);
				String grade=type;
				if(g==1){
					grade+="一";
				}else if(g==2){
					grade+="二";
				}else if(g==3){
					grade+="三";
				}
				
				String tname=rs.getString(5);
				String start = toDateStr(rs.getTimestamp(6));
				int del=rs.getInt(7);
				int tp=rs.getInt(8);
				int cp=rs.getInt(9);
				String cid=rs.getString(10);
				addLesson(name,subject,grade,tname,start,del,tp,cp,cid);
				
			}
			rs.close();
			s.close();
			c.close();
		}
	}
	private void addLesson(String name, String subject, String grade, String tname, String start, int del, int tp,
			int cp,String cid) throws SQLException {
		// TODO Auto-generated method stub
		List<Long> others =new ArrayList<Long>();
		List<Long> ss =new ArrayList<Long>();
		
		String[] students=name.split("\\[")[0].split(",");
		for (String sname : students) {
			Long sid = new Search("student","{and{name="+sname+"}}").filterFruit().get(0).getId();
			others.add(sid);
			ss.add(sid);
		}
		
		others.add(new Search("teacher","{and{name="+tname+"}}").filterFruit().get(0).getId());
		
		Long lid = insertLesson(name,subject,grade,start,del,tp+"",others);
		
		for (Long sid : ss) {
			insertPrice(cp,sid,lid);
		}
		
		String sql="select * from t_class_record where cid='"+cid+"' ORDER BY record_data asc";
		
		DruidPooledConnection c = WiseDBPoolConnection.getInstance().getConnection();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery(sql);
		while (rs.next()) {
			String pdata = toDateStr(rs.getTimestamp(3));
			String startTime = toDateStrHr(rs.getTimestamp(4));
			String endTime = toDateStrHr(rs.getTimestamp(5));
			int phour=rs.getInt(6);
			String remark=rs.getString(7);
			ss.add(lid);
			insertPeriod(phour,pdata,startTime,endTime,remark,ss);
		}
		rs.close();
		s.close();
		c.close();
	}
	
	private void insertPeriod(int phour,String pdate,String startTime,String endTime,String remark,List<Long> others) throws SQLException{
		
		TransactionManager.get().open();
		Fruit menu=new Fruit("period");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("phour", phour+""));
		m_s.add(new Seed("pdate", pdate));
		m_s.add(new Seed("startTime", startTime));
		m_s.add(new Seed("endTime", endTime));
		m_s.add(new Seed("remark", remark));
		FruitHandler.me().insertFruit(menu, m_s, others);
		TransactionManager.get().commit();
	}
	
	
	
	private void insertPrice(int cp, Long sid, Long lid) throws SQLException {
		// TODO Auto-generated method stub
		TransactionManager.get().open();
		Fruit menu=new Fruit("price");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("price", cp+""));
		
		
		List<Long> o=new ArrayList<Long>();
		o.add(lid);
		o.add(sid);
		FruitHandler.me().insertFruit(menu, m_s, o);
		TransactionManager.get().commit();
	}


	private Long insertLesson(String name,String subject,String grade,String createTime,int end,String tprice, List<Long> other) throws SQLException {
		// TODO Auto-generated method stub
		TransactionManager.get().open();
		Fruit menu=new Fruit("lesson");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", name));
		m_s.add(new Seed("subject", subject));
		m_s.add(new Seed("grade", grade));
		m_s.add(new Seed("createTime", createTime));
		m_s.add(new Seed("tprice", tprice));
		m_s.add(new Seed("bprice", "0"));
		if(end==1){
			m_s.add(new Seed("end", "1"));
		}
		
		FruitHandler.me().insertFruit(menu, m_s, other);
		TransactionManager.get().commit();
		return menu.getId();
	}


	public static String toDateStr(Timestamp tt){
        if(null!=tt){
        	return new SimpleDateFormat("yyyy-MM-dd").format(tt);
            // return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(tt);
        }
       return "";
	}
	
	public static String toDateStrHr(Timestamp tt){
        if(null!=tt){
        	//return new SimpleDateFormat("yyyy-MM-dd").format(tt);
        	// return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(tt);
            return new SimpleDateFormat("HH:mm:ss").format(tt);
        }
       return "";
	}

	public void initTeacher() throws SQLException {
		// TODO Auto-generated method stub
		List<Fruit_> list = MainCache.me().getFruitList("teacher");
		if(list!=null&&list.size()>0){
			//什么也不做
		}else{
			String sql="select * from t_teacher";
			DruidPooledConnection c = WiseDBPoolConnection.getInstance().getConnection();
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(sql);
			TransactionManager.get().open();
			while (rs.next()) {
				String name=rs.getString(2);
				String sex=rs.getInt(4)==0?"女":"男";
				String subject=rs.getString(5);
				
				insertTeacher(name,sex,subject);
				
			}
			TransactionManager.get().commit();

			rs.close();
			s.close();
			c.close();
		}
	}


	private void insertTeacher(String name, String sex, String subject) throws SQLException {
		// TODO Auto-generated method stub
		
		Fruit menu=new Fruit("teacher");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", name));
		m_s.add(new Seed("sex", sex));
		m_s.add(new Seed("subject", subject));
		FruitHandler.me().insertFruit(menu, m_s, null);
	}


	public void initStudent() throws SQLException {
		// TODO Auto-generated method stub
		List<Fruit_> list = MainCache.me().getFruitList("student");
		if(list!=null&&list.size()>0){
			//什么也不做
		}else{
			String sql="select * from t_student";
			DruidPooledConnection c = WiseDBPoolConnection.getInstance().getConnection();
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(sql);
			TransactionManager.get().open();
			while (rs.next()) {
				String name=rs.getString(2);
				String sex=rs.getInt(4)==0?"女":"男";
				String remark=rs.getString(7);
				
				insertStudent(name,sex,remark);
			}
			TransactionManager.get().commit();

			rs.close();
			s.close();
			c.close();
		}
	}


	private void insertModel(String name, String path, Long other) throws SQLException {
		// TODO Auto-generated method stub
		Fruit f1=new Fruit("model");
		List<Seed> s1=new ArrayList<Seed>();
		s1.add(new Seed("name", name));
		s1.add(new Seed("path", path));
		List<Long> others=new ArrayList<Long>();
		others.add(other);
		FruitHandler.me().insertFruit(f1, s1, others);
	}


	private Long insertMenu(String name) throws SQLException {
		// TODO Auto-generated method stub
		TransactionManager.get().open();
		Fruit menu=new Fruit("menu");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", name));
		FruitHandler.me().insertFruit(menu, m_s, null);
		TransactionManager.get().commit();
		return menu.getId();
	}
	
	private void insertStudent(String name,String sex,String remark) throws SQLException {
		// TODO Auto-generated method stub
		
		Fruit menu=new Fruit("student");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", name));
		m_s.add(new Seed("sex", sex));
		m_s.add(new Seed("remark", remark));
		FruitHandler.me().insertFruit(menu, m_s, null);
		
	}
	
	private Long insertMenu(String name,Long other) throws SQLException {
		// TODO Auto-generated method stub
		TransactionManager.get().open();
		Fruit menu=new Fruit("menu");
		List<Seed> m_s=new ArrayList<Seed>();
		m_s.add(new Seed("name", name));
		List<Long> others=new ArrayList<Long>();
		others.add(other);
		FruitHandler.me().insertFruit(menu, m_s, others);
		TransactionManager.get().commit();
		return menu.getId();
	}
	
}
