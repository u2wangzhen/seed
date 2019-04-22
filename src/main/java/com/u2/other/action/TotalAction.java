package com.u2.other.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.other.action.vo.PeriodVo;
import com.u2.other.action.vo.TotalVo;
import com.u2.search.Search;
import com.u2.util.DateUtil;
import com.u2.util.FruitUtil;
import com.u2.web.SeedAction;

public class TotalAction extends SeedAction {

	public String toSalary() {
		return "/WEB-INF/page/" + key + "/salary.jsp";
	}

	public String toSalaryTotal() {

		String m = param("month");
		if (m == null || "".equals(m)) {
			m = DateUtil.convert2String(new Date(), "yyyy-MM");
		}
		Search search = new Search("period", "{and{pdate=LIKE," + m + "}}");
		List<Fruit_> list = search.filterFruit();
		if (list != null && !list.isEmpty()) {
			TotalVo tv = new TotalVo();
			for (Fruit_ p : list) {
				double ph = Double.valueOf(p.getSeed("phour").getValue());

				Set<Fruit_> stus = p.getOtherFruits("student");

				Fruit_ lesson = FruitUtil.index1(p.getOtherFruits("lesson"));

				Fruit_ teacher = FruitUtil.index1(lesson.getOtherFruits("teacher"));

				int tp = Integer.valueOf(lesson.getSeed("tprice").getValue());
				int bp = Integer.valueOf(lesson.getSeed("bprice").getValue());

				double salary = ph * ((stus.size() - 1) * bp + tp);

				double income = 0.0;
				Set<Fruit_> prices = lesson.getCitedFruits("price");
				for (Fruit_ price : prices) {
					if (stus.contains(FruitUtil.index1(price.getOtherFruits("student")))) {
						int pri = Integer.valueOf(price.getSeed("price").getValue());
						income += pri * ph;
					}
				}

				String lessonName = lesson.getSeed("name").getValue();

				String teacherName = teacher.getSeed("name").getValue();

				String stuNames = buildStudentsName(stus);

				String date = p.getSeed("pdate").getValue();
				String start = p.getSeed("startTime").getValue();
				String end = p.getSeed("endTime").getValue();

				tv.addPeriod(new PeriodVo(income, income - salary, salary, ph, date, start, end, stuNames), m,
						teacherName, lessonName);

			}

			request.setAttribute("total", tv);
		}
		return "/WEB-INF/page/" + key + "/salary_total.jsp";
	}

	private String buildStudentsName(Set<Fruit_> stus) {
		// TODO Auto-generated method stub
		String str = "";
		boolean b = true;
		for (Fruit_ fruit_ : stus) {
			String name = fruit_.getSeed("name").getValue();
			if (b) {
				str += name;
				b = false;
			} else {
				str += "," + name;
			}
		}
		return str;
	}

	public String toDateTotal() {
		JSONObject obj = new JSONObject();
		String d = param("date");
		List<Fruit_> list = new Search("period", "{and{pdate=" + d + "}}").filterFruit();
		if (list != null && !list.isEmpty()) {

			int times = list.size();
			double hour = 0.0;
			List<String> students = new ArrayList<String>();
			List<String> teachers = new ArrayList<String>();
			for (Fruit_ p : list) {
				hour += Double.valueOf(p.getSeed("phour").getValue());

				Set<Fruit_> stus = p.getOtherFruits("student");
				for (Fruit_ s : stus) {
					String sn = s.getSeed("name").getValue();
					if (!students.contains(sn)) {
						students.add(sn);
					}
				}
				Fruit_ lesson = FruitUtil.index1(p.getOtherFruits("lesson"));
				Fruit_ teacher = FruitUtil.index1(lesson.getOtherFruits("teacher"));
				String tn = teacher.getSeed("name").getValue();
				if (!teachers.contains(tn)) {
					teachers.add(tn);
				}
			}
			obj.put("times", times);
			obj.put("hour", hour);
			obj.put("students", students);
			obj.put("teachers", teachers);
		}
		List<Fruit_> l2 = new Search("student", "{and{birthday=LIKE," + d.substring(4) + "}}").filterFruit();
		if (l2 != null && !l2.isEmpty()) {
			List<String> students = new ArrayList<String>();
			for (Fruit_ s : l2) {
				students.add(s.getSeed("name").getValue());
			}
			obj.put("birthdays", students);
		}
		obj.put("date", d);
		return obj.toJSONString();
	}

	public String toMonthTotal() {
		JSONObject obj = new JSONObject();
		String m = param("month");
		List<Fruit_> list = new Search("period", "{and{pdate=LIKE," + m + "}}").filterFruit();
		if (list != null && !list.isEmpty()) {
			int times = list.size();
			double hour = 0.0;
			for (Fruit_ p : list) {
				hour += Double.valueOf(p.getSeed("phour").getValue());
			}
			obj.put("times", times);
			obj.put("hour", hour);
		}
		List<Fruit_> l2 = new Search("student", "{and{birthday=LIKE," + m.substring(4) + "-}}").filterFruit();
		if (l2 != null && !l2.isEmpty()) {
			List<String> students = new ArrayList<String>();
			for (Fruit_ s : l2) {
				students.add(s.getSeed("name").getValue());
			}
			obj.put("birthdays", students);
		}
		
		List<Fruit_> l3 = MainCache.me().getFruitListDesc("classaccount");
		if(l3!=null&&!l3.isEmpty()){
			List<String> restClas =null;
			for (Fruit_ acc : l3) {
				double r=rest(acc);
				if(r<0){
					if(restClas==null){restClas= new ArrayList<String>();}
					restClas.add(acc.getSeed("name").getValue()+"("+r+")");
				}
			}
			if(restClas!=null){
				obj.put("restClas", restClas);
			}
			
		}
		
		obj.put("month", m);
		return obj.toJSONString();
	}
	
	public double rest(Fruit_ f) {
		// TODO Auto-generated method stub
		
		Set<Fruit_> set = f.getCitedFruits("recharge");
		double i=0;
		if(set!=null&&!set.isEmpty()){
			for (Fruit_ t : set) {
				i+=Double.valueOf(t.getSeed("times").getValue());
			}
		}
		double j=0;
		Set<Fruit_> ss = f.getOtherFruits("student");
		Fruit_ stu=null;
		for (Fruit_ s : ss) {
			stu=s;
		}
		
		Set<Fruit_> ts = f.getOtherFruits("lesson");
		
		
		Set<Fruit_> ps = stu.getCitedFruits("period");
		for (Fruit_ p : ps) {
			Set<Fruit_> pl = p.getOtherFruits("lesson");
			Fruit_ les=null;
			for (Fruit_ s : pl) {
				les=s;
			}
			if(ts.contains(les)){
				j+=Double.valueOf(p.getSeed("phour").getValue());
			}
		}
		
		return i-j;
	}

}
