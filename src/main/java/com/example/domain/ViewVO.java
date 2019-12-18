package com.example.domain;

public class ViewVO {
	private String banner;
	private String title;
	private String summary;
	private String link;
	public void setLink(String link) {
		this.link = link;
	}
	public String getLink() {
		return link;
	}
	@Override
	public String toString() {
		return "ViewVO [banner=" + banner + ", title=" + title + ", summary=" + summary + "]";
	}
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	
	
}
