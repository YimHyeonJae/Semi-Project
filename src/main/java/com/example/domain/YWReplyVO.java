package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class YWReplyVO {
	private int rid;
	private String rtext;

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date rdate;
	private int did;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRtext() {
		return rtext;
	}

	public void setRtext(String rtext) {
		this.rtext = rtext;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", rtext=" + rtext + ", rdate=" + rdate + ", did=" + did + "]";
	}

}
