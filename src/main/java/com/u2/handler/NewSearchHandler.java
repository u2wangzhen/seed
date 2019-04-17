package com.u2.handler;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.search.Search;

abstract class NewSearchHandler extends Handler {

	protected Search search;

	public NewSearchHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
		if (param != null && param.size() > 0) {
			Set<String> ks = param.keySet();
			// ks.remove("rows");
			// ks.remove("page");
			if (ks != null && !ks.isEmpty()) {
				String sql = "{and";
				boolean b=false;
				for (String k : ks) {
					if (!"rows".equals(k) && !"page".equals(k)) {
						String p = param(k);
						if(p!=null&&!p.trim().equals("")){
							b=true;
							if(k.endsWith("_index")){
								k=k.substring(0, k.length()-8);
							}
							sql += "{" + k + "=" + p + "}";
						}
					}
				}
				sql += "}";
				if(b){
					search = new Search(sql);
				}
			}
		}
	}

	protected List<Fruit_> filterFruit(List<Fruit_> list) {
		if (search == null) {
			return list;
		}else{
			return search.filterFruit(list);
		}
	}

}
