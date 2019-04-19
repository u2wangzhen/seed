package com.u2.other.action;

import java.util.Date;
import java.util.List;
import java.util.Set;

import com.u2.db.cache.Fruit_;
import com.u2.other.action.vo.PeriodVo;
import com.u2.other.action.vo.TotalVo;
import com.u2.search.Search;
import com.u2.util.DateUtil;
import com.u2.util.FruitUtil;
import com.u2.web.SeedAction;

public class TotalAction extends SeedAction{
	
	public String toSalary(){
		return "/WEB-INF/page/" + key + "/salary.jsp";
	}
	public String toSalaryTotal(){
		
		String m=param("month");
		if(m==null||"".equals(m)){
			m=DateUtil.convert2String(new Date(), "yyyy-MM");
		}
		Search search=new Search("period", "{and{pdate=LIKE,"+m+"}}");
		List<Fruit_> list = search.filterFruit();
		if(list!=null&&!list.isEmpty()){
			TotalVo tv=new TotalVo();
			for (Fruit_ p : list) {
				double ph = Double.valueOf(p.getSeed("phour").getValue());
				
				Set<Fruit_> stus = p.getOtherFruits("student");
				
				Fruit_ lesson = FruitUtil.index1(p.getOtherFruits("lesson"));
				
				Fruit_ teacher= FruitUtil.index1(lesson.getOtherFruits("teacher"));
				
				int tp=Integer.valueOf(lesson.getSeed("tprice").getValue());
				int bp=Integer.valueOf(lesson.getSeed("bprice").getValue());
				
				double salary=ph*((stus.size()-1)*bp+tp);
				
				double income=0.0;
				Set<Fruit_> prices = lesson.getCitedFruits("price");
				for (Fruit_ price : prices) {
					if(stus.contains(FruitUtil.index1(price.getOtherFruits("student")))){
						int pri=Integer.valueOf(price.getSeed("price").getValue());
						income+=pri*ph;
					}
				}
				
				String lessonName=lesson.getSeed("name").getValue();
				
				String teacherName=teacher.getSeed("name").getValue();
				
				String stuNames=buildStudentsName(stus);
				
				String date=p.getSeed("pdate").getValue();
				String start=p.getSeed("startTime").getValue();
				String end=p.getSeed("endTime").getValue();
				
				tv.addPeriod(new PeriodVo(income, income-salary, salary, ph, date, start, end, stuNames), m, teacherName, lessonName);
				
			}
			
			request.setAttribute("total", tv);
		}
		return "/WEB-INF/page/" + key + "/salary_total.jsp";
	}

	private String buildStudentsName(Set<Fruit_> stus) {
		// TODO Auto-generated method stub
		String str="";
		boolean b=true;
		for (Fruit_ fruit_ : stus) {
			String name=fruit_.getSeed("name").getValue();
			if(b){
				str+=name;
				b=false;
			}else{
				str+=","+name;
			}
		}
		return str;
	}
	
}
