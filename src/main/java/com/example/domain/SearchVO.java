package com.example.domain;

public class SearchVO {

	private String rank;
	private String link;
	private String name;
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "SearchVO [rank=" + rank + ", link=" + link + ", name=" + name + "]";
	}
	
	
	
}
