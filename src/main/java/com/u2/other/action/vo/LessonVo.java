package com.u2.other.action.vo;

import java.util.ArrayList;
import java.util.List;

public class LessonVo {

	private String lname;
	
	private double income=0.0;
	
	private double profit=0.0;
	
	private double salary=0.0;
	
	private double hour=0.0;
	
	private List<PeriodVo> periods;
	
	public void addPeriod(PeriodVo pv, String lessonName) {
		// TODO Auto-generated method stub
		lname=lessonName;
		income+=pv.getIncome();
		profit+=pv.getProfit();
		salary+=pv.getSalary();
		hour+=pv.getHour();
		
		if(periods==null){periods=new ArrayList<PeriodVo>();}
		periods.add(pv);
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
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

	public List<PeriodVo> getPeriods() {
		return periods;
	}

	public void setPeriods(List<PeriodVo> periods) {
		this.periods = periods;
	}

}
