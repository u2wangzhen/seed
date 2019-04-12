package com.u2.web.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TableManager;
import com.u2.web.SeedAction;

public class MainAction extends SeedAction{

	public String toMain(){
		
		String u = param("user");
		String p = param("password");
		List<Fruit_> list = MainCache.me().getFruitList("account");
		if(list!=null&&!list.isEmpty()){
			Fruit_ ff=null;
			for (Fruit_ f : list) {
				if(u.equals(f.getSeed("account").getValue())){
					ff=f;break;
				}
			}
			if(ff!=null){
				if(ff.getSeed("password").getValue().equals(p)){
					request.getSession().setAttribute("user_name", ff.getSeed("name").getValue());
					request.getSession().setAttribute("user_account", ff.getSeed("account").getValue());
					setRole(ff);
					return "/WEB-INF/page/main/main.jsp";
				}
			}
		}
		return "/WEB-INF/page/index.jsp";
	}
	private void setRole(Fruit_ ff) {
		// TODO Auto-generated method stub
		Set<Fruit_> ml=new HashSet<Fruit_>();
		Set<Fruit_> rs = ff.getOtherFruits("role");
		for (Fruit_ f : rs) {
			Set<Fruit_> ms = f.getOtherFruits("model");
			for (Fruit_ m : ms) {
				ml.add(m);
			}
		}
		request.getSession().setAttribute("user_role", ml);
	}
	public String home(){
		
		return "/WEB-INF/page/main/home.jsp";
	}
	public String getAllFruit(){
		Set<String> set = TableManager.me().findAllFruitKey();
		JSONArray array=new JSONArray();
		for(String k:set){
			
			List<Fruit_> list = MainCache.me().getFruitList(k);
			if(list!=null&&!list.isEmpty()){
				for (Fruit_ f : list) {
					JSONObject obj=new JSONObject();
					obj.put("id", f.getId());
					obj.put("key", f.getKey());
					obj.put("jsonStr", f.getJsonObj().toJSONString());		
					array.add(obj);
				}
			}
		}
	
		
		return array.toJSONString();
	}
}
