package com.u2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.handler.AddHandler;
import com.u2.handler.DeleteHandler;
import com.u2.handler.GetAllHandler;
import com.u2.handler.GetOneHandler;
import com.u2.handler.PageHandler;
import com.u2.handler.UpdateHandler;

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
		try {
			this.type = ActionType.valueOf(type);
		} catch (Exception e) {
			this.type = ActionType.other;
			this.method = type;
		}

	}

	protected Map<String, String[]> param;

	protected HttpServletRequest request;
	protected HttpServletResponse response;

	protected ActionType type;

	String getReturnJsonStr() {
		return returnJsonStr;
	}

	void setRequest(HttpServletRequest request) {
		this.request = request;
		this.param = request.getParameterMap();
	}

	void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	protected String param(String key) {
		if (param != null && !param.isEmpty()) {
			String[] p = param.get(key);
			if (p != null && p.length > 0) {
				return p[0];
			}
		}
		return null;
	}

	void exec() {
		if (key == null) {
			new Route("/WEB-INF/page/index.jsp", request, response).render();
		} else {
			Object account = request.getSession().getAttribute("user_account");
			if (account == null&&!"maintoMain".equals((key+method))) {
				new Route("/WEB-INF/page/index.jsp", request, response).render();
			}else{
				switch (type) {
				case add:
					returnJsonStr = new AddHandler(param, key).exec();
					break;
				case update:
					returnJsonStr = new UpdateHandler(param, key).exec();
					break;
				case delete:
					returnJsonStr = new DeleteHandler(param, key).exec();
					break;
				case page:
					returnJsonStr = new PageHandler(param, key).exec();
					break;
				case getAll:
					returnJsonStr = new GetAllHandler(param, key).exec();
					break;
				case getOne:
					returnJsonStr = new GetOneHandler(param, key).exec();
					break;
				default:
					String str = execMethod();
					if (str.endsWith(".jsp")) {
						routeStr = str;
					} else {
						returnJsonStr = str;
					}
					break;
				}
				if (returnJsonStr != null && !"".equals(returnJsonStr)) {
					outJson();
				} else {

					new Route(routeStr, request, response).render();
				}
			}			
		}
	}

	private String execMethod() {
		// TODO Auto-generated method stub
		String str;
		try {
			str = (String) this.getClass().getMethod(method, null).invoke(this, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			if (key != null && !"".equals(key)) {
				Set<String> ks = param.keySet();
				if (ks != null && !ks.isEmpty()) {
					for (String k : ks) {
						request.setAttribute(k, param.get(k)[0]);
					}
				}
				str = "/WEB-INF/page/" + key + "/index.jsp";
			} else {
				str = "/WEB-INF/page/index.jsp";
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

	public String toAdd() {
		Set<String> ks = param.keySet();
		if (ks != null && !ks.isEmpty()) {
			for (String k : ks) {
				request.setAttribute(k, param.get(k)[0]);
			}
		}
		return "/WEB-INF/page/" + key + "/add.jsp";
	}

	public String toSelect() {
		return "/WEB-INF/page/" + key + "/select.jsp";
	}

	public String toEdit() {
		String id = param("id");
		if (id != null && !"".equals(id)) {
			// Fruit_ f = MainCache.me().getFruit(key,Long.valueOf(id));
			Fruit_ f = MainCache.me().getFruit(Long.valueOf(id));
			JSONObject obj = f.getJsonObj();
			Set<String> set = obj.keySet();
			for (String seedKey : set) {
				request.setAttribute(seedKey, obj.get(seedKey));
			}
			Map<String, Set<Fruit_>> map = f.getOtherFruits();
			if (map != null) {
				Set<String> s = map.keySet();
				for (String sk : s) {
					request.setAttribute(sk, map.get(sk));
				}
			}
		}
		return "/WEB-INF/page/" + key + "/edit.jsp";
	}

	public String validate() {

		String skey = param("skey");
		String value = param("value");
		String id = param("id");

		if (skey != null && !"".equals(skey) && value != null && !"".equals(value)) {
			List<Fruit_> list = MainCache.me().getFruitList(key);
			for (Fruit_ f : list) {
				if (!"n".equals(id)) {
					if (f.getId() == Long.valueOf(id)) {
						continue;
					}
				}
				if (value.equals(f.getSeed(skey).getValue())) {
					return "1";
				}
			}
		}
		return "0";
	}

}
