package com.klef.agri_app.model;

public class student {
	private int sid;
	private String sname;
	private String fname;
	private int fee;
	public student(int sid, String sname, String fname, int fee) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.fname = fname;
		this.fee = fee;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	

}
