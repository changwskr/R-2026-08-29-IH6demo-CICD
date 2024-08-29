package com.example.h3demo.mba.business.dc.dao;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;

public class DAO11005 {
	
	private String id;
	private String name;
	private String company;
	
	private MBAIO11005DTO out;
	
	
	public DAO11005(MBAIO11005DTO in) {
		this.out = in;
		System.out.println("&&&&&&   " + in.toString());
		
		id = in.getId();		
	}
	

	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getCompany() {
		return company;
	}
	
	
	public MBAIO11005DTO execute() {
		// JDBC Select query 진행
		this.name = "DAO-roian";
		this.company = "DAO-sk";
		
		out.setCompany(this.getCompany());
		out.setName(this.getName());
		
		return out;
		
	}
		

}
