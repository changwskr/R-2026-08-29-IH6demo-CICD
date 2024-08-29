package com.example.h3demo.deposite.transfer;

import java.util.List;

import com.example.h3demo.deposite.business.dto.DepositeDDTO;

import lombok.Data;

@Data
public class DepositeCDTO {

	private String txcode;
	private String routing_page;
	private String in;	
	private String out;
	////////////////////////
	private String id;
	private String name;
	////////////////////////
	private String company;
	private String address;
	private String contact;
	
	private CommonDTO comdto;
	private List<DepositeDDTO> ddto;


}
