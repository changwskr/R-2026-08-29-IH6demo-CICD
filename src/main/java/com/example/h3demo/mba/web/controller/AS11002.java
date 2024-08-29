package com.example.h3demo.mba.web.controller;

import com.example.h3demo.mba.transfer.MBAIO11002DTO;
import com.example.h3demo.mba.business.pc.MBA11002PC;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * MVC 타입으로 템플릿으로 만들어진 정보를 리턴한다.
 * 클라이언트는 HTML를 받는다.
 */
@Controller
public class AS11002 {
	
	/**
	 * http://127.0.0.1:8080/11002?IOin=aaaaaop[o[90909090asfsdafsa
	 */
    @GetMapping("11002")
    public String execute(@RequestParam("IOin") String IOin, Model model){
    	
    	System.out.println("==================================================");
    	System.out.println("IO 셋팅");
    	MBAIO11002DTO ioarea = new MBAIO11002DTO("11002","11002","","", "");
	
    	// IO전문 셋팅
    	ioarea.setIn(IOin);
    	ioarea.setOut(IOin);
    	ioarea.setId("333"); //일단 강제 셋팅
    	
    	System.out.println("AS " + ioarea.toString());
    	
    	System.out.println("==================================================");
    	System.out.println("PC - DC - DAO 호출");
        //==================================================
        // PC 호출 - DC 호출
        //==================================================
        MBA11002PC pc = new MBA11002PC();
        pc.execute(ioarea);

    	System.out.println("==================================================");
    	System.out.println("클라이언트 정보 셋팅");
    	ioarea.setOut(ioarea.toString());

    	
    	// 모델이라는 객체에 속성변수에 값을 저장한다.
    	model.addAttribute("txcode", ioarea.getTxcode());
    	model.addAttribute("IN", ioarea.getIn());
        model.addAttribute("OUT", ioarea.getOut());

    	System.out.println("클라이언트 리턴");

        return ioarea.getRouting_page();

    }

    

}