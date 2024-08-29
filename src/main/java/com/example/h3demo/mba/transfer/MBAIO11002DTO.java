package com.example.h3demo.mba.transfer;

public class MBAIO11002DTO {
	
	private String txcode;
	private String routing_page;
	private String in;	
	private String out;
	private String id;
	private String name;
	private String company;


	public MBAIO11002DTO(String in, String out) {
		this.in = in;
		this.out = out;
	}


	public MBAIO11002DTO(String txcode, String routing_page, String in, String out, String id) {
		super();
		this.txcode = txcode;
		this.routing_page = routing_page;
		this.in = in;
		this.out = out;
		this.id = id;
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
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getOut() {
		return out;
	}
	public void setOut(String out) {
		this.out = out;
	}
	
	@Override
	public String toString() {
		return "IO11002 [txcode=" + txcode + ", routing_page=" + routing_page + ", in=" + in + ", out=" + out + ", id="
				+ id + ", name=" + name + ", company=" + company + "]";
	}
	
	
	

}
