package com.example.h3demo.deposite.web.controller;

import com.example.h3demo.deposite.business.as.DepositeAS;
import com.example.h3demo.deposite.transfer.DEP80001CDTO;
import com.example.h3demo.deposite.web.transfer.DepositeFormData;
import com.example.h3demo.framework.transfer.SKCommonCDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@RestController
public class Dep8001RestController {

    private final DepositeAS as;

	@Autowired
    public Dep8001RestController(DepositeAS pvAS11007) {
        this.as = pvAS11007;
    }

    /**
     * http://127.0.0.1:8080/deposite/8001
     * @param form
     * @param model
     * @return
     */
    @PostMapping("/deposite/8002")
    public Object execute(DEP80001CDTO cdto){
    	

    	cdto.setRouting_page("/deposite/depositeR11007");

    	// IO전문 셋팅
		System.out.println( "AS-" + cdto.toString());
    	
        //==================================================
        // AS 호출
        //==================================================
    	System.out.println("-[AS11007 호출]");
        cdto = as.execute(cdto);

    	System.out.println("클라이언트 정보 셋팅");
    	cdto.setOut(cdto.toString());


    	System.out.println("클라이언트 리턴");

        return cdto; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.
        

    }


}