package com.example.h3demo.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TransactionFilterAspect {

    // 거래가 발생하기 전 실행할 로직
    @Before("execution(* com.example.h3demo.*.*(..))")
    public void beforeTransaction() {
        System.out.println("거래가 발생하기 전 필터 로직 실행");
        // 여기에 원하는 로직을 추가
    }

    // 거래가 성공적으로 완료된 후 실행할 로직
    @AfterReturning("execution(* com.example.h3demo.*.*(..))")
    public void afterTransactionSuccess() {
        System.out.println("거래가 성공적으로 완료된 후 필터 로직 실행");
        // 여기에 원하는 로직을 추가
    }

    // 거래가 종료된 후(성공, 실패와 관계없이) 실행할 로직
    @After("execution(* com.example.h3demo.*.*(..))")
    public void afterTransaction() {
        System.out.println("거래 종료 후 필터 로직 실행");
        // 여기에 원하는 로직을 추가
    }
}
