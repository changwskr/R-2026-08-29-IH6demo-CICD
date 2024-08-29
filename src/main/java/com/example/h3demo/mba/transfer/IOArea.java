package com.example.h3demo.mba.transfer;

public class IOArea {
	
	private String txcode;
	private String routing_page;
	private String in;	
	private String out;


	public IOArea(String in, String out) {
		this.in = in;
		this.out = out;
	}


	public IOArea(String txcode, String routing_page, String in, String out) {
		super();
		this.txcode = txcode;
		this.routing_page = routing_page;
		this.in = in;
		this.out = out;
	}


	public String getRouting_page() {
		return routing_page;
	}


	public void setRouting_page(String routing_page) {
		this.routing_page = routing_page;
	}


	public String getTxcode() {
		return txcode;
	}


	public void setTxcode(String txcode) {
		this.txcode = txcode;
	}


	public String getIn() {
		return in;
	}
	public void setIn(String in) {
		this.in = in;
	}
	public String getOut() {
		return out;
	}
	public void setOut(String out) {
		this.out = out;
	}
	
	@Override
	public String toString() {
		return "IOArea [txcode=" + txcode + ", routing_page=" + routing_page + ", in=" + in + ", out=" + out + "]";
	}
	
	
	

}
