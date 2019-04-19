package com.u2.other.action.vo;

public class PeriodVo {

	private double income=0.0;
	
	private double profit=0.0;
	
	private double salary=0.0;
	
	private double hour=0.0;
	
	private String date;
	private String start;
	private String end;
	private String student;
	
	
	public PeriodVo(double income, double profit, double salary, double hour, String date, String start, String end,
			String student) {
		super();
		this.income = income;
		this.profit = profit;
		this.salary = salary;
		this.hour = hour;
		this.date = date;
		this.start = start;
		this.end = end;
		this.student = student;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	
	
}
