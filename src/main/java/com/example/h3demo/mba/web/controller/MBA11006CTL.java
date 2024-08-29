package com.example.h3demo.mba.web.controller;

import java.util.List;

import com.example.h3demo.mba.transfer.MBAIO11005DTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.h3demo.mba.web.formdata.IO11005Form;
import com.example.h3demo.mba.business.as.MBA11006AS;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@Controller
public class MBA11006CTL {
	
    private final MBA11006AS as;

    @Autowired
    public MBA11006CTL(MBA11006AS mba11006as) {
        this.as = mba11006as;
        System.out.println("AS11006 = " + mba11006as.getClass());
    }

	/**
	 * http://127.0.0.1:8080/txhome2
	 * txhome.html 호출
	 * @param model
	 * @return
	 */
    @GetMapping("txhome2")
    public String txhome(Model model){ 
    	
    	// txhome.html 페이지는 다음 2가지 스타일의 호출을 한다.
    	// http://127.0.0.1:8080/txstyle/11006.html
    	// http://127.0.0.1:8080/txstyle/11005.html
    	
        return "txhome"; 
    }


    /**
     * http://127.0.0.1:8080/post/11006
     * @param form
     * @param model
     * @return
     */
    @PostMapping("/post/11006")
    public Object execute(IO11005Form form, Model model){
    	
    	System.out.println("=======11006===========================================");
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
    	System.out.println("AS-" + io.toString());
    	
        //==================================================
        // AS 호출
        //==================================================
    	System.out.println("-[AS11006 호출]");
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

    @GetMapping("/members/pnew")
    public String createForm() {
        return "members/pcreateMemberForm";
    }

    @PostMapping("/members/pnew")
    public String create(IO11005Form form) {

    	// IO전문 셋팅
    	System.out.println("AS-" + form.toString());

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


        as.join(io);
        
    	// IO전문 셋팅
    	System.out.println("create end===========");


        return "redirect:/txhome";
    }

    @GetMapping("/members/all")
    public String list(Model model){
    	List<MBAIO11005DTO> members = as.findMembers();    	

    	model.addAttribute("members", members);

        return "members/pmemberList";
    }

}