package com.example.h3demo.deposite.business.as;

import com.example.h3demo.common.ComUtil;
import com.example.h3demo.deposite.business.as.helper.FieldCopyUtil;
import com.example.h3demo.deposite.business.dc.DepositeDC;
import com.example.h3demo.deposite.business.dc.dao.model.DMember;
import com.example.h3demo.deposite.business.dto.DepositeDDTO;
import com.example.h3demo.deposite.transfer.CommonDTO;
import com.example.h3demo.deposite.transfer.DEP80001CDTO;
import com.example.h3demo.deposite.transfer.DepositeCDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class DepositeAS {

	private DepositeDDTO depositeDDTO ;
	private DepositeCDTO depositeCDTO ;
	private final DepositeDC depositeDC;
	private DEP80001CDTO dep80001CDTO;


	@Autowired
	public DepositeAS(DepositeDC depositeDC) {
		this.depositeDC = depositeDC;
	}

	/**
	 *
	 * @param io
	 * @return
	 */
	public DEP80001CDTO execute(DEP80001CDTO io){

		this.dep80001CDTO = io;
		this.depositeDDTO = new DepositeDDTO();

		try {
			this.depositeDDTO.setId(this.dep80001CDTO.getId());
			this.depositeDDTO.setName(dep80001CDTO.getName());
			this.depositeDDTO.setAddress(dep80001CDTO.getAddress());
			this.depositeDDTO.setContact(dep80001CDTO.getContact());
			this.depositeDDTO.setCompany(dep80001CDTO.getCompany());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		String actionName = dep80001CDTO.getActionName();
		System.out.println("----actionName - " + actionName);
		List<DepositeDDTO> allList = new ArrayList<DepositeDDTO>();

		if( ComUtil.memcmp(actionName, "put")){
			depositeDDTO = depositeDC.restPUT(this.depositeDDTO);
			allList.add(depositeDDTO);
		}
		else if (ComUtil.memcmp(actionName, "delete")){
			depositeDDTO = depositeDC.restDELETE(depositeDDTO);
			allList.add(depositeDDTO);
		}
		else if (ComUtil.memcmp(actionName, "get")){
			depositeDDTO = depositeDC.restGET(depositeDDTO);
			allList.add(depositeDDTO);
		}
		else if (ComUtil.memcmp(actionName, "getall")){
			allList = depositeDC.restGETALL();
		}
		else if (ComUtil.memcmp(actionName, "post")){
			depositeDDTO = depositeDC.restPOST(depositeDDTO);
			allList.add(depositeDDTO);
		}
		else{
			return null;
		}

		/**
		 * 결과 저장
		 */

		for(DepositeDDTO io2 : allList){
			System.out.println( "id-" + io2.getId() + "-" + io2.getName());
		}

		dep80001CDTO.setDdto(allList);

		return dep80001CDTO;


	}

	public DepositeCDTO execute(DepositeCDTO io){

		CommonDTO comdto = io.getComdto();
		System.out.println("IO 셋팅");
		this.depositeCDTO = io;


		this.depositeDDTO = new DepositeDDTO();
		this.depositeDDTO.setCompany(this.depositeCDTO.getCompany());
		this.depositeDDTO.setId(this.depositeCDTO.getId());
		this.depositeDDTO.setName(depositeCDTO.getName());

		DMember member = new DMember();
		member.setName(depositeDDTO.getName());

		//==================================================
		// - DC 호출
		//==================================================

		member = this.depositeDC.execute(member);

		this.depositeDDTO.setName(member.getName());

		System.out.println("IO.out 정보 셋팅");

		try {
			FieldCopyUtil.copyFields(depositeDDTO, depositeCDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

	}

	/**
     * 회원가입
     * */
    public DepositeDDTO join(DepositeDDTO pIn){

		this.depositeDDTO = pIn;
		DMember member = new DMember();
		member.setName(this.depositeDDTO.getName());

		Long id = this.depositeDC.join(member);

		System.out.println("join-" + Long.toString(id));

		this.depositeDDTO.setId(Long.toString(id));
		return depositeDDTO;
	}

    /**
     * 전체 회원 조회
     * */
    public List<DepositeDDTO> findMembers() {


    	List<DMember> members = this.depositeDC.findMembers();
    	List<DepositeDDTO> allList = new ArrayList<DepositeDDTO>();

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

    	int v=0;
    	for(DMember member : members) {
    		DepositeDDTO io = new DepositeDDTO();
    		io.setCompany("dao-sk");
    		io.setId(Long.toString(member.getId()) );
    		io.setName(member.getName());

    		allList.add(io);
    	}

    	int i=0;
    	for(DepositeDDTO io : allList)
    		System.out.println( "id-" + io.getId() + "-" + io.getName());

    	System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

        return allList ;
    }

    public DepositeDDTO findOne(DepositeDDTO in){
        return in;
    }


    /**
     * 입력처리
     * @param pdepositeCDTO
     * @return
     */
    public DepositeCDTO restPUT(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;
		this.depositeDDTO = new DepositeDDTO();

		try {
			FieldCopyUtil.copyFields(pdepositeCDTO, depositeDDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	//==================================================
        // - DC 호출
        //==================================================

		depositeDDTO = this.depositeDC.restPUT(depositeDDTO);

    	try {
			FieldCopyUtil.copyFields(depositeDDTO, pdepositeCDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }

    /**
     * 수정처리
     * @param pdepositeCDTO
     * @return
     */
    public DepositeCDTO restPOST(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;
		this.depositeDDTO = new DepositeDDTO();

		try {
			FieldCopyUtil.copyFields(pdepositeCDTO, depositeDDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	//==================================================
        // - DC 호출
        //==================================================

		depositeDDTO = this.depositeDC.restPOST(depositeDDTO);

    	try {
			FieldCopyUtil.copyFields(depositeDDTO, pdepositeCDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }


    public DepositeCDTO restDELETE(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;
		this.depositeDDTO = new DepositeDDTO();

		try {
			FieldCopyUtil.copyFields(pdepositeCDTO, depositeDDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	//==================================================
        // - DC 호출
        //==================================================

		depositeDDTO = this.depositeDC.restDELETE(depositeDDTO);

    	try {
			FieldCopyUtil.copyFields(depositeDDTO, pdepositeCDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }


    public DepositeCDTO restGET(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;
		this.depositeDDTO = new DepositeDDTO();

		try {
			FieldCopyUtil.copyFields(pdepositeCDTO, depositeDDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	//==================================================
        // - DC 호출
        //==================================================

		depositeDDTO = this.depositeDC.restGET(depositeDDTO);

    	try {
			FieldCopyUtil.copyFields(depositeDDTO, pdepositeCDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }

    public DepositeCDTO restGETALL(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;

		try {
			FieldCopyUtil.copyFields(pdepositeCDTO, depositeDDTO);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	//==================================================
        // - DC 호출
        //==================================================

		List<DepositeDDTO> depositeDDTOs = this.depositeDC.restGETALL();
		depositeCDTO.setDdto(depositeDDTOs);

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }

    public DepositeCDTO restGetName(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;

		System.out.println("["+ pdepositeCDTO.getName() + "]" );
    	//==================================================
        // - DC 호출
        //==================================================

		List<DepositeDDTO> depositeDDTOs = this.depositeDC.restGetName(pdepositeCDTO.getName());
		depositeCDTO.setDdto(depositeDDTOs);

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }

    public DepositeCDTO restGetLikeName(DepositeCDTO pdepositeCDTO){

    	CommonDTO comdto = pdepositeCDTO.getComdto();
    	this.depositeCDTO = pdepositeCDTO;

		System.out.println("["+ pdepositeCDTO.getName() + "]" );
    	//==================================================
        // - DC 호출
        //==================================================

		List<DepositeDDTO> depositeDDTOs = this.depositeDC.restGetLikeName(pdepositeCDTO.getName());
		depositeCDTO.setDdto(depositeDDTOs);

        return depositeCDTO; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.

    }


}
