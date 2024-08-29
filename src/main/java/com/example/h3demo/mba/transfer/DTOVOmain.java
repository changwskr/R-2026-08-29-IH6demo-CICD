package com.example.h3demo.mba.transfer;

/*
 * DTO(Data Transfer Object)와 VO(Value Object)는 Java에서 데이터 전달과 저장을 위해 사용되는 객체입니다. 두 가지의 주된 차이점은 다음과 같습니다:

DTO (Data Transfer Object):
주로 데이터 전송을 목적으로 사용됩니다.
로직을 포함하지 않으며, 데이터의 전송에 중점을 둡니다.
일반적으로 setter와 getter 메서드를 포함합니다.
VO (Value Object):
주로 값을 저장하기 위해 사용됩니다.
불변 객체로 설계되는 경우가 많습니다.
값을 변경할 수 없도록 setter를 제공하지 않고 생성자만 사용하기도 합니다.
아래에 DTO와 VO를 사용하는 Java 예제를 제공합니다:
 */


import com.example.h3demo.mba.business.dc.dao.model.User;
import com.example.h3demo.mba.business.dc.vo.UserVO;

public class DTOVOmain {
    public static void main(String[] args) {
        // Using DTO
        User user = new User("john_doe", "john@example.com");
        System.out.println("DTO Username: " + user.getUsername());
        user.setUsername("jane_doe");
        System.out.println("Updated DTO Username: " + user.getUsername());

        // Using VO
        UserVO userVO = new UserVO("john_doe", "john@example.com");
        System.out.println("VO Username: " + userVO.getUsername());

        // Uncommenting the following line will cause a compilation error because there is no setter
        // userVO.setUsername("jane_doe");

        // Value comparison
        UserVO anotherUserVO = new UserVO("john_doe", "john@example.com");
        System.out.println("UserVOs are equal: " + userVO.equals(anotherUserVO));
    }
}

