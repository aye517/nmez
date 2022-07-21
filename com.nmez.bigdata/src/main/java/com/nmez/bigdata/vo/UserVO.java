package com.nmez.bigdata.vo;

public class UserVO {

	  String uId, uPw, uName;
	  int uBYear, uBMonth,uBDay;
	  int uPhone1, uPhone2, uPhone3;
	  int uAddr1;
	  String uAddr2, uAddr3;
	  String uEmail, uEmail_domain;
	  String uAddr_x;
	String uAddr_y;
	  
	public String getuAddr_x() {
		return uAddr_x;
	}
	public void setuAddr_x(String uAddr_x) {
		this.uAddr_x = uAddr_x;
	}
	public String getuAddr_y() {
		return uAddr_y;
	}
	public void setuAddr_y(String uAddr_y) {
		this.uAddr_y = uAddr_y;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getuBYear() {
		return uBYear;
	}
	public void setuBYear(int uBYear) {
		this.uBYear = uBYear;
	}
	public int getuBMonth() {
		return uBMonth;
	}
	public void setuBMonth(int uBMonth) {
		this.uBMonth = uBMonth;
	}
	public int getuBDay() {
		return uBDay;
	}
	public void setuBDay(int uBDay) {
		this.uBDay = uBDay;
	}
	public int getuPhone1() {
		return uPhone1;
	}
	public void setuPhone1(int uPhone1) {
		this.uPhone1 = uPhone1;
	}
	public int getuPhone2() {
		return uPhone2;
	}
	public void setuPhone2(int uPhone2) {
		this.uPhone2 = uPhone2;
	}
	public int getuPhone3() {
		return uPhone3;
	}
	public void setuPhone3(int uPhone3) {
		this.uPhone3 = uPhone3;
	}
	public int getuAddr1() {
		return uAddr1;
	}
	public void setuAddr1(int uAddr1) {
		this.uAddr1 = uAddr1;
	}
	public String getuAddr2() {
		return uAddr2;
	}
	public void setuAddr2(String uAddr2) {
		this.uAddr2 = uAddr2;
	}
	public String getuAddr3() {
		return uAddr3;
	}
	public void setuAddr3(String uAddr3) {
		this.uAddr3 = uAddr3;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuEmail_domain() {
		return uEmail_domain;
	}
	public void setuEmail_domain(String uEmail_domain) {
		this.uEmail_domain = uEmail_domain;
	}
	@Override
	public String toString() {
		return "UserVO [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uBYear=" + uBYear + ", uBMonth="
				+ uBMonth + ", uBDay=" + uBDay + ", uPhone1=" + uPhone1 + ", uPhone2=" + uPhone2 + ", uPhone3="
				+ uPhone3 + ", uAddr1=" + uAddr1 + ", uAddr2=" + uAddr2 + ", uAddr3=" + uAddr3 + ", uEmail=" + uEmail
				+ ", uEmail_domain=" + uEmail_domain + ", uAddr_x=" + uAddr_x + ", uAddr_y=" + uAddr_y + "]";
	}

	
	
	
}
