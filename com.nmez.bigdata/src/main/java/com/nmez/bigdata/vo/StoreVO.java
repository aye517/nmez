package com.nmez.bigdata.vo;

public class StoreVO {

	
	int id, code;
	String gu, dong, category, sector;
	double y, x;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	
	
	@Override
	public String toString() {
		return "StoreVO [id=" + id + ", code=" + code + ", gu=" + gu + ", dong=" + dong + ", category=" + category
				+ ", sector=" + sector + ", y=" + y + ", x=" + x + "]";
	}
	
	
	

}
