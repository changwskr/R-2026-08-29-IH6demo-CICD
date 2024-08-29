package com.example.h3demo.mba.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	// http://127.0.0.1:8080/hello
	
    @GetMapping("hello")
    public String hello(Model model){
    	System.out.println("hello controller------------------in");
    	
    	// 모델이라는 객체에 속성변수에 값을 저장한다.
        model.addAttribute("data", "roian hello!!");
        
        System.out.println("model : data=roian hello");
        System.out.println("hello controller------------------out, route to hello.html");
        
        return "hello"; //templates 밑에 있는 파일명이 hello인걸 찾음 이걸 viewResolver가 처리해주는것
        // hello.html
        // <p th:text="'안녕하세요.(roian) ' + ${data}" >안녕하세요. 손님</p>

    }


}