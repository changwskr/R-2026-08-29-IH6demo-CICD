package com.example.h3demo.mba.business.pc;

import java.util.ArrayList;
import java.util.List;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import com.example.h3demo.mba.business.dc.dao.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.h3demo.mba.business.dc.MBA11006DC;

@Service
public class MBA11006PC {
	
	private MBAIO11005DTO io11005 ;
	private Member member;
	private final MBA11006DC mba11006dc;

	
	@Autowired
	public MBA11006PC(MBA11006DC mba11006dc) {
		this.mba11006dc = mba11006dc;
	}

	
	public MBA11006PC() {
		this.mba11006dc = new MBA11006DC();
		// TODO Auto-generated constructor stub
	}


	public MBAIO11005DTO execute(MBAIO11005DTO in) {
		
		System.out.println(" PC " + in.toString());
		
		this.io11005 = in;
		this.member = new Member();
		this.member.setName(io11005.getName());
		
		member = this.mba11006dc.execute(member);
		
		this.io11005.setName(member.getName());		
		
		return io11005;
	}

	/**
     * 회원가입
     * */
    public MBAIO11005DTO join(MBAIO11005DTO pIn){

    	
    	this.io11005 = pIn;
    	this.member = new Member();
		this.member.setName(this.io11005.getName());
		
		Long id = this.mba11006dc.join(member);
		
		System.out.println("join-"+ Long.toString(id));
		
		this.io11005.setId(Long.toString(id));
        return io11005;
    }

    /**
     * 전체 회원 조회
     * */
    public List<MBAIO11005DTO> findMembers() {
    	
		
    	List<Member> members = this.mba11006dc.findMembers();
    	List<MBAIO11005DTO> allList = new ArrayList<MBAIO11005DTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(Member member : members) {
    		MBAIO11005DTO io = new MBAIO11005DTO();
    		io.setCompany("dao-sk");
    		io.setId(Long.toString(member.getId()) );
    		io.setIn("dao-test-in-aaaaaaaaa");
    		io.setOut("dao-test-out-aaaaaaaaa");
    		io.setName(member.getName());
    		
    		allList.add(io);
    	}

    	int i=0;
    	for(MBAIO11005DTO io : allList)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());
    	
    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
    	
        return allList ;
    }

    public MBAIO11005DTO findOne(MBAIO11005DTO in){
        return in;
    }

	

}
