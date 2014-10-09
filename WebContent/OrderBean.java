package com.arena.app;

public class OrderBean {
	
	private String code;
	private int qty;
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	
	
	public OrderBean(String code, int qty, String name) {
		this.setCode(code);
		this.setQty(qty);
		this.setName(name);
	}

}
