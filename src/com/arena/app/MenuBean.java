package com.arena.app;

public class MenuBean {

	private String name;
	private String src;
	private String description;
	private String code;
	private double price;

	public MenuBean(String name, String src, String description, String code, double price) {
		this.setName(name);
		this.setSrc(src);
		this.setDescription(description);
		this.setCode(code);
		this.setPrice(price);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
