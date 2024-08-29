package com.example.h3demo.deposite.business.dc.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.h3demo.deposite.business.dc.dao.model.DMember;
import com.example.h3demo.deposite.business.dc.dao.model.H3Member;


public interface IH3DepositeSpringDataJpaDAO extends JpaRepository<DMember, Long>, IH3DepositeDAO {
	
	// JPOL select m from dmember m where m.name = ?
    @Override
    Optional<DMember> findByName(String name);

//    @Override
//    Optional<DMember> findByNameAndId(String name, Long id);

}
