package com.example.domain;

public class ScheduleVO {

	private String gname;
	private String glink;
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGlink() {
		return glink;
	}
	public void setGlink(String glink) {
		this.glink = glink;
	}
	@Override
	public String toString() {
		return "ScheduleVO [gname=" + gname + ", glink=" + glink + "]";
	}
	
	
	
	
	
}
