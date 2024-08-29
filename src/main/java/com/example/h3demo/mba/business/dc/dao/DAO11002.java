package com.example.h3demo.mba.business.dc.dao;

import com.example.h3demo.mba.transfer.MBAIO11002DTO;

public class DAO11002 {
	
	private String id;
	private String name;
	private String company;
	
	private MBAIO11002DTO out;
	
	
	public DAO11002(MBAIO11002DTO in) {
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
	
	
	public MBAIO11002DTO execute() {
		// JDBC Select query 진행
		this.name = "roian";
		this.company = "sk";
		
		out.setCompany(this.getCompany());
		out.setName(this.getName());
		
		return out;
		
	}
		

}
