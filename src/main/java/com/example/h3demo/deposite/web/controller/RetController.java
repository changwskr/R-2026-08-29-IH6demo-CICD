package com.example.h3demo.deposite.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.h3demo.deposite.business.as.DepositeAS;
import com.example.h3demo.deposite.transfer.DepositeCDTO;

@RestController
public class RetController {

    private final DepositeAS as;

    @Autowired
    public RetController(DepositeAS pvAS11007) {
        this.as = pvAS11007;
    }


    // http://127.0.0.1:8080/rest/get?id=2&name=홍길동&address=대치동&contact=로이안
    // http://127.0.0.1:8080/rest/post?id=2&name=홍길동2&address=대치동2&contact=로이안2
    // http://127.0.0.1:8080/rest/put?id=3&name=홍길동3&address=대치동3&contact=로이안3
    // http://127.0.0.1:8080/rest/delete?id=3&name=홍길동2&address=대치동2&contact=로이안2
    
    
    
	@PutMapping("/rest/put")
	public Object executePUT(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restPUT(depositeCDTO);
		
        return cdto;

	}

	@PostMapping("/rest/post")
	public Object executePOST(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restPOST(depositeCDTO);
		
        return cdto;

	}

	@DeleteMapping("/rest/delete")
	public Object executeDELETE(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restDELETE(depositeCDTO);
		
        return cdto;

	}

	@GetMapping("/rest/get")
	public Object executeGET(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restGET(depositeCDTO);
		
        return cdto;

	}

	@GetMapping("/rest/getall")
	public Object executeGETALL(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restGETALL(depositeCDTO);
		
        return cdto;

	}

	// 전체 이름을 가지고 조회할 경우
	@GetMapping("/rest/get/name")
	public Object executeGetName(DepositeCDTO depositeCDTO) {
		
		System.out.println("-----------------" + depositeCDTO.toString());
		
		DepositeCDTO cdto = as.restGetName(depositeCDTO);
		
        return cdto;

	}

	// 이름의 일부만 가지고 조회해야 될 경우
	@GetMapping("/rest/get/search")
	public Object executeGetLikeName(DepositeCDTO depositeCDTO) {
		
		System.out.println("-----------------" + depositeCDTO.toString());
		
		DepositeCDTO cdto = as.restGetLikeName(depositeCDTO);
		
        return cdto;

	}

	
}
