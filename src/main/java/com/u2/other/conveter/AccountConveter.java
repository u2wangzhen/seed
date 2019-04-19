package com.u2.other.conveter;


import com.alibaba.fastjson.JSONObject;
import com.u2.converter.DefaultConverter;
import com.u2.db.cache.Fruit_;
import com.u2.util.MD5;

public class AccountConveter extends DefaultConverter{

	public AccountConveter(String key) {
		super(key);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void form2Fruit() {
		// TODO Auto-generated method stub
		String pw="774cebe300467d94cbc4d9fdfa8fe5da";
		String[] p = param.get("password");
		if(p!=null&&p.length>0){
			pw=MD5.encrypt(p[0]);
			p[0]=pw;
		}
		super.form2Fruit();
		//seeds.add(new Seed("password", pw));
	}
	
	@Override
	public JSONObject fruit2Form(Fruit_ f) {
		// TODO Auto-generated method stub
		JSONObject obj = super.fruit2Form(f);
		obj.put("password", "******");
		return obj;
	}
}
