package com.u2.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Route {

	protected String routeStr;
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	public Route(String routeStr,HttpServletRequest request, HttpServletResponse response) {
		super();
		this.routeStr = routeStr;
		this.response = response;
		this.request=request;
	}
	public void render() {
		// TODO Auto-generated method stub
		try {
			request.getRequestDispatcher(routeStr).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
