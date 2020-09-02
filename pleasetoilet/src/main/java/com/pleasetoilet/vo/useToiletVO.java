package com.pleasetoilet.vo;

public class useToiletVO {
	private int uno;
	private String tno;
	private String tname;
	private String useDate;
	
	public useToiletVO(int uno, String tno, String tname, String useDate) {
		super();
		this.uno = uno;
		this.tno = tno;
		this.tname = tname;
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

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	
}