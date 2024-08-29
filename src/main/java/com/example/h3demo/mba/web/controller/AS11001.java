package com.example.h3demo.mba.web.controller;

import com.example.h3demo.mba.transfer.IOArea;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AS11001 {
	
	IOArea ioarea = new IOArea("","","","");
	
    @GetMapping("11001")
    public String execute(Model model){
    	
    	ioarea.setTxcode("11001");
    	ioarea.setRouting_page("11001");
    	
    	System.out.println("Model model info : \n" + model.toString());
    	
    	
    	// IO전문 셋팅
    	ioarea.setIn("nothing");
    	ioarea.setOut("kkkuuu1234");
    	
    	System.out.println(ioarea.toString());
    	
    	// 모델이라는 객체에 속성변수에 값을 저장한다.
    	model.addAttribute("txcode", ioarea.getTxcode());
    	model.addAttribute("in", ioarea.getIn());
    	model.addAttribute("key", "roian");
        model.addAttribute("out", ioarea.getOut());

    	System.out.println("==================================================");
    	System.out.println("PC - DC - DAO 호출");
        //==================================================
        // PC 호출 - DC 호출
        //==================================================
        

    	System.out.println("==================================================");
    	System.out.println("클라이언트 리턴");

        return ioarea.getRouting_page(); 

    }

    

}