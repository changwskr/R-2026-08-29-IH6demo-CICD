package com.example.h3demo.mba.business.dc.vo;

import java.util.Objects;

public final class MemberVO {
	
    private final Long id; // 시스템이 정하는 아이디
    private final String name;

    public MemberVO(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    // Overriding equals and hashCode for value comparison
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MemberVO memberVO = (MemberVO) o;
        return name.equals(memberVO.name) && id.equals(memberVO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }


}
