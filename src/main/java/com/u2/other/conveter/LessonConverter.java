package com.u2.other.conveter;


import com.u2.converter.DefaultConverter;
import com.u2.model.Seed;
import com.u2.util.DateUtil;

public class LessonConverter extends DefaultConverter{

	public LessonConverter(String key) {
		super(key);
		// TODO Auto-generated constructor stub
	}
	@Override
	public void form2Fruit() {
		// TODO Auto-generated method stub
		 super.form2Fruit();
		 seeds.add(new Seed("createTime", DateUtil.getCurrentDate("yyyy-MM-dd")));
	}
}
