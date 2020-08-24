package com.pleasetoilet.vo;

public class ReviewVO {
	private int tno;
	private int uno;
	private String contents;
	private int star;
	
	public ReviewVO() {
		super();
	}
	public ReviewVO(int tno, int uno, String contents, int star) {
		super();
		this.tno = tno;
		this.uno = uno;
		this.contents = contents;
		this.star = star;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "ReviewVO [tno=" + tno + ", uno=" + uno + ", contents=" + contents + ", star=" + star + "]";
	}
	
}