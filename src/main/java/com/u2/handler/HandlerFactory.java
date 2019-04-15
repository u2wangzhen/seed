package com.u2.handler;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import com.u2.other.handler.LessonAddHandler;
import com.u2.other.handler.LessonGetAllHandler;
import com.u2.web.ActionType;
import com.u2.web.SeedAction;

public class HandlerFactory {

	private static HandlerFactory me = new HandlerFactory();
	private Map<String, Class<?>> map = new HashMap<String, Class<?>>();

	private HandlerFactory() {
		map.put("lesson_add", LessonAddHandler.class);
		map.put("lesson_getAll", LessonGetAllHandler.class);
	}

	public static HandlerFactory me() {
		return me;
	}

	public Handler createHandler(ActionType type, String key, Map<String, String[]> param, SeedAction action) {
		Handler handler = null;

		Class<?> cla =  map.get(key+"_"+type.toString());
		if (cla != null) {
			try {
				Constructor<?> c = cla.getConstructor( Map.class,String.class,SeedAction.class);
				Object[] objs = new Object[] { param,key,action };
				handler=(Handler) c.newInstance(objs);
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

			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{

			switch (type) {
			case add:
				handler = new AddHandler(param, key, action);
				break;
			case update:
				handler = new UpdateHandler(param, key, action);
				break;
			case delete:
				handler = new DeleteHandler(param, key, action);
				break;
			case page:
				handler = new PageHandler(param, key);
				break;
			case getAll:
				handler = new GetAllHandler(param, key);
				break;
			case getOne:
				handler = new GetOneHandler(param, key);
				break;
			default:
				break;
			}
		}
		return handler;
	}
}
