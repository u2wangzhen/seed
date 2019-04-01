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

import com.u2.db.cache.MainCache;
import com.u2.db.manager.TableManager;
import com.u2.sys.ActionMapping;
import com.u2.web.action.DefaultAction;

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
		request.setCharacterEncoding("utf-8");
		String url=request.getRequestURI();
		//parseUrl(url);
		///String key = url.substring(url.lastIndexOf("/")+1, url.length());
		if(url.endsWith(".js")||url.endsWith(".css")||url.endsWith(".png")||url.endsWith(".jpg")||url.endsWith(".JPG")){
			fc.doFilter(request, response);
		}else{
			url=url.substring(1);
			String[] s = url.split("/");
			String type="index";
			String key=null;
			if(s.length==3){
				key=s[1];
				type=s[2];
			}
			if(s.length==2){
				key=s[1];
			}
			Class<?> actionClass=null;
			if(key!=null){
				 actionClass = actionMapping.getActionClass(key);
			}
			if(actionClass==null){
				actionClass=DefaultAction.class;
			}
			
			
			try {
				SeedAction act = (SeedAction) actionClass.newInstance();
				act.setRequest(request);
				act.setResponse(response);
				act.setRoot(s[0]);
				act.setKey(key);
				act.setType(type);
				act.exec();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		actionMapping=ActionMapping.me();
		((TableManager)TableManager.me()).init();
		((MainCache)MainCache.me()).init();
	}

}
