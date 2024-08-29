package com.example.h3demo.mba.business.as;

import java.util.List;
import java.util.Optional;

import com.example.h3demo.mba.business.dc.dao.MemoryMemberRepository;
import com.example.h3demo.mba.business.dc.dao.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// 이선언으로 스프링은 memberservice를 객체화에서 컨테이너에서 관리한다.
@Service
public class MemberService {
    private final MemoryMemberRepository memberRepository;


//    public MemberService(MemberRepositoryImplMemory memberRepository) {
//        this.memberRepository = memberRepository;
//    }
    
    // 서비스가 시작할때 메모리데이타베이스를 만든다.
    // 여기서 보면 MemoryMemberRepository 인스턴스를 외부에서 인젝션하는 선언이다. 이것이 DI이다.
    // 스프링의 DI정의방식의 예이다.
    // public MemberService(MemoryMemberRepository memberRepository) {
    // 이 선언을 @Autowired로 바꾸어 보자
    // @Autowired
    // public MemberService(MemoryMemberRepository memberRepository) {
    // 이렇게 하면 스프링은 MemberService 와 MemoryMemberRepository를 연결한다.
    // 그런데 아직 할일이 남았다.
    // MemoryMemberRepository 이 객체도 스프링에서 관리해주어야 된다. 무엇을 해야 되는가
    // MemberController - MemberService - MemoryMemberRepository
    // 이 연결은 Autowired이다
    // 그리고 컨테이너에서 관리할 대상이라고 명시하는 것은 Service, Bean이다.

    @Autowired
    public MemberService(MemoryMemberRepository memberRepository) {
		// TODO Auto-generated constructor stub
        this.memberRepository = memberRepository;

	}

    // 이것은 자신이 직접 자신의 객체를 선언하는 방식이다.
    // 이것은 DI가 아니다.
	public MemberService() {
		this.memberRepository = new MemoryMemberRepository();
		// TODO Auto-generated constructor stub
	}

	/**
     * 회원가입
     * */
    public Long join(Member member){

    	// 같은 이름이 있는 중복 회원 X
    	// 회의의 이름으로 메모리에서 찾는다.
        Optional<Member> result = memberRepository.findByName(member.getName());
        
        result.ifPresent(m -> {
            throw new IllegalStateException("이미 존재하는 회원입니다");
        });
        

        //위의 방식에서 아래방식으로 코딩
        //로직이 들어가면 메소드로 뺀다
        validateDuplicateMember(member); //중복 회원 검증
        
        memberRepository.save(member);
        return member.getId();
    }

    private void validateDuplicateMember(Member member) {
        memberRepository.findByName(member.getName())
            .ifPresent(m -> {
                throw new IllegalStateException("이미 존재하는 회원입니다");
            });
    }
    /**
     * 전체 회원 조회
     * */
    public List<Member> findMembers() {
        return memberRepository.findAll();
    }

    public Optional<Member> findOne(Long memberId){
        return memberRepository.findById(memberId);
    }
}