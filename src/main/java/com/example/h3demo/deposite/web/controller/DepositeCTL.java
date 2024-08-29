package com.example.h3demo.deposite.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.h3demo.deposite.business.as.DepositeAS;
import com.example.h3demo.deposite.business.dc.dao.model.DCustomer;
import com.example.h3demo.deposite.business.dto.DepositeDDTO;
import com.example.h3demo.deposite.transfer.DepositeCDTO;
import com.example.h3demo.deposite.web.transfer.DepositeFormData;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@Controller
public class DepositeCTL {
	
    private final DepositeAS as;

    @Autowired
    public DepositeCTL(DepositeAS pvAS11007) {
        this.as = pvAS11007;
        System.out.println("AS11007 = " + pvAS11007.getClass());
    }

	/**
	 * http://127.0.0.1:8080/depositehome
	 * txhome.html 호출
	 * @param model
	 * @return
	 */
    @GetMapping("depositehome")
    public String CashcardHome(Model model){ 
    	
    	// txhome.html 페이지는 다음 2가지 스타일의 호출을 한다.
    	// http://127.0.0.1:8080/txstyle/11006.html
    	// http://127.0.0.1:8080/txstyle/11005.html
		System.out.println("GET-" + "deposite/depositehome");
        return "deposite/depositehome"; 
    }

    
    @GetMapping("/deposite/11007/exe")
    public String CasCardPostExe(Model model){

		System.out.println("GET-" + "deposite/deposite-createMemberForm-execute");

        return "deposite/deposite-createMemberForm-execute"; 
    }


    /**
     * http://127.0.0.1:8080/post/11006
     * @param form
     * @param model
     * @return
     */
    @PostMapping("/deposite/11007/exe")
    public Object execute(DepositeFormData form, Model model){
    	
    	System.out.println("IO 셋팅");
    	
    	// 폼데이타 이전
    	DepositeCDTO io = new DepositeCDTO();
    	
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
    	System.out.println("AS-" + io.toString());
    	
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
        

    	System.out.println("POST-" + "deposite/deposite11007");

        return "deposite/deposite11007"; //템플릿을 찾지 않고 그대로 API 방식으로 클라이언트로 내려간다.
        

    }

    //Get을 통해서 form action 페이지를 호출한다.
    @GetMapping("/deposite/11007/new")
    public String createForm() {
        return "deposite/deposite-createMemberForm";
    }

    //GET를 통해 받은 페이지에서 POST 요청을 한다.
    @PostMapping("/deposite/11007/new")
    public String create(DepositeFormData form) {

    	// IO전문 셋팅
    	System.out.println("AS-" + form.toString());

    	// 폼데이타 이전
    	DepositeDDTO io = new DepositeDDTO();
    	
    	io.setCompany(form.getCompany());
    	io.setId(form.getId());
    	io.setCompany(form.getCompany());
    	io.setId(form.getId());
    	io.setName(form.getName());


        as.join(io);
        
    	// IO전문 셋팅
    	System.out.println("create end===========");

		System.out.println("GET-" + "redirect:/depositehome");

        return "redirect:/depositehome";
    }

    @GetMapping("/deposite/11007/all")
    public String list(Model model){
    	List<DepositeDDTO> members = as.findMembers();    	

    	model.addAttribute("members", members);

		System.out.println("GET-" + "deposite/deposite-memberList");

        return "deposite/deposite-memberList";
    }
    
    
	@PutMapping("/executePUT")
	@ResponseBody
	public Object executePUT(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restPUT(depositeCDTO);
		
        return cdto;

	}

	@PostMapping("/executePOST")
	@ResponseBody
	public Object executePOST(DepositeCDTO depositeCDTO) {
		
		DepositeCDTO cdto = as.restPOST(depositeCDTO);
		
        return cdto;

	}


}