package com.pleasetoilet.vo;

public class ToiletVO {
	private int tno;
	private double latitude;
	private double longitude;
	private String bigName;
	private String smallName;
	public ToiletVO(int tno, double latitude, double longitude, String bigName, String smallName) {
		super();
		this.tno = tno;
		this.latitude = latitude;
		this.longitude = longitude;
		this.bigName = bigName;
		this.smallName = smallName;
	}
	
	public ToiletVO() {
		super();
	}

	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getBigName() {
		return bigName;
	}
	public void setBigName(String bigName) {
		this.bigName = bigName;
	}
	public String getSmallName() {
		return smallName;
	}
	public void setSmallName(String smallName) {
		this.smallName = smallName;
	}

	@Override
	public String toString() {
		return "ToiletVO [tno=" + tno + ", latitude=" + latitude + ", longitude=" + longitude + ", bigName=" + bigName
				+ ", smallName=" + smallName + "]";
	}
	
}