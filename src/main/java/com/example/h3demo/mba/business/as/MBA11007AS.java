package com.example.h3demo.mba.business.as;

import java.util.ArrayList;
import java.util.List;

import com.example.h3demo.mba.business.dc.MBA11007DC;
import com.example.h3demo.mba.transfer.MBAIO11007DTO;
import com.example.h3demo.mba.business.dc.dao.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MBA11007AS {
	
	private MBAIO11007DTO vIo11007 ;
	private final MBA11007DC mba11007dc;

	
	@Autowired
	public MBA11007AS(MBA11007DC mba11007dc) {
		this.mba11007dc = mba11007dc;
	}
	
    public MBAIO11007DTO execute(MBAIO11007DTO io){
    	
    	System.out.println("IO 셋팅");
    	this.vIo11007 = io;
    	
		this.vIo11007 = io;
		Member member = new Member();
		member.setName(vIo11007.getName());

    	//==================================================
        // - DC 호출
        //==================================================

		member = this.mba11007dc.execute(member);
		
		this.vIo11007.setName(member.getName());		
		
    	System.out.println("IO.out 정보 셋팅");
    	vIo11007.setOut(vIo11007.toString());

        return vIo11007; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }
    
	/**
     * 회원가입
     * */
    public MBAIO11007DTO join(MBAIO11007DTO pIn){

    	
    	this.vIo11007 = pIn;
    	Member member = new Member();
		member.setName(this.vIo11007.getName());
		
		Long id = this.mba11007dc.join(member);
		
		System.out.println("join-"+ Long.toString(id));
		
		this.vIo11007.setId(Long.toString(id));
        return vIo11007;
    }

    /**
     * 전체 회원 조회
     * */
    public List<MBAIO11007DTO> findMembers() {
    	
		
    	List<Member> members = this.mba11007dc.findMembers();
    	List<MBAIO11007DTO> allList = new ArrayList<MBAIO11007DTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(Member member : members) {
    		MBAIO11007DTO io = new MBAIO11007DTO();
    		io.setCompany("dao-sk");
    		io.setId(Long.toString(member.getId()) );
    		io.setIn("dao-test-in-aaaaaaaaa");
    		io.setOut("dao-test-out-aaaaaaaaa");
    		io.setName(member.getName());
    		
    		allList.add(io);
    	}

    	int i=0;
    	for(MBAIO11007DTO io : allList)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());
    	
    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
    	
        return allList ;
    }

    public MBAIO11007DTO findOne(MBAIO11007DTO in){
        return in;
    }


}
