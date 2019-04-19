package com.u2.other.action.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TotalVo {

	private String month;
	
	private double income=0.0;
	
	private double profit=0.0;
	
	private double salary=0.0;
	
	private double hour=0.0;
	
	private List<TeacherVo> teachers;
	
	private Map<String,TeacherVo> tm;
	
	public void addPeriod(PeriodVo pv,String month,String teacherName,String lessonName){
		this.month=month;
		income+=pv.getIncome();
		profit+=pv.getProfit();
		salary+=pv.getSalary();
		hour+=pv.getHour();
		if(tm==null){tm=new HashMap<String,TeacherVo>();}
		TeacherVo tv = tm.get(teacherName);
		if(tv==null){
			tv = new TeacherVo();
			tm.put(teacherName, tv);
			if(teachers==null){teachers=new ArrayList<TeacherVo>();}
			teachers.add(tv);
		}
		
		tv.addPeriod( pv, teacherName, lessonName);
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
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

	public List<TeacherVo> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<TeacherVo> teachers) {
		this.teachers = teachers;
	}

	public Map<String, TeacherVo> getTm() {
		return tm;
	}

	public void setTm(Map<String, TeacherVo> tm) {
		this.tm = tm;
	}
	
	
	
	
}
