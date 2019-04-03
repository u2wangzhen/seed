package com.u2.web.action;

import com.u2.web.SeedAction;

public class MainAction extends SeedAction{

	public String toMain(){
		
		return "/WEB-INF/page/main/main.jsp";
	}
	public String home(){
		
		return "/WEB-INF/page/main/home.jsp";
	}
}
