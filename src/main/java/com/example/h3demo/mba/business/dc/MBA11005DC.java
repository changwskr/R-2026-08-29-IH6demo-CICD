package com.example.h3demo.mba.business.dc;

import com.example.h3demo.mba.business.dc.dao.DAO11002;
import com.example.h3demo.mba.business.dc.dao.DAO11005;
import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import org.springframework.stereotype.Service;

@Service
public class MBA11005DC {

	private MBAIO11005DTO io11005 ;
	private DAO11002 dao11002;
	

	public MBA11005DC() {
	}

	public MBAIO11005DTO execute(MBAIO11005DTO in) {
		
		System.out.println(" DC " + in.toString());
		
		DAO11005 dao = new DAO11005(in);
		io11005 = dao.execute();
		
		System.out.println(io11005.toString());
				
		return io11005;
	}

}
