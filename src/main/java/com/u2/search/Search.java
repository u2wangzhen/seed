package com.u2.search;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.util.DateUtil;

public class Search {

	private Query query;
	private Fruit_[] fs=new Fruit_[1];
	public Search(String sql){///{{name_l=aaaa}and{id=123}and{{student_fid=in(1,2,3,4)}{}}}
		query.set(fs[0]);
		
		
		
	}
	
	public List<Fruit_> filterFruit(List<Fruit_> list){
		if(list!=null&&!list.isEmpty()){
			if(query==null){
				return list;
			}
			List<Fruit_> newlist=new ArrayList<Fruit_>();
			for (Fruit_ f : list) {
				fs[0]=f;
				if(query.filter()){
					newlist.add(f);
				}
			}
			return newlist;
		}
		return null;
	}
	
	
	private interface Filter{
		boolean filter();
		Filter set(Fruit_ f_);
	}
	
	private class Query implements Filter{
		Fruit_ f_;
		
		public Filter set(Fruit_ f_) {
			this.f_ = f_;
			return this;
		}
		
		boolean add=true;//or false;
		List<Filter> filters;
		
		public boolean filter(){
			if(filters!=null&&!filters.isEmpty()){
				for (Filter f : filters) {
					if(add){
						if(!f.filter()){
							return false;
						}
					}else{
						if(f.filter()){
							return true;
						}
					}
				}
			}			
			return true;
		}
		void addConditon(Filter f){
			if(filters==null){filters=new ArrayList<Search.Filter>();}
			filters.add(f.set(f_));
		}
		void orCondition(Filter f){
			add=false;
			if(filters==null){filters=new ArrayList<Search.Filter>();}
			filters.add(f.set(f_));
		}
	}
	
	private class Condition implements Filter{
		Fruit_ f_;
		String key="";
		KeyType keyType;
		String value;
		List<String> values;
		Type type;
		Converter converter;
		private Condition(Fruit_ f_,String key, KeyType keyType, String value, List<String> values, Type type,
				Converter converter) {
			this.f_=f_;
			this.key = key;
			this.keyType = keyType;
			this.value = value;
			this.values = values;
			this.type = type;
			this.converter = converter;
		}
		Condition(Fruit_ f_,String key, KeyType keyType, String value,Type type,Converter converter ){
			this(f_,key,keyType,value,null,type,converter);
		}
		
		Condition(Fruit_ f_,String key, KeyType keyType, List<String> values,Converter converter ){
			this(f_,key,keyType,null,values,Type.IN,converter);
		}
		public boolean filter(){
			boolean b=false;
			switch (this.keyType) {
			case seed:
				b=filterSeed();
				break;
			case other:
				b=filterOther();
				break;
			case cited:
				b=filterCited();
				break;
			case relation:
				b=filterRelation();
				break;
			default:
				b=filterId();
				break;
			}
			
			return b;
		}
		private boolean filterRelation() {
			// TODO Auto-generated method stub
			if(key.endsWith("_s")){
				List<String> list = findValueStr();
				return filterSeeds(list);
			}else{
				List<Long> list = findValueId();
				
				return filterIds(list);
				
			}
			
		}
		private boolean filterSeeds(List<String> list) {
			// TODO Auto-generated method stub
			if(list!=null&&!list.isEmpty()){
				for (String s : list) {
					if(filterSeed(s)){
						return true;
					}
				}
			}
			
			return false;
		}
		private boolean filterIds(List<Long> list) {
			// TODO Auto-generated method stub
			if(list!=null&&!list.isEmpty()){
				for (Long id : list) {
					if(filterId(id)){
						return true;
					}
				}
			}
			return false;
		}
		private boolean filterId(Long id) {
			// TODO Auto-generated method stub
			boolean b=false;
			switch (type) {
			case GTEQ:
				b=id>=Long.valueOf(value);
				break;
			case LTEQ:
				b=id<=Long.valueOf(value);
				break;
			case GT:
				b=id>Long.valueOf(value);
				break;
			case LT:
				b=id<Long.valueOf(value);
				break;
			case IN:
				b=filterInIdValues(id);
				break;
			default:
				b=id==Long.valueOf(value);
				break;
			}			
			return b;
		}
		private List<Long> findValueId() {
			// TODO Auto-generated method stub
			String[] ks = key.split(".");
			List<Fruit_> l=null;
			for (String k : ks) {
				l=findValue(l,k);				
			}
			List<Long> list=null;
			if(l!=null){
				list=new ArrayList<Long>();
				for (Fruit_ f : l) {
					list.add(f.getId());
				}
			}
			return list;
		}
		private List<String> findValueStr() {
			// TODO Auto-generated method stub
			String[] ks = key.split(".");
			List<Fruit_> l=null;
			for (String k : ks) {
				l=findValue(l,k);				
			}
			List<String> list=null;
			if(l!=null){
				list=new ArrayList<String>();
				for (Fruit_ f : l) {
					list.add(f.getSeed(ks[ks.length].split("_s")[0]).getValue());
				}
			}
			return list;
		}
		private List<Fruit_> findValue(List<Fruit_> l, String k) {
			// TODO Auto-generated method stub
			if(l==null){
				Set<Fruit_> set=null;
				if(k.endsWith("_o")){
					set = f_.getOtherFruits(k.split("_o")[0]);
				}
				if(k.endsWith("_c")){
					set = f_.getCitedFruits(k.split("_c")[0]);
				}
				if(set!=null&&!set.isEmpty()){
					List<Fruit_> list=new ArrayList<Fruit_>();
					list.containsAll(set);
					return list;
				}
			}else{
				if(!k.endsWith("_s")){
					List<Fruit_> list=null;
					for (Fruit_ f : l) {
						
						Set<Fruit_> set=null;
						if(k.endsWith("_o")){
							set = f.getOtherFruits(k.split("_o")[0]);
						}
						if(k.endsWith("_c")){
							set = f.getCitedFruits(k.split("_c")[0]);
						}
						
						if(set!=null&&!set.isEmpty()){
							if(list==null){
								list=new ArrayList<Fruit_>();
							}
							list.containsAll(set);
						}
					}
					if(list!=null){
						return list;
					}
				}else{
					return l;
				}
			}
			return null;
		}
		private boolean filterId() {
			// TODO Auto-generated method stub
			Long id=f_.getId();
			return filterId(id);
		}
		private boolean filterInIdValues(Long id) {
			// TODO Auto-generated method stub
			if(values!=null&&!values.isEmpty()){
				for (String s : values) {
					if(id==Long.valueOf(s)){
						return true;
					}
				}
			}
			return false;
		}
		private boolean filterCited() {
			// TODO Auto-generated method stub
			Set<Fruit_> set = f_.getCitedFruits(key);
			if(set!=null&&!set.isEmpty()){
				for (Fruit_ f : set) {
					if(f.getId()==Long.valueOf(value)){
						return true;
					}
				}
			}
			return false;
		}
		private boolean filterOther() {
			// TODO Auto-generated method stub
			Set<Fruit_> set = f_.getOtherFruits(key);
			if(set!=null&&!set.isEmpty()){
				for (Fruit_ f : set) {
					if(f.getId()==Long.valueOf(value)){
						return true;
					}
				}
			}
			return false;
		}
		private boolean filterSeed() {
			// TODO Auto-generated method stub
			String v = f_.getSeed(key).getValue();
			return filterSeed(v);
		}
		
		private boolean filterSeed(String sv) {
			// TODO Auto-generated method stub
			//String v = f_.getSeed(key).getValue();
			if(converter!=null){
				return filterNumberValue(sv);
			}
			return filterValue(sv);
		}
		
		private boolean filterNumberValue(String v) {
			// TODO Auto-generated method stub
			BigDecimal lv=converter.converter(v);			
			boolean b=false;
			switch (type) {
			case GTEQ:
				b=lv.compareTo(converter.converter(value))>=0;
				break;
			case LTEQ:
				b=lv.compareTo(converter.converter(value))<=0;
				break;
			case GT:
				b=lv.compareTo(converter.converter(value))>0;
				break;
			case LT:
				b=lv.compareTo(converter.converter(value))<0;
				break;
			case IN:
				b=filterInValues(lv);
				break;
			default:
				b=lv.compareTo(converter.converter(value))==0;
				break;
			}
			return b;
			
		}
		private boolean filterInValues(BigDecimal lv) {
			// TODO Auto-generated method stub
			if(values!=null&&!values.isEmpty()){
				for (String s : values) {
					if(lv.compareTo(converter.converter(s))==0){
						return true;
					}
				}
			}
			return false;
			
		}
		private boolean filterValue(String v) {
			// TODO Auto-generated method stub
			boolean b=false;
			switch (type) {
			case LIKE:
				b=v.contains(value);
				break;
			case IN:
				b=filterInValues(v);
				break;
			default:
				b=v.equals(value);
				break;
			}
			return b;
		}
		private boolean filterInValues(String v) {
			// TODO Auto-generated method stub
			
			if(values!=null&&!values.isEmpty()){
				for (String s : values) {
					if(s.equals(v)){
						return true;
					}
				}
			}
			return false;
		}
		public Filter set(Fruit_ f_) {
			// TODO Auto-generated method stub
			this.f_=f_;
			return this;
		}
		
	}
	private enum Type{
		IN,LIKE,EQ,GTEQ,LTEQ,GT,LT
	}
	private enum KeyType{
		seed,id,other,cited,relation
	}
	private enum Converter{
		number,date_,datetime_;
		BigDecimal converter(String value){
			BigDecimal obj=null;
			switch (this) {
			case date_:
				obj=new BigDecimal(DateUtil.convert2Date(value, "yyyy-MM-dd").getTime());
				break;
			case datetime_:
				obj=new BigDecimal(DateUtil.convert2Date(value, "yyyy-MM-dd HH:mm:ss").getTime());
				break;
			default:
				obj=new BigDecimal(value);
				break;
			}
			return obj;
		}
	}
}
