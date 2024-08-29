package com.example.h3demo.deposite.transfer;

import java.util.List;

import com.example.h3demo.deposite.business.dto.DepositeDDTO;
import com.example.h3demo.framework.transfer.SKCommonCDTO;
import com.example.h3demo.framework.transfer.SKData;
import lombok.Data;

@Data
public class DEP80001CDTO {


	private String txcode;
	private String actionName;  // put post delete get
	private String routing_page;
	private String in;	
	private String out;

	////////////////////////
	// TEST DATA
	///////////////////////
	private String id;
	private String name;
	private String company;
	private String address;
	private String contact;

	private List<DepositeDDTO> ddto;

	public DEP80001CDTO() {
        super();
    }


}
