package com.example.h3demo.mba.business.pc;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import org.springframework.stereotype.Service;

import com.example.h3demo.mba.business.dc.MBA11005DC;

@Service
public class MBA11005PC {
	
	private MBAIO11005DTO io11005 ;
	
	public MBAIO11005DTO execute(MBAIO11005DTO in) {
		
		MBA11005DC dc = new MBA11005DC();
		
		System.out.println(" PC " + in.toString());
		
		io11005 = dc.execute(in);
		
		return io11005;
	}
	
	

}
