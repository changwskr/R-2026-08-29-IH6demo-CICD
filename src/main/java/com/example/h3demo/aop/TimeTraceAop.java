package com.example.h3demo.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TimeTraceAop {
//    com.example.h3demo.deposite.business.as
//    @Around("execution(* com.example.h3demo..*(..))")    // 원하는 부분만 접근할 수있다.
    @Around("execution(* com.example.h3demo.*.business.as..*(..))")    // 원하는 부분만 접근할 수있다.

    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        System.out.println("START : " + joinPoint.toString());
        try {
            return joinPoint.proceed();
        } finally {
            long finish = System.currentTimeMillis();
            long timeMs = finish - start;
            System.out.println("EMD = " + joinPoint.toString() + " " + timeMs + "ms");
        }
    }
}
