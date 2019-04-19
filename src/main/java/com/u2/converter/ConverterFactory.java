package com.u2.converter;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import com.u2.other.conveter.AccountConveter;
import com.u2.other.conveter.ClassAccountConveter;
import com.u2.other.conveter.LessonConverter;

public class ConverterFactory {
	
	private static ConverterFactory cf=new ConverterFactory();
	private Map<String,Class<?>> map=new HashMap<String,Class<?>>();
	private ConverterFactory(){
		map.put("lesson", LessonConverter.class);
		map.put("classaccount", ClassAccountConveter.class);
		map.put("account", AccountConveter.class);
	}
	public static ConverterFactory me(){
		return cf;
	}
	
	public Converter converter(String key){
		Converter ccc=null;
		Class<?> c = map.get(key);
		if(c==null){
			ccc=new DefaultConverter(key);
		}else{
			
			try {
				Constructor<?> cc = c.getConstructor(String.class);
				ccc=(Converter) cc.newInstance(key);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ccc;
	}
	
}
