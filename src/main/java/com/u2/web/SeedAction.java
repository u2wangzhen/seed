package com.u2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.u2.web.handler.AddHandler;
import com.u2.web.handler.DeleteHandler;
import com.u2.web.handler.UpdateHandler;

public abstract class SeedAction {

	protected String returnJsonStr;
	protected String routeStr;
	
	protected String key;
	
	void setKey(String key) {
		this.key = key;
	}

	protected Map<String,String[]> param;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	protected ActionType type=ActionType.route;
	
	String getReturnJsonStr() {
		return returnJsonStr;
	}
	void setRequest(HttpServletRequest request) {
		this.request = request;
		this.param=request.getParameterMap();
		String[] t=param.get("type");
		if(t!=null){
			type=ActionType.valueOf(t[0]);
		}
		
	}
	void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	void exec(){
		switch (type) {
		case add:
			returnJsonStr=new AddHandler(param,key).exec();
			break;
		case update:
			returnJsonStr=new UpdateHandler(param, key).exec();
			break;
		case delete:
			returnJsonStr=new DeleteHandler(param, key).exec();
			break;
		case select:
			returnJsonStr=select();
			break;
		default:
			routeStr=route();
			break;
		}
		if(returnJsonStr!=null&&!"".equals(returnJsonStr)){
			outJson();
		}else{
			new Route(routeStr,request,response).render();
		}
	}
	private void outJson() {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(returnJsonStr);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected abstract String route();
	
	protected abstract String select();
	
}
