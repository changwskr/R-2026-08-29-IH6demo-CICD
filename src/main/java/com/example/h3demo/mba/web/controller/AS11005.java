package com.example.h3demo.mba.web.controller;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import com.example.h3demo.mba.business.pc.MBA11005PC;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.h3demo.mba.web.formdata.IO11005Form;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@Controller
public class AS11005 {
	
	/**
	 * http://127.0.0.1:8080/txhome
	 * txhome.html 호출
	 * @param model
	 * @return
	 */
    @GetMapping("txhome")
    public String txhome(Model model){ 
    	
    	// txhome.html 페이지는 다음 2가지 스타일의 호출을 한다.
    	// http://127.0.0.1:8080/txstyle/11006.html
    	// http://127.0.0.1:8080/txstyle/11005.html
    	
        return "txhome"; 
    }

	/**
	 * (요청) http://127.0.0.1:8080/11005
	 * (응답) JSON 타입으로 리턴한다. 이유는 ResponseBody를 리턴한다. JSON 객체로 리턴한다.
	 * 
	 */
    @PostMapping("/post/11005")
    @ResponseBody
    public Object execute(IO11005Form form){
    	
    	System.out.println("==11005================================================");
    	System.out.println("IO 셋팅");
    	
    	// 폼데이타 이전
    	MBAIO11005DTO io = new MBAIO11005DTO();
    	io.setCompany(form.getCompany());
    	io.setId(form.getId());
    	io.setIn(form.getIn());
    	io.setCompany(form.getCompany());
    	io.setOut(form.getOut());
    	io.setId(form.getId());
    	io.setName(form.getName());
    	io.setTxcode(form.getTxcode());
    	
	
    	// IO전문 셋팅
    	
    	System.out.println("AS " + io.toString());
    	
    	System.out.println("==================================================");
    	System.out.println("PC - DC - DAO 호출");
        //==================================================
        // PC 호출 - DC 호출
        //==================================================
        MBA11005PC pc = new MBA11005PC();
        pc.execute(io);

    	System.out.println("==================================================");
    	System.out.println("클라이언트 정보 셋팅");
    	io.setOut(io.toString());

    	
    	System.out.println("클라이언트 리턴");

        return io; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.
        

    }

    /**
     * http://127.0.0.1:8080/post/11006
     * @param form
     * @param model
     * @return
     */
    @PostMapping("/post/11008")
    public Object execute_11006(IO11005Form form, Model model){
    	
    	System.out.println("=======11007===========================================");
    	System.out.println("IO 셋팅");
    	
    	// 폼데이타 이전
    	MBAIO11005DTO io = new MBAIO11005DTO();
    	
    	io.setCompany(form.getCompany());
    	io.setId(form.getId());
    	io.setIn(form.getIn());
    	io.setCompany(form.getCompany());
    	io.setOut(form.getOut());
    	io.setId(form.getId());
    	io.setName(form.getName());
    	io.setRouting_page("R11006");
    	io.setTxcode(form.getTxcode());
    	
	
    	// IO전문 셋팅
    	
    	System.out.println("AS " + io.toString());
    	
    	System.out.println("==================================================");
    	System.out.println("PC - DC - DAO 호출");
        //==================================================
        // PC 호출 - DC 호출
        //==================================================
        MBA11005PC pc = new MBA11005PC();
        pc.execute(io);

    	System.out.println("==================================================");
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