package com.example.h3demo.hello.web.controller;

import com.example.h3demo.deposite.business.as.DepositeAS;
import com.example.h3demo.deposite.business.dto.DepositeDDTO;
import com.example.h3demo.deposite.transfer.DepositeCDTO;
import com.example.h3demo.deposite.web.transfer.DepositeFormData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

/**
 * API 방식으로 변경한다.
 * 여기서는 문자열을 리턴하는 것이 아니라 객체로 리턴할 경우 어떻게 되는 가
 * 
 */
@RestController
@RequestMapping(value="hello")

public class HelloworldCTL {

	/**
	 * http://127.0.0.1:8080/hello/helloworldhome
	 * RestController 방식으로 리턴된다.
	 * Controller 방식이면 templetes의 html이 리턴된다.
	 * @param model
	 * @return
	 */
    @GetMapping("helloworldhome")
    public String HelloWorldHome(Model model){
    	
		System.out.println("GET-" + "helloworld/helloworldhome");
        return "helloworld/helloworldhome";
    }

	//	http://127.0.0.1:9090/hello/roian/jws
	@RequestMapping(value="/{firstName}/{lastName}",method = RequestMethod.GET)
	public String hello( @PathVariable("firstName") String firstName,
						 @PathVariable("lastName") String lastName) {

		if( firstName.equals("helloworldhome")){
			System.out.println("[first] " + firstName);
		}

		return String.format("{\"message\":\"Hello %s %s\"}", firstName, lastName);
	}




}