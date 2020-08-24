package com.pleasetoilet.vo;

public class useToiletVO {
	private int uno;
	private String useDate;
	public useToiletVO(int uno, String useDate) {
		super();
		this.uno = uno;
		this.useDate = useDate;
	}
	public useToiletVO() {
		super();
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	@Override
	public String toString() {
		return "useToilet [uno=" + uno + ", useDate=" + useDate + "]";
	}
	
	
}