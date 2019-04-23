package com.u2.util;

import java.util.Set;

import com.u2.db.cache.Fruit_;

public class FruitUtil {

	public static Fruit_ index1(Set<Fruit_> set){
		if(set!=null&&!set.isEmpty()){
			for (Fruit_ fruit_ : set) {
				return fruit_;
			}
		}
		return null;
	}
	public static String outMassage(boolean b){
		String m="";
		if(b){
			m="操作成功!";
		}else{
			m="操作失败!";
		}
		return outMassage(b,m);
	}
	public static String outMassage(boolean b,String m){
		String msg="{\"success\":"+b+",\"message\":\""+m+"\"}";;
		return msg;
	}
}
