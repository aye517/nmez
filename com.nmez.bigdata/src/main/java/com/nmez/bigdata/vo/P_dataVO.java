package com.nmez.bigdata.vo;

public class P_dataVO {

	int p_id;
	String p_place;
	int p_code, p_total, p_man, p_woman;
	
	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getP_place() {
		return p_place;
	}

	public void setP_place(String p_place) {
		this.p_place = p_place;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getP_total() {
		return p_total;
	}

	public void setP_total(int p_total) {
		this.p_total = p_total;
	}

	public int getP_man() {
		return p_man;
	}

	public void setP_man(int p_man) {
		this.p_man = p_man;
	}

	public int getP_woman() {
		return p_woman;
	}

	public void setP_woman(int p_woman) {
		this.p_woman = p_woman;
	}

	@Override
	public String toString() {
		return "P_dataVO [p_id=" + p_id + ", p_place=" + p_place + ", p_code=" + p_code + ", p_total=" + p_total
				+ ", p_man=" + p_man + ", p_woman=" + p_woman + "]";
	}
	
	
}
