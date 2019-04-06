package com.u2.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.Seed_;

abstract class SearchHandler extends Handler{

	protected Search search;
	
	public SearchHandler(Map<String, String[]> param, String key) {
		super(param, key);
		// TODO Auto-generated constructor stub
		if(param!=null&&param.size()>0){
			Set<String> ks = param.keySet();
 			ks.remove("rows");
			ks.remove("page");
			if(ks!=null&&!ks.isEmpty()){
				search=new Search();
				for(String k:ks){
					search.addFactor(k, param.get(k)[0]);
				}
			}
		}
		
	}
	
	protected List<Fruit_> filterFruit(List<Fruit_> list){
		if(list!=null&&!list.isEmpty()){
			if(search.fs==null||search.fs.isEmpty()){
				return list;
			}
			List<Fruit_> newlist=new ArrayList<Fruit_>();
			for (Fruit_ f : list) {
				if(search.filter(f)){
					newlist.add(f);
				}
			}
			
			//return newlist.isEmpty()?list:newlist;
			return newlist;
		}
		return null;
	}

	private class Search{
		List<Factor> fs;
		void addFactor(String key,String value){
			if(value!=null&&!"".equals(value.trim())){
				if(fs==null){fs=new ArrayList<Factor>();}
				fs.add(new Factor(key, value));
			}
			
		}
		boolean filter(Fruit_ f) {
			// TODO Auto-generated method stub
			boolean b=false;
			
			for (Factor factor : fs) {
				if(factor.isRelation){
					Set<Fruit_> s = f.getOtherFruits(factor.seedKey);
					if(s!=null&&!s.isEmpty()){
						for (Fruit_ fruit_ : s) {
							if(fruit_.getId()==Long.valueOf(factor.value)){
								b=true;
								break;
							}
						}
					}
				}else{
					Seed_ seed = f.getSeeds().get(factor.seedKey);
					if(seed!=null){
						if(factor.isLike){
							b=seed.getValue().indexOf(factor.value)>=0;
						}else{
							b=seed.equalsValue(factor.value);
						}
						
					}
				}
				if(!b){
					return false;
				}
				
			}
			return true;
		}
	}
	private class Factor{
		String seedKey;
		String value;
		boolean isLike=false;
		boolean isRelation=false;
		public Factor(String searchKey, String value) {
			if(searchKey.endsWith("_l")){
				this.isLike = true;
				this.seedKey=searchKey.split("_l")[0];
			}else if(searchKey.endsWith("_fid")){
				this.isRelation = true;
				this.seedKey=searchKey.split("_fid")[0];
			}else{
				this.seedKey=searchKey;
			}
			
			this.value = value;
			
		}
	}
}
