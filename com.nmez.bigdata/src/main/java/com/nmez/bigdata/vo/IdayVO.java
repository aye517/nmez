package com.nmez.bigdata.vo;

public class IdayVO {

	String id, gu, dong, sector;
	int Mon, Tue, Wed, Thu, Fri, Sat, Sun;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public int getMon() {
		return Mon;
	}
	public void setMon(int mon) {
		Mon = mon;
	}
	public int getTue() {
		return Tue;
	}
	public void setTue(int tue) {
		Tue = tue;
	}
	public int getWed() {
		return Wed;
	}
	public void setWed(int wed) {
		Wed = wed;
	}
	public int getThu() {
		return Thu;
	}
	public void setThu(int thu) {
		Thu = thu;
	}
	public int getFri() {
		return Fri;
	}
	public void setFri(int fri) {
		Fri = fri;
	}
	public int getSat() {
		return Sat;
	}
	public void setSat(int sat) {
		Sat = sat;
	}
	public int getSun() {
		return Sun;
	}
	public void setSun(int sun) {
		Sun = sun;
	}
	
	
	@Override
	public String toString() {
		return "IdayVO [id=" + id + ", gu=" + gu + ", dong=" + dong + ", sector=" + sector + ", Mon=" + Mon + ", Tue="
				+ Tue + ", Wed=" + Wed + ", Thu=" + Thu + ", Fri=" + Fri + ", Sat=" + Sat + ", Sun=" + Sun + "]";
	}
	
	
	
}
