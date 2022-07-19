package com.nmez.bigdata.vo;

public class DataVO {

	  int t_id;
	  String t_local_name;
	  int t_local_code;
	  String t_time;
	  double t_apop, t_mpop, t_wpop;
	  

	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_local_name() {
		return t_local_name;
	}
	public void setT_local_name(String t_local_name) {
		this.t_local_name = t_local_name;
	}
	public int getT_local_code() {
		return t_local_code;
	}
	public void setT_local_code(int t_local_code) {
		this.t_local_code = t_local_code;
	}
	public String getT_time() {
		return t_time;
	}
	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	public double getT_apop() {
		return t_apop;
	}
	public void setT_apop(double t_apop) {
		this.t_apop = t_apop;
	}
	public double getT_mpop() {
		return t_mpop;
	}
	public void setT_mpop(double t_mpop) {
		this.t_mpop = t_mpop;
	}
	public double getT_wpop() {
		return t_wpop;
	}
	public void setT_wpop(double t_wpop) {
		this.t_wpop = t_wpop;
	}
	
	@Override
	public String toString() {
		return "DataVO [t_id=" + t_id + ", t_local_name=" + t_local_name + ", t_local_code=" + t_local_code
				+ ", t_time=" + t_time + ", t_apop=" + t_apop + ", t_mpop=" + t_mpop + ", t_wpop=" + t_wpop + "]";
	}
	
	  
}
