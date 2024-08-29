package com.example.h3demo.mba.web.controller;

import com.example.h3demo.mba.business.dc.dao.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.h3demo.mba.web.formdata.MemberForm;
import com.example.h3demo.mba.business.as.MemberService;

import java.util.List;


// 이렇게 어노테이션으로 CONTROLLER라고 선언하면
// 스프링은 이것을 자신의 컨테이이너에 이것을 객체로 저장하고 관리한다.
// @Controller 선언을 스프링이 만나면 스프링은 이 클래스를 객체화해서 컨테이너에 저장하여 관리한다는 말이다.
// 이것이 Dependency Injection이다.
// 즉 디펜던시 인젝션은 서로 상호간 관계가 있는 객체가 자신이 아닌 다른곳에서 객체를 생성하여 자신이 내부에서 
// 정의할 객체를 대신 받아서 넣는 것이다.
// 즉 객체를 내가 만드는 것이 아니라 상호관계의 요청자에서 인스턴스를 생성하여 받아 이것으로 대체한다는 말이다.
// 즉 하나만 선언해서 여러곳에서 사용하자는 말이다.

@Controller
public class MemberController {
    private final MemberService memberService;

// ======================================================================
// 스프링에서 직접 DI해서 사용하는 타입
// 보면 MemberService를 다른곳에서 생성된 것을 Injection하고 있다.    
// Autowired 해놓으면 MemberService를 찾는다.
// 그런데 여기서 문제
// 그럼 스프링컨테이너 입장에선 MemberService가 자신이 관리할 객체인지 아닌지 분간할 뭔가가 필요하다.
// 그것이 @Service 어노테이션이다.    
// @Service
// public class MemberService {
// Autowired 이라는 뜻은 여기서는
// MemberController - MemberService 가 서로 연결된다는 뜻이다.    
// Autowired는 스프링이 관련련 컴포넌트를 찾는다.
// 우리가 Service, Controller라고 선언하면 이것은 내부적으로 컴포넌트로 관리된다는 말이다.
//  @Component  
// 스프링은 이 컴포넌트를 스캔해서 저장하고 관리한다. 이 방식이 컴포넌트 스캔방식이다.
// 스프링에서 왠만한 객체는 스프링으로 등록해서 사용한다.
// 스프링은 @Component, @Controller, @Service, @Repository 로 선언된 모든 클래스는 스프링에서 객체로 관리된다.
// (의문) 그럼 이런 어노테이션을 아무되나 만들면 되나   
// 결론은 안된다. 이다. 어디서 부터 되나. main 클래스가 있는 하위의 패키지들만 된다.    
// com.example.hellospring 이하의 패키지만 스프링은 객체를 만들고 관리한다.    
// 스프링에서 등록되는 객체는 다 싱글톤 타입으로 등록한다.    하나만 등록하여 서로 공유한다.
// 하지만 설정으로 싱글톤이 안되게 할수 도 있다.    
// ======================================================================    
    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
        System.out.println("memberService = " + memberService.getClass());
    }

// ======================================================================
// 스프링의 DI를 사용하지 않고 직접 선언한다.
// 자 그런데 이렇게 하면 무슨 문제가 발생할까
// MemberService는 여기서만 사용하는 것이 아닌 여러곳에서 사용할 것이다.
// 이러면 객체를 계속해서 생성하고 JVM은 자신이 정한 원칙이 허용되는 한 생성관리를 진행할 것이다.
//   객체관리가 어렵게 될것이다.
//   그럼 어떻게 할까 이것을 스프링에게 넘기는 것이다. 그리고 필요하면 요청하는 것이다.
//   이것이 어노테이션으로 서로 약속하는 것이다.
// ======================================================================    
//     public MemberController() {
//         this.memberService = new MemberService();
//         System.out.println("memberService = " + memberService.getClass());
//     }

    

    @GetMapping("/members/new")
    public String createForm() {
        return "members/createMemberForm";
    }

    @PostMapping("/members/new")
    public String create(MemberForm form) {
        Member member = new Member();
        member.setName(form.getName());

        memberService.join(member);

        return "redirect:/";
    }

    @GetMapping("/members")
    public String list(Model model){
        List<Member> members = memberService.findMembers();
        model.addAttribute("members", members);

        return "members/memberList";
    }
}