package com.example.h3demo.mba.business.dc;

import com.example.h3demo.mba.business.dc.dao.DAO11002;
import com.example.h3demo.mba.transfer.MBAIO11002DTO;

public class MBA11002DC {

	private MBAIO11002DTO io11002 ;
	
	private DAO11002 dao11002;
	
	
	
	public MBA11002DC() {
	}

	public MBAIO11002DTO execute(MBAIO11002DTO in) {
		
		System.out.println(" DC " + in.toString());
		
		DAO11002 dao = new DAO11002(in);
		io11002 = dao.execute();
		
		System.out.println(io11002.toString());
				
		return io11002;
	}

}
