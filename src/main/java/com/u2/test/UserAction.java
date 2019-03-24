package com.u2.test;

import com.u2.web.SeedAction;

public class UserAction extends SeedAction{

	
	public String index() {
		// TODO Auto-generated method stub
		return "/user/index.jsp";
	}

	public String getUser() {
		// TODO Auto-generated method stub
		return "{data:1}";
	}

}
