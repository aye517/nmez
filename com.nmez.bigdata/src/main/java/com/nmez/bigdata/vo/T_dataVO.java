package com.nmez.bigdata.vo;

public class T_dataVO {

	int t_id, t_code;
	String t_month, t_place, t_time;
	double t_total, t_man, t_woman;
	
	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getT_code() {
		return t_code;
	}

	public void setT_code(int t_code) {
		this.t_code = t_code;
	}

	public String getT_month() {
		return t_month;
	}

	public void setT_month(String t_month) {
		this.t_month = t_month;
	}

	public String getT_place() {
		return t_place;
	}

	public void setT_place(String t_place) {
		this.t_place = t_place;
	}

	public String getT_time() {
		return t_time;
	}

	public void setT_time(String t_time) {
		this.t_time = t_time;
	}

	public double getT_total() {
		return t_total;
	}

	public void setT_total(double t_total) {
		this.t_total = t_total;
	}

	public double getT_man() {
		return t_man;
	}

	public void setT_man(double t_man) {
		this.t_man = t_man;
	}

	public double getT_woman() {
		return t_woman;
	}

	public void setT_woman(double t_woman) {
		this.t_woman = t_woman;
	}


	@Override
	public String toString() {
		return "T_dataVO [t_id=" + t_id + ", t_code=" + t_code + ", t_month=" + t_month + ", t_place=" + t_place
				+ ", t_time=" + t_time + ", t_total=" + t_total + ", t_man=" + t_man + ", t_woman=" + t_woman + "]";
	}

	
}
