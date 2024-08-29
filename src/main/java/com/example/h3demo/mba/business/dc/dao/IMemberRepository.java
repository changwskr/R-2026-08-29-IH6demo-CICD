package com.example.h3demo.mba.business.dc.dao;

import java.util.List;
import java.util.Optional;

import com.example.h3demo.mba.business.dc.dao.model.Member;

public interface IMemberRepository {
	
	Member save(Member member);
	Optional<Member> findById(Long id);
	Optional<Member> findByName(String name);
	List<Member> findAll();

}
