package com.u2.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SeedFilter  implements Filter{

	private ActionMapping actionMapping;
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		String url=request.getRequestURI();
		
		String key = url.substring(url.lastIndexOf("/")+1, url.length());
		
		Class<SeedAction> actionClass = (Class<SeedAction>) actionMapping.getActionClass(key);
		
		try {
			SeedAction act = actionClass.newInstance();
			act.setRequest(request);
			act.setResponse(response);
			act.setKey(key);
			act.exec();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		actionMapping=ActionMapping.me();
	}

}
