package com.example.h3demo.deposite.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.h3demo.deposite.business.as.DepositeAS;
import com.example.h3demo.deposite.transfer.DEP80001CDTO;
import com.example.h3demo.deposite.web.transfer.DepositeFormData;
import com.example.h3demo.framework.transfer.SKCommonCDTO;
import com.example.h3demo.framework.transfer.SKData;
import org.springframework.web.bind.annotation.RestController;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@RestController
public class Dep8001Ctl {
	
    private final DepositeAS as;

	@Autowired
    public Dep8001Ctl(DepositeAS pvAS11007) {
        this.as = pvAS11007;
    }

    /**
     * http://127.0.0.1:8080/deposite/8001
     * @param form
     * @param model
     * @return
     */
    @PostMapping("/deposite/8001")
    public Object execute(DepositeFormData form, Model model){
    	
    	// 폼데이타 이전


    	DEP80001CDTO io = new DEP80001CDTO();
    	
    	io.setCompany(form.getCompany());
    	io.setId(form.getId());
    	io.setIn(form.getIn());
    	io.setCompany(form.getCompany());
    	io.setOut(form.getOut());
    	io.setId(form.getId());
    	io.setName(form.getName());
    	io.setRouting_page("/deposite/depositeR11007");
    	io.setTxcode(form.getTxcode());
    	

    	// IO전문 셋팅
		System.out.println( "AS-" + io.toString());
    	
        //==================================================
        // AS 호출
        //==================================================
    	System.out.println("-[AS11007 호출]");
        io = as.execute(io);

    	System.out.println("클라이언트 정보 셋팅");
    	io.setOut(io.toString());

    	
    	// 모델이라는 객체에 속성변수에 값을 저장한다.
    	model.addAttribute("id", io.getId());
    	model.addAttribute("in", io.getIn());
        model.addAttribute("out", io.getOut());
        model.addAttribute("company", io.getCompany());
        model.addAttribute("name", io.getName());
        model.addAttribute("txcode", io.getTxcode());
        model.addAttribute("routepage", io.getRouting_page());
        

    	System.out.println("클라이언트 리턴");

        return io.getRouting_page(); //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.
        

    }


}