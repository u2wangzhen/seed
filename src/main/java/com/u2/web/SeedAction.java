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
	protected String root;
	protected String method;
	
	void setKey(String key) {
		this.key = key;
	}

	void setRoot(String root) {
		this.root = root;
	}
	void setMethod(String method) {
		this.method = method;
	}
	
	void setType(String type) {
		try{
			this.type = ActionType.valueOf(type);
		}catch(Exception e){
			this.type=ActionType.other;
			this.method=type;
		}
		
	}

	protected Map<String,String[]> param;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	protected ActionType type;
	
	String getReturnJsonStr() {
		return returnJsonStr;
	}
	void setRequest(HttpServletRequest request) {
		this.request = request;
		this.param=request.getParameterMap();
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
		default:
			String str = execMethod();
			if(str.endsWith(".jsp")){
				routeStr=str;
			}else{
				returnJsonStr=str;
			}
			break;
		}
		if(returnJsonStr!=null&&!"".equals(returnJsonStr)){
			outJson();
		}else{
			new Route(routeStr,request,response).render();
		}
	}
	private String execMethod() {
		// TODO Auto-generated method stub
		String str;
			try {
				str=(String) this.getClass().getMethod(method, null).invoke(this, null);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				if(key!=null&&!"".equals(key)){
					str="index.jsp";
				}else{
					str="/index.jsp";
				}
				
			} 
		return str;
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

}
