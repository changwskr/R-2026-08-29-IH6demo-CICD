package com.example.h3demo.mba.business.dc.vo;

import java.util.Objects;

public final class UserVO {
    private final String username;
    private final String email;

    // Constructor
    public UserVO(String username, String email) {
        this.username = username;
        this.email = email;
    }

    // Getter methods only, no setters
    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    // Overriding equals and hashCode for value comparison
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserVO userVO = (UserVO) o;
        return username.equals(userVO.username) && email.equals(userVO.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(username, email);
    }
}
