package com.u2.search;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.util.DateUtil;

public class Search {

	private Query query;
	private Fruit_[] fs=new Fruit_[1];
	private String fkey;
	public Search(String fkey,String sql){///{{name_l=aaaa}and{id=123}and{{student_fid=in(1,2,3,4)}{}}}
		this.fkey=fkey;
		this.query=new Query(sql);
	}
	public Search(String sql){///{{name_l=aaaa}and{id=123}and{{student_fid=in(1,2,3,4)}{}}}
		//this.fkey=fkey;
		System.out.println(sql);
		this.query=new Query(sql);
	}
	
	public List<Fruit_> filterFruit(){
		if(fkey!=null){
			return filterFruit(MainCache.me().getFruitList(fkey));
		}else{
			return null;
		}
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
	}
	
	public static List<String> decompose(String sql) {
		// TODO Auto-generated method stub
		List<String> list=null;
		String s=sql;
		String str=decomposeStr(s);		
		if(str.equals(s)){
			if(list==null){list=new ArrayList<String>();}
			list.add(str);
		}else{
			if(list==null){list=new ArrayList<String>();}
			list.add(str);
			while(!str.equals(s)){
				s=s.substring(str.length());
				str=decomposeStr(s);
				list.add(str);
			}
		}
		return list;
	}
	private static String decomposeStr(String sql) {
		// TODO Auto-generated method stub
		if(sql.indexOf("{")==0&&sql.indexOf("}")>0){
			int s=sql.indexOf("{",1);
			int end=sql.indexOf("}",1);
			if(s>0&&end<s||s<0){
				return sql.substring(sql.indexOf("{"), sql.indexOf("}")+1);
			}else{
				
				int x=1;
				
				while(x>0){
					
					if(s<end&&s>0){
						x++;
						s=sql.indexOf("{", s+1);
					}else{
						x--;
						if(x==0){break;}
						end=sql.indexOf("}",end+1);
					}
				}
				return sql.substring(0, end+1);
			}
		}
		return null;
	}


	private class Query implements Filter{
		
		
		Query(String sql) {///{and{name_l=aaaa}{id=123}{or{student_fid=in,1,2,3,4)}{bbb=ccc}}}
			// TODO Auto-generated constructor stub
			filters=new ArrayList<Search.Filter>();
			sql=sql.substring(1, sql.length()-1);
			if(sql.startsWith("or")){
				and=false;
				sql=sql.substring(2);
			}
			if(sql.startsWith("and")){
				sql=sql.substring(3);
			}
			
			List<String> ss=decompose(sql);
			for (String s : ss) {
				if(s.startsWith("{and{")||s.startsWith("{or{")){
					filters.add(new Query(s));
				}else{
					filters.add(new Condition(s));
				}
			}
		}
		
		boolean and=true;//or false;
		List<Filter> filters;
		
		public boolean filter(){
			if(filters!=null&&!filters.isEmpty()){
				for (Filter f : filters) {
					if(and){
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
		
	}
	
	private class Condition implements Filter{
		
		String key="";
		KeyType keyType;
		String value;
		List<String> values;
		Type type;
		Converter converter;
		/*private Condition(Fruit_ f_,String key, KeyType keyType, String value, List<String> values, Type type,
				Converter converter) {
			this.f_=f_;
			this.key = key;
			this.keyType = keyType;
			this.value = value;
			this.values = values;
			this.type = type;
			this.converter = converter;
		}*/
		/*Condition(Fruit_ f_,String key, KeyType keyType, String value,Type type,Converter converter ){
			this(f_,key,keyType,value,null,type,converter);
		}
		
		Condition(Fruit_ f_,String key, KeyType keyType, List<String> values,Converter converter ){
			this(f_,key,keyType,null,values,Type.IN,converter);
		}*/
		Condition(String sql) {
			// TODO Auto-generated constructor stub
			sql=sql.substring(1, sql.length()-1);
			String[] s = sql.split("=");
			String k=s[0];
			String v=s[1];
			
			if(k.startsWith("_id")){
				this.key=k.split("_id")[0];
				this.keyType=KeyType.id;
			}else if(k.endsWith("_fid")){
				this.key=k.split("_fid")[0];
				this.keyType=KeyType.other;
			}else if(k.endsWith("_cited")){
				this.key=k.split("_cited")[0];
				this.keyType=KeyType.cited;
			}else if(k.indexOf("@")>0){
				this.key=k;
				this.keyType=KeyType.relation;
			}else if(k.endsWith("_l")){
				this.key=k.split("_l")[0];
				this.keyType=KeyType.seed;
				this.type=Type.LIKE;
			}else{
				this.key=k;
				this.keyType=KeyType.seed;
			}
			
			String[] vs = v.split(",");
			if(vs.length==1){
				value=v;
				if(type==null){
					type=Type.EQ;
				}
			}else{
				if(vs[vs.length-1].endsWith("_c")){
					if(vs[vs.length-1].startsWith("number")){
						converter=Converter.number;
					}
					if(vs[vs.length-1].startsWith("date")){
						converter=Converter.date_;
					}
					if(vs[vs.length-1].startsWith("datetime")){
						converter=Converter.datetime_;
					}
					vs[vs.length-1]="";
				}
				
				if(vs[0].equals("IN")){
					type=Type.IN;
					values=new ArrayList<String>();
					for (int i = 1; i < vs.length; i++) {
						if(!"".equals(s[i])){
							values.add(s[i]);
						}
					}
				}else if(vs[0].equals("LIKE")){
					type=Type.LIKE;
					value=vs[1];
				}else if(vs[0].equals("GT")){
					type=Type.GT;
					value=vs[1];
				}else if(vs[0].equals("GTEQ")){
					type=Type.GTEQ;
					value=vs[1];
				}else if(vs[0].equals("LT")){
					type=Type.LT;
					value=vs[1];
				}else if(vs[0].equals("LTEQ")){
					type=Type.LTEQ;
					value=vs[1];
				}else{
					if(type==null){
						type=Type.EQ;
					}
					value=vs[0];
				}
			}			
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
			String[] ks = key.split("@");
			List<Fruit_> l=null;
			for (String k : ks) {
				l=findValue(l,k);				
			}
			List<String> list=null;
			if(l!=null){
				list=new ArrayList<String>();
				for (Fruit_ f : l) {
					list.add(f.getSeed(ks[ks.length-1].split("_s")[0]).getValue());
				}
			}
			return list;
		}
		private List<Fruit_> findValue(List<Fruit_> l, String k) {
			// TODO Auto-generated method stub
			if(l==null){
				Set<Fruit_> set=null;
				if(k.endsWith("_o")){
					set = fs[0].getOtherFruits(k.split("_o")[0]);
				}
				if(k.endsWith("_c")){
					set = fs[0].getCitedFruits(k.split("_c")[0]);
				}
				if(set!=null&&!set.isEmpty()){
					List<Fruit_> list=new ArrayList<Fruit_>();
					list.addAll(set);
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
							list.addAll(set);
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
			Long id=fs[0].getId();
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
			Set<Fruit_> set = fs[0].getCitedFruits(key);
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
			Set<Fruit_> set = fs[0].getOtherFruits(key);
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
			String v = fs[0].getSeed(key).getValue();
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
