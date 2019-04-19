package com.u2.other.action.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TeacherVo {

	private double income=0.0;
	
	private double profit=0.0;
	
	private double salary=0.0;
	
	private double hour=0.0;
	
	private String tname;
	
	private List<LessonVo> lessons;
	
	private Map<String,LessonVo> lm;
	
	
	public void addPeriod(PeriodVo pv, String teacherName, String lessonName) {
		// TODO Auto-generated method stub
		tname=teacherName;
		income+=pv.getIncome();
		profit+=pv.getProfit();
		salary+=pv.getSalary();
		hour+=pv.getHour();
		
		if(lm==null){lm=new HashMap<String, LessonVo>();}
		LessonVo l = lm.get(lessonName);
		if(l==null){
			l=new LessonVo();
			lm.put(lessonName, l);
			if(lessons==null){lessons=new ArrayList<LessonVo>();}
			lessons.add(l);
		}
		
		
		l.addPeriod(pv,lessonName);
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public double getProfit() {
		return profit;
	}

	public void setProfit(double profit) {
		this.profit = profit;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public double getHour() {
		return hour;
	}

	public void setHour(double hour) {
		this.hour = hour;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public List<LessonVo> getLessons() {
		return lessons;
	}

	public void setLessons(List<LessonVo> lessons) {
		this.lessons = lessons;
	}

	public Map<String, LessonVo> getLm() {
		return lm;
	}

	public void setLm(Map<String, LessonVo> lm) {
		this.lm = lm;
	}

	
	
	
	
}
