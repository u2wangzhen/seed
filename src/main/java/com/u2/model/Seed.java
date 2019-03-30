package com.u2.model;


public class Seed {

	private Long id;
	private String key;
	private String value;
	private Long fid;
	
	public Seed(){}
	public Seed(String key, String... value) {
		// TODO Auto-generated constructor stub
		if(value!=null&&value.length>0){
			if(value.length>1){
				String str="";
				for (int i = 0; i < value.length; i++) {
					if(i!=0){
						str+=",";
					}
					str+=value[i];
				}
				this.value=str;
			}else{
				this.value=value[0];
			}
		}
		
		this.key=key;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Long getFid() {
		return fid;
	}
	public void setFid(Long fid) {
		this.fid = fid;
	}
	
	
	
}
