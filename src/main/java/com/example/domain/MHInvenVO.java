package com.example.domain;

public class MHInvenVO {
	private String name;
	private String genre;
	private String developer;
	private double rating;
	@Override
	public String toString() {
		return "InvenVO [name=" + name + ", genre=" + genre + ", developer=" + developer + ", rating=" + rating + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	
}
