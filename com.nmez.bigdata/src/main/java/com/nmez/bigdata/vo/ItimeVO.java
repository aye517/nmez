package com.nmez.bigdata.vo;

public class ItimeVO {

	int id, man, woman, bc_card;
	String gu, dong, sector;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	public int getBc_card() {
		return bc_card;
	}
	public void setBc_card(int bc_card) {
		this.bc_card = bc_card;
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
	
	
	@Override
	public String toString() {
		return "IsexVO [id=" + id + ", man=" + man + ", woman=" + woman + ", bc_card=" + bc_card + ", gu=" + gu
				+ ", dong=" + dong + ", sector=" + sector + "]";
	}
	
	
	
}
