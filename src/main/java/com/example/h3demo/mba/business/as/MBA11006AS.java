package com.example.h3demo.mba.business.as;

import java.util.List;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import com.example.h3demo.mba.business.pc.MBA11006PC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MBA11006AS {
	
	private MBAIO11005DTO io11005 ;
	private final MBA11006PC mba11006pc;

	
	@Autowired
	public MBA11006AS(MBA11006PC mba11006pc) {
		this.mba11006pc = mba11006pc;
	}
	
    public MBAIO11005DTO execute(MBAIO11005DTO io){
    	
    	System.out.println("IO 셋팅");
    	this.io11005 = io;
    	
    	// IO전문 셋팅 및 점검
    	System.out.println("PC - DC - DAO 호출");
        //==================================================
        // PC 호출 - DC 호출
        //==================================================
    	io11005 = mba11006pc.execute(io11005);

    	System.out.println("IO.out 정보 셋팅");
    	io11005.setOut(io11005.toString());

        return io11005; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.
        

    }
    
	/**
     * 회원가입
     * */
    public MBAIO11005DTO join(MBAIO11005DTO in){
    	this.io11005 = mba11006pc.join(in);

        return io11005;
    }

    private void validateDuplicateMember(MBAIO11005DTO in) {

    }
    /**
     * 전체 회원 조회
     * */
    public List<MBAIO11005DTO> findMembers() {
    	
    	List<MBAIO11005DTO> members = this.mba11006pc.findMembers();
        return members ;
    }

    public MBAIO11005DTO findOne(MBAIO11005DTO in){
        return in;
    }

	

}
