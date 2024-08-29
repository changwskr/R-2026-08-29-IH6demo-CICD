package com.example.h3demo.deposite.business.dc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.h3demo.common.ComUtil;
import com.example.h3demo.deposite.business.as.helper.FieldCopyUtil;
import com.example.h3demo.deposite.business.dc.dao.IDCustomerDAO;
import com.example.h3demo.deposite.business.dc.dao.H3MEMDepositeDAOImpl;
import com.example.h3demo.deposite.business.dc.dao.IH3DepositeDAO;
import com.example.h3demo.deposite.business.dc.dao.model.DCustomer;
import com.example.h3demo.deposite.business.dc.dao.model.DMember;
import com.example.h3demo.deposite.business.dto.DepositeDDTO;
import com.example.h3demo.deposite.business.dto.StudentDTO;



@Component
public class DepositeDC {

	private final IH3DepositeDAO memberRepository;	
	private IDCustomerDAO repository;

	
	@Autowired
	public DepositeDC(H3MEMDepositeDAOImpl memberRepository, IDCustomerDAO repository) {
		this.memberRepository = memberRepository;
		this.repository = repository;
		
	}

	public DepositeDC() {
		this.memberRepository = new H3MEMDepositeDAOImpl();
		// TODO Auto-generated constructor stub
	}

	public DepositeDC(IH3DepositeDAO memberRepository2) {
		// TODO Auto-generated constructor stub
		this.memberRepository = memberRepository2;
	}

	public DepositeDC(IH3DepositeDAO depositeDAO, IDCustomerDAO dcustomerRepository) {
		this.memberRepository = depositeDAO;
		this.repository = dcustomerRepository;

		// TODO Auto-generated constructor stub
	}

	public DMember execute(DMember member) {

		member.setName("11006-dao-jws");
				
		return member;
	}

	// REST 한건입력
	public DepositeDDTO restPUT(DepositeDDTO pdepositeDDTO) {
		
		DCustomer customer = new DCustomer();
		customer.setAddress(pdepositeDDTO.getAddress());
		customer.setId(ComUtil.Str2Int(pdepositeDDTO.getId()));
		customer.setName(pdepositeDDTO.getName());
		customer.setContact(pdepositeDDTO.getContact());
		
		customer = repository.save(customer);
		
		pdepositeDDTO.setAddress(customer.getAddress());
		pdepositeDDTO.setContact(customer.getContact());
		pdepositeDDTO.setId(ComUtil.Int2Str(customer.getId()));
		pdepositeDDTO.setName(customer.getName());
		
		return pdepositeDDTO ;
				
	}

	public DepositeDDTO restPOST(DepositeDDTO pdepositeDDTO) {
		
		DCustomer customer = new DCustomer();
		customer.setAddress(pdepositeDDTO.getAddress());
		customer.setId(ComUtil.Str2Int(pdepositeDDTO.getId()));
		customer.setName(pdepositeDDTO.getName());
		customer.setContact(pdepositeDDTO.getContact());
		
		customer = repository.save(customer);
		
		pdepositeDDTO.setAddress(customer.getAddress());
		pdepositeDDTO.setContact(customer.getContact());
		pdepositeDDTO.setId(ComUtil.Int2Str(customer.getId()));
		pdepositeDDTO.setName(customer.getName());
		
		return pdepositeDDTO ;
				
	}

	public DepositeDDTO restDELETE(DepositeDDTO pdepositeDDTO) {
		
		DCustomer customer = new DCustomer();
		customer.setAddress(pdepositeDDTO.getAddress());
		customer.setId(ComUtil.Str2Int(pdepositeDDTO.getId()));
		customer.setName(pdepositeDDTO.getName());
		customer.setContact(pdepositeDDTO.getContact());
		
		repository.deleteById(customer.getId());
		
		return pdepositeDDTO ;
				
	}

	public DepositeDDTO restGET(DepositeDDTO pdepositeDDTO) {
		
		DCustomer customer = new DCustomer();
		customer.setAddress(pdepositeDDTO.getAddress());
		customer.setId(ComUtil.Str2Int(pdepositeDDTO.getId()));
		customer.setName(pdepositeDDTO.getName());
		customer.setContact(pdepositeDDTO.getContact());
		
		// 만약 클라이언트에게 데이타가 없는 경우에는 null을 리턴할 경우는 null, 만약 500 exception를 전달할 경우 orElseThorw로 처리한다.
		customer = repository.findById(customer.getId()).orElse(null);
		//customer = repository.findById(customer.getId()).orElseThrow();
		
		pdepositeDDTO.setAddress(customer.getAddress());
		pdepositeDDTO.setName(customer.getName());
		pdepositeDDTO.setId(ComUtil.Int2Str(customer.getId()));
		pdepositeDDTO.setContact(customer.getContact());
		
		return pdepositeDDTO ;
				
	}

	public ArrayList<DepositeDDTO> restGETALL() {

        ArrayList<DCustomer> customers = (ArrayList<DCustomer>) repository.findAll();

        
        ArrayList<DepositeDDTO> depositeDDTOs = new ArrayList<DepositeDDTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(DCustomer customer : customers) {
    		DepositeDDTO io = new DepositeDDTO();
    		io.setId(Long.toString(customer.getId()) );
    		io.setName(customer.getName());
    		io.setAddress(customer.getAddress());
    		io.setContact(customer.getContact());
    		
    		depositeDDTOs.add(io);
    	}

    	int i=0;
    	for(DepositeDDTO io : depositeDDTOs)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());
    	
    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

        
		return depositeDDTOs ;
				
	}

	
	public ArrayList<DepositeDDTO> restGetName(String name) {

        ArrayList<DCustomer> customers = (ArrayList<DCustomer>) repository.findByName(name);

        
        ArrayList<DepositeDDTO> depositeDDTOs = new ArrayList<DepositeDDTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(DCustomer customer : customers) {
    		DepositeDDTO io = new DepositeDDTO();
    		io.setId(Long.toString(customer.getId()) );
    		io.setName(customer.getName());
    		io.setAddress(customer.getAddress());
    		io.setContact(customer.getContact());
    		
    		depositeDDTOs.add(io);
    	}

    	int i=0;
    	for(DepositeDDTO io : depositeDDTOs)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());
    	
    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

        
		return depositeDDTOs ;
				
	}


	public ArrayList<DepositeDDTO> restGetLikeName(String name) {

		// like 형식에 맞추어 전달
		// name = "%" + name + "%";
        ArrayList<DCustomer> customers = (ArrayList<DCustomer>) repository.findByNameLike("%" + name + "%");

        
        ArrayList<DepositeDDTO> depositeDDTOs = new ArrayList<DepositeDDTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(DCustomer customer : customers) {
    		DepositeDDTO io = new DepositeDDTO();
    		io.setId(Long.toString(customer.getId()) );
    		io.setName(customer.getName());
    		io.setAddress(customer.getAddress());
    		io.setContact(customer.getContact());
    		
    		depositeDDTOs.add(io);
    	}

    	int i=0;
    	for(DepositeDDTO io : depositeDDTOs)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());
    	
    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

        
		return depositeDDTOs ;
				
	}


	//=============================================================================================
	
	//============================================================================================
	
	
	/**
     * 회원가입
     * */
    public Long join(DMember member){

    	// 같은 이름이 있는 중복 회원 X
    	// 회의의 이름으로 메모리에서 찾는다.
        Optional<DMember> result = memberRepository.findByName(member.getName());
        
        result.ifPresent(m -> {
            throw new IllegalStateException("이미 존재하는 회원입니다");
        });
        

        //위의 방식에서 아래방식으로 코딩
        //로직이 들어가면 메소드로 뺀다
        validateDuplicateMember(member); //중복 회원 검증
        
        memberRepository.save(member);
        return member.getId();
    }

    private void validateDuplicateMember(DMember member) {
        memberRepository.findByName(member.getName())
            .ifPresent(m -> {
                throw new IllegalStateException("이미 존재하는 회원입니다");
            });
    }
    /**
     * 전체 회원 조회
     * */
    public List<DMember> findMembers() {
        return memberRepository.findAll();
    }

    public Optional<DMember> findOne(Long memberId){
        return memberRepository.findById(memberId);
    }

}
