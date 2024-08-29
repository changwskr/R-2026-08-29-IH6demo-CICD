package com.example.h3demo.mba.business.pc;

import com.example.h3demo.mba.transfer.MBAIO11002DTO;
import com.example.h3demo.mba.business.dc.MBA11002DC;

public class MBA11002PC {
	
	private MBAIO11002DTO io11002 ;
	
	public MBAIO11002DTO execute(MBAIO11002DTO in) {
		
		MBA11002DC dc = new MBA11002DC();
		
		System.out.println(" PC " + in.toString());
		
		io11002 = dc.execute(in);
		
		return io11002;
	}
	
	

}
